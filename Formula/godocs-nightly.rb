class GodocsNightly < Formula
  desc "Evidence-ETL CLI (nightly build from main) -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "2026.06.27"
  license :cannot_represent

  conflicts_with "godocs", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-arm64.tar.gz"
      sha256 "3781936204cb194c84e64c1d3df8057889c072d3ce4608da2e77d706c5cbbd8c"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-amd64.tar.gz"
      sha256 "8201fee75691d3bbcb814d61fae938773954dcf0b2eca2425a72e9955e866d9a"
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
