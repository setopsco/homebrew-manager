class SetopsCli < Formula
  desc "The only tool you need to run your cloud applications"
  homepage "https://setops.co"
  url "https://api.github.com/repos/setopsco/releases/releases/assets/477075221",
      header: "Accept: application/octet-stream"
  version "2.3.5"
  sha256 "90892060c10ecb2005092c874309e9670aa979425cad77b0f44084bbd3d042dd"
  # TODO: Update license (see https://docs.brew.sh/Formula-Cookbook)
  license :cannot_represent

  RELEASE_FILE_NAME = "setops-cli_v2.3.5_darwin_amd64".freeze

  def install
    bin.install RELEASE_FILE_NAME => "setops"

    # Sets execution permission explicitly: required here to generate completions
    # would be done by homebrew after the installation
    system "chmod 555 #{bin}/setops"

    # Completions are optional: the CLI may exit non-zero (e.g. failing server version check),
    # which must not abort the installation.
    zsh_script = Utils.popen_read("#{bin}/setops", "completion", "zsh")
    (zsh_completion/"_setops").write zsh_script if $?.success? && !zsh_script.empty?

    bash_script = Utils.popen_read("#{bin}/setops", "completion", "bash")
    (bash_completion/"setops").write bash_script if $?.success? && !bash_script.empty?
  end

  test do
    system "setops"
  end
end
