class GodocsNightly < Formula
  desc "Evidence-ETL CLI (nightly build from main) -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "2026.06.20"
  license :cannot_represent

  conflicts_with "godocs", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-arm64.tar.gz"
      sha256 "74b916aa01eae261fc3a97429c7ecf2a71ebc32aed666f54b3ea333d3afdc606"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-amd64.tar.gz"
      sha256 "5a34fbd43eec8680e4bab6b37dc390c9064cc0257567bfc1328b88c63b2dc101"
    end
  end

  def install
    bin.install "godocs"
    bin.install "godocs-pdf-merge"
  end

  test do
    assert_match "nightly", shell_output("#{bin}/godocs --version")
  end
end
