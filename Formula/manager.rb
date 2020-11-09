class Manager < Formula
  desc "SetOps infrastructure manager – CLI & REST API for developers to manage stages, apps and services"
  homepage "https://zweitag.de"
  url "https://cefca4284b498ce2b82d43703c87fa81d1bcc3fe@api.github.com/repos/setopsco/manager/releases/assets/27964702",
  header: 'Accept: application/octet-stream' 
  version "0.0.5"
  sha256 "ac2435bb4c8ff1effe93a8348b55403596542216dc7f73c6808ce8974f190f84"
  # TODO: Update license (see https://docs.brew.sh/Formula-Cookbook)
  license "MIT"

  bottle :unneeded

  # TODO: Update name of the formula to decrease the chance of clonflicts

  GITHUB_HOMEBREW_TOKEN = "cefca4284b498ce2b82d43703c87fa81d1bcc3fe"

  def install
    bin.install 'setops-cli_v0.0.5_darwin_amd64' => 'setops'

    # TODO: install the completion scripts
    # bash_completion.install shell_output("#{bin}/setops completions bash")
    # zsh_completion.install shell_output("#{bin}/setops completions zsh") => '_setops'

    # TODO: Set the correct server address in setops.yml
  end

  test do
    system "false"
  end
end
