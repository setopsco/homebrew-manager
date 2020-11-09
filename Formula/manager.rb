class Manager < Formula
  desc 'SetOps infrastructure manager – CLI & REST API for developers to manage stages, apps and services'
  homepage 'https://zweitag.de'
  url 'https://cefca4284b498ce2b82d43703c87fa81d1bcc3fe@api.github.com/repos/setopsco/manager/releases/assets/27964702',
      header: 'Accept: application/octet-stream'
  version '0.0.5'
  sha256 'ac2435bb4c8ff1effe93a8348b55403596542216dc7f73c6808ce8974f190f84'
  # TODO: Update license (see https://docs.brew.sh/Formula-Cookbook)
  license 'MIT'

  bottle :unneeded

  # TODO: Update name of the formula to decrease the chance of clonflicts

  GITHUB_HOMEBREW_TOKEN = 'cefca4284b498ce2b82d43703c87fa81d1bcc3fe'.freeze
  RELEASE_FILE_NAME = 'setops-cli_v0.0.5_darwin_amd64'.freeze

  def install
    bin.install RELEASE_FILE_NAME => 'setops'

    # Sets execution permission explicitly: required here to generate completions
    # would be done by homebrew after the installation
    system "chmod 555 #{prefix}/bin/setops"

    # install the completion scripts
    system "#{prefix}/bin/setops"
    zsh_completions_temp = Tempfile.new('setops-manager-zsh-completions')
    zsh_completions_temp.write(Utils.popen_read("#{prefix}/bin/setops", 'completion', 'zsh'))
    zsh_completions_temp.rewind

    zsh_completion.install zsh_completions_temp.path => '_setops'

    zsh_completions_temp.close
    zsh_completions_temp.unlink

    bash_completions_temp = Tempfile.new('setops-manager-zsh-completions')
    bash_completions_temp.write(Utils.popen_read("#{prefix}/bin/setops", 'completion', 'bash'))
    bash_completions_temp.rewind

    bash_completion.install bash_completions_temp.path => 'setops'

    bash_completions_temp.close
    bash_completions_temp.unlink

    # TODO: Set the correct server address in setops.yml
  end

  test do
    system 'setops'
  end
end
