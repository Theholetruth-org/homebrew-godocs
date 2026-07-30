class Godocs < Formula
  desc "Evidence-ETL CLI -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "1.4.0"
  license :cannot_represent

  depends_on "mupdf-tools"
  depends_on "qpdf"

  conflicts_with "godocs-nightly", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.4.0/godocs-v1.4.0-macos-arm64.tar.gz"
      sha256 "a839efed10a4a520b9982e3c8eb6a770074d89ea188893e58d4d3370119b9730"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.4.0/godocs-v1.4.0-macos-amd64.tar.gz"
      sha256 "afdf1e45dc8fdc106fc484aad8f747f8e75425320636b802a13d86360d1e6205"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.4.0/godocs-v1.4.0-linux-arm64.tar.gz"
      sha256 "25e25d3d16b6ecca48408544cc7253a3e62f740535e89602a222846d5fac1a28"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.4.0/godocs-v1.4.0-linux-amd64.tar.gz"
      sha256 "74e0021080eeededcb92755eb09950303cc3942378b7a5c1b89776c2a1600e34"
    end
  end

  def install
    bin.install "godocs"
    bin.install "godocs-pdf-merge"
    bash_completion.install "completions/godocs.bash" => "godocs"
    zsh_completion.install "completions/_godocs"
    man1.install "man/godocs.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/godocs --version")
  end
end
