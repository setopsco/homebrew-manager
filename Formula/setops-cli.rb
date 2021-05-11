class SetopsCli < Formula
  desc "The only tool you need to run your cloud applications"
  homepage "https://setops.co"

  on_macos do
    url "https://api.github.com/repos/setopsco/releases/releases/assets/35904653",
        header: "Accept: application/octet-stream"
    sha256 "50c22084b587a47f611be012f1b7e861ac6002bda0cbc525c109aca3586cc5c9"
  end

  on_linux do
    url "https://api.github.com/repos/setopsco/releases/releases/assets/35904649",
        header: "Accept: application/octet-stream"
    sha256 "de0498665ed9ba3420f7a26c48f501a8ee69fbe25d281863386af73648bc76d4"
  end

  version "0.2.2"
  # TODO: Update license (see https://docs.brew.sh/Formula-Cookbook)
  license :cannot_represent

  bottle :unneeded

  RELEASE_FILE_NAME = if OS.mac?
    "setops-cli_v0.2.2_darwin_amd64"
  else
    "setops-cli_v0.2.2_linux_amd64"
  end.freeze

  def install
    bin.install RELEASE_FILE_NAME => "setops"

    # Sets execution permission explicitly: required here to generate completions
    # would be done by homebrew after the installation
    system "chmod 555 #{bin}/setops"

    # install the completion scripts
    system "#{bin}/setops"
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
