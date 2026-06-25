class GodocsNightly < Formula
  desc "Evidence-ETL CLI (nightly build from main) -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "2026.06.25"
  license :cannot_represent

  conflicts_with "godocs", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-arm64.tar.gz"
      sha256 "7fd2c89fe6c5c045fd39b715273d2e4d6cd4f4d15bb392e59696045761a1eaf7"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-amd64.tar.gz"
      sha256 "79ed875408482a8603670af029cf12935bec339745bf4bddf40a7c0368ad0c60"
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
