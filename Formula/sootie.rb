class Sootie < Formula
  desc "Rust computer-use MCP runtime for desktop apps, browsers, screenshots, and vision grounding"
  homepage "https://github.com/joe223/sootie"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/joe223/sootie/releases/download/v0.1.0/sootie-0.1.0-macos-arm64.tar.gz"
      sha256 "3919b3d8d5e1bb6c700bc161ea9007067d8e5d2cbabc07030b479a59a5d31410"
    end

    on_intel do
      url "https://github.com/joe223/sootie/releases/download/v0.1.0/sootie-0.1.0-macos-x64.tar.gz"
      sha256 "daf6d46b20c3debc81ef3630f055236ddbb05b05cc134bda3aa4590ee966433b"
    end
  end

  depends_on "python@3.12" => :recommended

  def install
    bin.install "bin/sootie"
    pkgshare.install "share/sootie/vision-sidecar" if (buildpath/"share/sootie/vision-sidecar").exist?
  end

  def caveats
    <<~EOS
      Run setup after installation:
        sootie setup

      MCP server command:
        sootie serve
    EOS
  end

  test do
    assert_match "sootie_context", shell_output("#{bin}/sootie tools")
    assert_match "Create the user config", shell_output("#{bin}/sootie setup --help")
  end
end
