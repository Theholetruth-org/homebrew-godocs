class HoledocsNightly < Formula
  desc "Evidence-ETL CLI (nightly build from main) -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "2026.09.07"
  license :cannot_represent

  depends_on "mupdf-tools"
  depends_on "qpdf"

  conflicts_with "holedocs", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-arm64.tar.gz"
      sha256 "e53bb18a1a1bda58dbf36cdfe4453f71b35ade987ef19bc64542e560e1f54ce5"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-amd64.tar.gz"
      sha256 "8777c7e28d27b6ce5c1ed9ab08e0e54ef44285fbf02ecc629236d754a0c0f03e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-linux-arm64.tar.gz"
      sha256 "40081101bdb53a28853727b10df7d1e502cb0fc6f3bac39c0e49966424a973ee"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-linux-amd64.tar.gz"
      sha256 "459482b7538e0e002918b03467cb8a0cd3e836df96275b5cf1c7621c92b17f2a"
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
    assert_match "nightly", shell_output("#{bin}/godocs --version")
  end
end
