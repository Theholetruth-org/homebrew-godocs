class GodocsNightly < Formula
  desc "Evidence-ETL CLI (nightly build from main) -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "2026.06.23"
  license :cannot_represent

  conflicts_with "godocs", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-arm64.tar.gz"
      sha256 "d62d73ac84d51051cdd272373ab1bc9bcb839ef5a203ad134b204e77ced54ae8"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-amd64.tar.gz"
      sha256 "b4e0971f2612834f3911293eb6bd624cd5074117bdb9b06c08c5721c289c5b93"
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
