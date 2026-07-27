class Godocs < Formula
  desc "Evidence-ETL CLI -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "1.3.1"
  license :cannot_represent

  conflicts_with "godocs-nightly", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.3.1/godocs-v1.3.1-macos-arm64.tar.gz"
      sha256 "270b2952c0f73fd6240c5a9d7063e05da3e1cb50b21a223b3d748f3bdb73de2a"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.3.1/godocs-v1.3.1-macos-amd64.tar.gz"
      sha256 "7cf7f6227f3269bda558461f654fbe2bd6280ad38850431610a1e9c0d08a5f0f"
    end
  end

  def install
    bin.install "godocs"
    bin.install "godocs-pdf-merge"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/godocs --version")
  end
end
