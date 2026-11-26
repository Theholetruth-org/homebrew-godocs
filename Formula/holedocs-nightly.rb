class HoledocsNightly < Formula
  desc "Evidence-ETL CLI (nightly build from main) -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "2026.11.26"
  license :cannot_represent

  depends_on "mupdf-tools"
  depends_on "qpdf"

  conflicts_with "holedocs", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-arm64.tar.gz"
      sha256 "a547340f74f25ca234facc8b6cf972f5c7122d448d2af6f87e7ecc98e2a360c7"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-amd64.tar.gz"
      sha256 "86560ca22c40c1a1dee449c7ffd22e6f977bf3d7a5d9d2f037490191764ce4d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-linux-arm64.tar.gz"
      sha256 "1548bff6239200bf6f14b347437aa951c3b927e4d20def9c2e40aa61ebf6c250"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-linux-amd64.tar.gz"
      sha256 "7ddff1598cf73cdfba2537ebf66fcbffc3fdd7054c7224458ad90c1000886324"
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
