class Koruri < Formula
  desc "Koruri TTF Font."
  homepage "https://koruri.github.io/"
  url "https://github.com/Koruri/Koruri/releases/download/20210720/Koruri-20210720.tar.xz"
  version "20210720"
  sha256 "2626a6f5ad32d06cb24277880955dbfbe804120ab260ed74773da64c4bca6d00"
  license "Apache-2.0"

  depends_on "fontconfig" => :build
  depends_on "z80oolong/fonts/powerline-fontpatcher" => :build
  depends_on "z80oolong/fonts/powerline-symbols" => :recommended

  def powerline_symbols_conf_xml
    <<~EOS
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <alias>
        <family>Koruri</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Koruri Bold</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Koruri Extrabold</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Koruri Regular</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Koruri Light</family>
        <prefer><family>PowerlineSymbols</family></prefer>
      </alias>
      <alias>
        <family>Koruri Semibold</family>
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
    fontpath = share/"fonts/Homebrew/koruri"
    fontpath.mkpath

    conf1 = etc/"fonts/conf.d/55-homebrew-koruri.conf"
    conf1.delete if conf1.exist?
    conf2 = etc/"fonts/conf.d/15-powerline-symbols-koruri.conf"
    conf2.delete if conf2.exist?

    Pathname.glob("*.ttf").each do |ttf|
      system "#{Formula["z80oolong/fonts/powerline-fontpatcher"].opt_bin}/powerline-fontpatcher", "./#{ttf}"
      fontpath.install "./#{ttf}"
      fontpath.install *Pathname.glob("*Powerline.ttf")
    end

    conf1.write(fonts_conf_xml(opt_share/"fonts"))
    conf2.write(powerline_symbols_conf_xml)
  end

  def post_install
    system "#{Formula["fontconfig"].opt_bin}/fc-cache", "-vf"
  end

  test do
    system "#{Formula["fontconfig"].opt_bin}/fc-list"
  end
end
