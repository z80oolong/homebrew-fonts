class PowerlineFontpatcher < Formula
  desc "Script to patch arrow and symbol glyphs into fonts for usage with  Powerline and other compatible plugins."
  homepage "https://github.com/powerline/fontpatcher"
  url "https://github.com/powerline/fontpatcher/archive/c3488091611757cb02014ed7ed2f11be0208da83.tar.gz"
  version "0.1-beta"
  sha256 "6e5207c70f19b257812784666c4215561b5299497f28972395a883a75fc95800"
  head "https://github.com/powerline/fontpatcher.git"
  license "MIT License"

  depends_on "fontforge"

  def install
    libexec.install "./scripts"
    libexec.install "./fonts"

    (bin/"powerline-fontpatcher").write(<<~EOS)
    #!/bin/bash
    #{Formula["fontforge"].opt_bin}/fontforge -lang=py -script #{opt_libexec}/scripts/powerline-fontpatcher \
      --source-font #{opt_libexec}/fonts/powerline-symbols.sfd $@
    EOS
    (bin/"powerline-fontpatcher").chmod(0755)
  end

  test do
    system "false"
  end
end
