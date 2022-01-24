class Umefont < Formula
  desc "Ume Gothic and Ume Mincho TTF Font."
  homepage "https://ja.osdn.net/projects/ume-font/wiki/FrontPage"
  url "https://mirrors.wikimedia.org/debian/pool/main/f/fonts-horai-umefont/fonts-horai-umefont_670.orig.tar.xz"
  version "670"
  sha256 "49ecb8f556c2448687d27bb485009ce51b90df26bb4f0c24c9e63b170c647c81"
  license "Mplus Font License"

  depends_on "fontconfig" => :build
  depends_on "z80oolong/fonts/powerline-fontpatcher" => :build
  depends_on "z80oolong/fonts/powerline-symbols" => :recommended

  def powerline_symbols_conf_xml
    <<~EOS
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <alias>
        <family>Ume Gothic</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Gothic C4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Gothic C5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Gothic S4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Gothic S5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Gothic O5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Gothic</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Gothic C4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Gothic C5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Gothic S4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Gothic S5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Gothic O5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume UI Gothic</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume UI Gothic C4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume UI Gothic C5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume UI Gothic S4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume UI Gothic S5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume UI Gothic O5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Hy Gothic</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Hy Gothic C4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Hy Gothic C5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Hy Gothic S4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Hy Gothic S5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Hy Gothic O5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Mincho</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Mincho C4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Mincho C5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Mincho S4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Mincho S5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume Mincho O5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Mincho</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Mincho C4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Mincho C5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Mincho S4</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Mincho S5</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Ume P Mincho O5</family>
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

  def install
    fontpath = share/"fonts/Homebrew/umefont"
    fontpath.mkpath

    conf1 = etc/"fonts/conf.d/55-homebrew-umefont.conf"
    conf1.delete if conf1.exist?
    conf2 = etc/"fonts/conf.d/15-powerline-symbols-umefont.conf"
    conf2.delete if conf2.exist?

    Pathname.glob("*.ttf").each do |ttf|
      system "#{Formula["z80oolong/fonts/powerline-fontpatcher"].opt_bin}/powerline-fontpatcher", "./#{ttf}"
      fontpath.install "./#{ttf}"
      fontpath.install *Pathname.glob("*Powerline.ttf")
    end

    conf1.write(fonts_conf_xml(opt_share/"fonts"))
    conf2.write(powerline_symbols_conf_xml)
  end

  def caveats; <<~EOS
    If you want to use Truetype font `Umefont`, as follows make a symbolic link
    in directory /usr/share/fonts or $HOME/.local/share/fonts, and run `fc-cache`
    command.
    
      # cd /usr/share/fonts
      # ln -sf #{ENV["HOMEBREW_PREFIX"]}/share/fonts/Homebrew .
      # fc-cache -vf
      
      or
      
      $ cd $HOME/.local/share/fonts/Homebrew
      $ ln -sf #{ENV["HOMEBREW_PREFIX"]}/share/fonts/Homebrew .
      $ fc-cache -fv
    EOS
  end

  def post_install
    system "#{Formula["fontconfig"].opt_bin}/fc-cache", "-vf"
  end

  test do
    system "#{Formula["fontconfig"].opt_bin}/fc-list"
  end
end
