class PowerlineFonts < Formula
  desc "This font is for powerline"
  homepage "https://github.com/powerline/fonts"
  url "hhttps://github.com/powerline/fonts/archive/refs/tags/2015-12-04.tar.gz"
  version "20151204.0"
  sha256 "3a0b73abca6334b5e6bddefab67f6eb1b2fac1231817d95fc79126c8998c4844"
  revision 2
  head "https://github.com/powerline/fonts.git"

  depends_on "fontconfig" => :build
  depends_on "z80oolong/fonts/powerline-symbols" => :recommended

  def install
    fontpath = share/"fonts/Homebrew/powerline-fonts"
    fontpath.mkpath

    conf1 = etc/"fonts/conf.d/55-homebrew-powerline-fonts.conf"
    conf1.delete if conf1.exist?
    conf2 = etc/"fonts/conf.d/15-powerline-symbols-alias.conf"
    conf2.delete if conf2.exist?

    inreplace "./install.sh",
        'font_dir="$HOME/.local/share/fonts"',
        %Q(font_dir="#{share}/fonts/Homebrew/powerline-fonts")
    system "./install.sh"

    conf1.write(fonts_conf_xml(opt_share/"fonts"))
    conf2.write(powerline_symbols_conf_xml)
  end

  def powerline_symbols_conf_xml
    <<~EOS
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
      <fontconfig>
        <alias>
          <family>monospace</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Droid Sans Mono</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Droid Sans Mono Slashed</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Droid Sans Mono Dotted</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>DejaVu Sans Mono</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>DejaVu Sans Mono</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Envy Code R</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Inconsolata</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Lucida Console</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Monaco</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Pragmata</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>PragmataPro</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Menlo</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Source Code Pro</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Consolas</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Anonymous pro</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Bitstream Vera Sans Mono</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Liberation Mono</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Ubuntu Mono</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Meslo LG L</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Meslo LG L DZ</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Meslo LG M</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Meslo LG M DZ</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Meslo LG S</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Meslo LG S DZ</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>Ume Gothic</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
      </fontconfig>
    EOS
  end

  def fonts_conf_xml(path)
    <<~EOS
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
      <!-- /etc/fonts/fonts.conf file to configure system font access -->
      <fontconfig>
        <its:rules xmlns:its="http://www.w3.org/2005/11/its" version="1.0">
          <its:translateRule translate="no" selector="/fontconfig/*[not(self::description)]"/>
        </its:rules>

        <description>Default configuration file</description>

      <!--
          DO NOT EDIT THIS FILE.
          IT WILL BE REPLACED WHEN FONTCONFIG IS UPDATED.
          LOCAL CHANGES BELONG IN 'local.conf'.

          The intent of this standard configuration file is to be adequate for
          most environments.  If you have a reasonably normal environment and
          have found problems with this configuration, they are probably
          things that others will also want fixed.  Please submit any
          problems to the fontconfig bugzilla system located at fontconfig.org

          Note that the normal 'make install' procedure for fontconfig is to
          replace any existing fonts.conf file with the new version.  Place
          any local customizations in local.conf which this file references.

          Keith Packard
      -->

      <!-- Font directory list -->
          <dir>#{path}</dir>
      </fontconfig>
    EOS
  end

  def post_install
    system "#{Formula["fontconfig"].opt_bin}/fc-cache", "-vf"
  end

  def caveats
    <<~EOS
      If you want to use Truetype font `Powerline Fonts`, as follows make a symbolic link
      in directory /usr/share/fonts or $HOME/.local/share/fonts, and run `fc-cache`
      command.

        # cd /usr/share/fonts
        # ln -sf #{ENV["HOMEBREW_PREFIX"]}/share/fonts/Homebrew .
        # fc-cache -vf

        or

        $ cd $HOME/.local/share/fonts/Homebrew
        $ ln -sf #{ENV["HOMEBREW_PREFIX"]}/share/fonts/Homebrew .
        $ fc-cache -vf
    EOS
  end

  test do
    system Formula["fontconfig"].opt_bin/"fc-list"
  end
end
