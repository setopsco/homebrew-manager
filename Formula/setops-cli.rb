class SetopsCli < Formula
  desc "The only tool you need to run your cloud applications"
  homepage "https://setops.co"
  url "https://api.github.com/repos/setopsco/releases/releases/assets/68357269",
      header: "Accept: application/octet-stream"
  version "1.0.3"
  sha256 "65fb15488ba538c6fcf8d58754c5d82d36dd1ce21c332bd80f50948bf264d31f"
  # TODO: Update license (see https://docs.brew.sh/Formula-Cookbook)
  license :cannot_represent

  RELEASE_FILE_NAME = "setops-cli_v1.0.3_darwin_amd64".freeze

  def install
    bin.install RELEASE_FILE_NAME => "setops"

    # Sets execution permission explicitly: required here to generate completions
    # would be done by homebrew after the installation
    system "chmod 555 #{bin}/setops"

    # install the completion scripts
    zsh_completions_temp = Tempfile.new("setops-manager-zsh-completions")
    zsh_completions_temp.write(Utils.safe_popen_read("#{bin}/setops", "completion", "zsh"))
    zsh_completions_temp.rewind

    zsh_completion.install zsh_completions_temp.path => "_setops"

    zsh_completions_temp.close
    zsh_completions_temp.unlink

    bash_completions_temp = Tempfile.new("setops-manager-zsh-completions")
    bash_completions_temp.write(Utils.safe_popen_read("#{bin}/setops", "completion", "bash"))
    bash_completions_temp.rewind

    bash_completion.install bash_completions_temp.path => "setops"

    bash_completions_temp.close
    bash_completions_temp.unlink
  end

  test do
    system "setops"
  end
end
