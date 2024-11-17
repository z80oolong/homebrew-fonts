class Vlgothic < Formula
  desc "This font is VL Gothic and VL PGothic TTF Font"
  homepage "http://vlgothic.dicey.org/"
  url "https://mirrors.wikimedia.org/debian/pool/main/f/fonts-vlgothic/fonts-vlgothic_20200720.orig.tar.xz"
  sha256 "297a3813675fbea12c5813b55a78091c9a5946515ecbf9fde8b8102e01c579f4"
  license any_of: ["BSD-3-Clause-Modification", "mplus"]

  depends_on "fontconfig" => :build
  depends_on "z80oolong/fonts/powerline-fontpatcher" => :build
  depends_on "z80oolong/fonts/powerline-symbols"

  def install
    fontpath = share/"fonts/Homebrew/vlgothic"
    fontpath.mkpath

    conf1 = etc/"fonts/conf.d/55-homebrew-vlgothic.conf"
    conf1.delete if conf1.exist?
    conf2 = etc/"fonts/conf.d/15-powerline-symbols-vlgothic.conf"
    conf2.delete if conf2.exist?

    Pathname.glob("*.ttf").each do |ttf|
      system Formula["z80oolong/fonts/powerline-fontpatcher"].opt_bin/"powerline-fontpatcher", ttf
      fontpath.install ttf
      fontpath.install Pathname.glob("*Powerline.ttf")
    end

    conf1.write(fonts_conf_xml(opt_share/"fonts"))
    conf2.write(powerline_symbols_conf_xml)
  end

  def powerline_symbols_conf_xml
    <<~EOS
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
      <fontconfig>
        <alias>
          <family>VL Gothic</family>
          <prefer><family>PowerlineSymbols</family></prefer>
        </alias>
        <alias>
          <family>VL PGothic</family>
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
      If you want to use Truetype font `VL Gothic`, as follows make a symbolic link
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
    system "#{Formula["fontconfig"].opt_bin}/fc-list"
  end
end
