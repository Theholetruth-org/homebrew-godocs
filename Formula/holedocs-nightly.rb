class HoledocsNightly < Formula
  desc "Evidence-ETL CLI (nightly build from main) -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "2026.10.11"
  license :cannot_represent

  depends_on "mupdf-tools"
  depends_on "qpdf"

  conflicts_with "holedocs", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-arm64.tar.gz"
      sha256 "776d79c213c5b35f1c24c70f172ca3e916f50131fa7155ec524baa896c5b13f1"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-amd64.tar.gz"
      sha256 "2df99fb8c6e0847c226bd06c4695787ecabac151dbe238c9cfee5639f4dbaaa8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-linux-arm64.tar.gz"
      sha256 "75306b82b232a04e69fd0e2006968411fc918a1f0e240a5369fab850a01d5599"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-linux-amd64.tar.gz"
      sha256 "376a675068892f7e3322733850904795f7ab35caa56ed3aaede980ae31118998"
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
