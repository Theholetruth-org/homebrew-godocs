class Godocs < Formula
  desc "Evidence-ETL CLI -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "1.1.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.1.0/godocs-v1.1.0-macos-arm64.tar.gz"
      sha256 "0458740b9c04f02da64e5e0fb51838adce095628d58bfaf324ef31480973730b"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.1.0/godocs-v1.1.0-macos-amd64.tar.gz"
      sha256 "60e24c954f21238dde993a28e5b5787620ed3d87b3c7e12dc3d9d3279328be7d"
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
