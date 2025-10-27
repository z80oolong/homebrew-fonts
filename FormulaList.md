# z80oolong/fonts に含まれる Formula 一覧

## 概要

本文書では、[Homebrew for Linux][BREW] 向け Tap リポジトリ ```z80oolong/fonts``` に含まれる Formula 一覧を示します。各 Formula の詳細については、```brew info <formula>``` コマンドをご覧ください。

この Tap リポジトリは、[powerline][POWE] に対応した修正を施した TrueType フォントを提供します。

なお、この Formula によってインストールされた TrueType フォントをシステム全体またはユーザーの環境全体で使用するには、以下の手順でディレクトリ ```/usr/share/fonts``` または ```$HOME/.local/share/fonts``` にシンボリックリンクを作成し、```fc-cache``` コマンドを実行する必要があります。

```
  $ sudo -s
  # cd /usr/share/fonts
  # ln -sf /home/linuxbrew/.linuxbrew/share/fonts/Homebrew .
  # fc-cache -vf
  # exit
  # (または)
  $ cd $HOME/.local/share/fonts
  $ ln -sf /home/linuxbrew/.linuxbrew/share/fonts/Homebrew .
  $ fc-cache -vf
```

## Formula 一覧

### z80oolong/fonts/umefont

この Formula は、蓬莱和多流氏らによるフリーの TrueType フォントである [梅フォント][UMEF] の最新版をインストールします。この Formula でインストールされた [梅フォント][UMEF] には、[powerline][POWE] に対応したシンボルフォントを適切に表示するための修正が施されています。

### z80oolong/fonts/vlgothic

この Formula は、[鈴木大輔氏][DICY] らによる [M+ OUTLINE FONTS][MPLS] をベースとしたモダンゴシック体の日本語 TrueType フォントである [VL ゴシックフォント][VLGO] の最新版をインストールします。この Formula でインストールされた [VL ゴシックフォント][VLGO] には、[powerline][POWE] に対応したシンボルフォントを適切に表示するための修正が施されています。

### z80oolong/fonts/koruri

この Formula は、[ほた氏][HOTA] らによる [M+ OUTLINE FONTS][MPLS] と [Open Sans][OSAN] を合成した日本語 TrueType フォントである [Koruri][KORU] の最新版をインストールします。

### z80oolong/fonts/powerline-fonts

この Formula は、[tmux][TMUX] のステータスラインを機能的に装飾するツールである [powerline][POWE] に対応したフォントをインストールします。

- **注意**:
    - この Formula は、```z80oolong/tmux/tmux-current``` および ```z80oolong/tmux/powerline-status``` をインストールする際に、併せてインストールすることをお勧めします。

### z80oolong/fonts/powerline-symbols

この Formula は、[tmux][TMUX] のステータスラインを機能的に装飾するツールである [powerline][POWE] で使用するシンボル文字のフォントをインストールします。

- **注意**:
    - この Formula は、```z80oolong/tmux/tmux-current``` および ```z80oolong/tmux/powerline-status``` をインストールする際に、併せてインストールすることをお勧めします。

### z80oolong/fonts/powerline-fontpatcher

この Formula は、TrueType フォントに [tmux][TMUX] のステータスラインを機能的に装飾するツールである [powerline][POWE] に対応したシンボル文字を適用するためのシェルスクリプトをインストールします。

- **注意**:
    - この Formula は、```z80oolong/fonts/umefont```、```z80oolong/fonts/vlgothic```、```z80oolong/fonts/koruri``` に依存します。

<!-- 外部リンク一覧 -->

[BREW]: https://linuxbrew.sh/  
[TMUX]: https://tmux.github.io/  
[UMEF]: https://ja.osdn.net/projects/ume-font/  
[DICY]: http://dicey.org/  
[MPLS]: http://mplus-fonts.osdn.jp/  
[VLGO]: http://vlgothic.dicey.org/about.html  
[OSAN]: https://fonts.google.com/specimen/Open+Sans  
[KORU]: https://koruri.github.io/  
[POWE]: https://powerline.readthedocs.io/en/latest/#
