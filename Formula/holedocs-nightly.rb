class HoledocsNightly < Formula
  desc "Evidence-ETL CLI (nightly build from main) -- split, Bates-stamp, and RAG-chunk PDF disclosure bundles"
  homepage "https://github.com/Theholetruth-org/Hole-GoDocs"
  version "2026.09.24"
  license :cannot_represent

  depends_on "mupdf-tools"
  depends_on "qpdf"

  conflicts_with "holedocs", because: "both install the same godocs binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-arm64.tar.gz"
      sha256 "4d60c0f2f94c8f731be4ee49db78afe2edf94fef26ff6807716dc035da363c34"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-macos-amd64.tar.gz"
      sha256 "0c85913f8f85d409448f99ff98e807520553d9515b6c7856e67c58dea5354c60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-linux-arm64.tar.gz"
      sha256 "9d530d4e1c452d184de0c1c3a6145c2f83394f1a7771c4f2b9d1204bd7093fa1"
    else
      url "https://github.com/Theholetruth-org/Hole-GoDocs/releases/download/nightly/godocs-nightly-linux-amd64.tar.gz"
      sha256 "45b71e02dbbdd3ccd05eec1b812004075f4e073e524600c5ef0c9fd2a1b692b3"
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
