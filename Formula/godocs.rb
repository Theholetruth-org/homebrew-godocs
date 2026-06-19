class Godocs < Formula
  desc "Evidence-ETL CLI -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "1.2.0"
  license :cannot_represent

  conflicts_with "godocs-nightly", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.2.0/godocs-v1.2.0-macos-arm64.tar.gz"
      sha256 "5ca7acde972042418a4a80922c7e14ecc5b078f877b6bad18a9a5f3e0de946c1"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/v1.2.0/godocs-v1.2.0-macos-amd64.tar.gz"
      sha256 "d61a63fcc55fb79cd65e2945572e93660b5c181d5c65b0f62efa9457647e549c"
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
