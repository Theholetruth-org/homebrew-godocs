class HoledocsNightly < Formula
  desc "Evidence-ETL CLI (nightly build from main) -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "2026.10.18"
  license :cannot_represent

  depends_on "mupdf-tools"
  depends_on "qpdf"

  conflicts_with "holedocs", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-arm64.tar.gz"
      sha256 "6892a2957257a06f3617d336426c3136219446a031fda3005b2e9f96c34c4aad"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-amd64.tar.gz"
      sha256 "babe45668d203454248f7899c51297291ed72cca3f7aba7f27d4099bba9ba024"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-linux-arm64.tar.gz"
      sha256 "daddf8345e86d69bd4aac4f64a044098f3c7dbd7fd0c9c11b7f5d5a733d5698c"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-linux-amd64.tar.gz"
      sha256 "f460d88581001ee25c3c22620642829f92c8603dd80ad7c3f0a7a8561f9270ec"
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
