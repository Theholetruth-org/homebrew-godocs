class Godocs < Formula
  desc "Evidence-ETL CLI -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "1.3.0"
  license :cannot_represent

  conflicts_with "godocs-nightly", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.3.0/godocs-v1.3.0-macos-arm64.tar.gz"
      sha256 "e254c59b9bb8bfec12ad03f6880c0b9962bf0bf862d2118d3fdbd9b413a86154"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.3.0/godocs-v1.3.0-macos-amd64.tar.gz"
      sha256 "6cf7643837df12fa731b970405476dc2fbd7c92f98399a4138c09d26661cc573"
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
