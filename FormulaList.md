# z80oolong/fonts に含まれる Formula 一覧

## 概要

本文書では、 [Linuxbrew][BREW] 向け Tap リポジトリ z80oolong/fonts に含まれる Formula 一覧を示します。各 Formula の詳細等については ```brew info <formula>``` コマンドも参照して下さい。

**なお、この formula によって導入された TrueType フォントをシステムの環境全体及びユーザ個人の環境全体において使用する場合は、以下のようにして、ディレクトリ ```/usr/share/fonts``` 若しくは ```$HOME/.local/share/fonts``` 以下にシンボリックリンクを作成し、コマンド ```fc-cache``` を起動する必要があることに留意して下さい。**

```
 $ sudo -s
 # cd /usr/share/fonts
 # ln -sf /home/linuxbrew/.linuxbrew/share/fonts/Homebrew .
 # fc-cache -vf
 (若しくは)
 $ cd /home/zool/.local/share/fonts
 $ ln -sf /home/linuxbrew/.linuxbrew/share/fonts/Homebrew .
 $ fc-cache -vf
```

## Formula 一覧

### z80oolong/fonts/umefont

蓬莱和多流氏らによるフリーの TrueType フォントである、[梅フォント][UMEF]を導入するための Formula です。本リポジトリで導入される[梅フォント][UMEF]では、 [powerline][POWE] に対応したシンボルフォントを適切に表示できるように修正を加えてあります。

### z80oolong/fonts/vlgothic

[鈴木大輔氏][DICY]らによる、 [M+ OUTLINE FONTS][MPLS]ベースのモダンゴシック体の日本語 TrueType フォントである [VL ゴシックフォント][VLGO]を導入するための Formula です。本リポジトリで導入される [VL ゴシックフォント][VLGO]では、 [powerline][POWE] に対応したシンボルフォントを適切に表示できるように修正を加えてあります。

### z80oolong/fonts/symbola

George Douros 氏らによる、絵文字等各種シンボル文字を表示させる為の TrueType フォントである [Symbola フォント][SYMB]を導入するための Formula です。

### z80oolong/fonts/koruri

[ほた氏][HOTA]らによる、 [M+ OUTLINE FONTS][MPLS] と [Open Sans][OSAN] を合成した日本語 TrueType フォントである [Koruri][KORU] を導入するための Formula です。

### z80oolong/fonts/powerline-fonts

[tmux][TMUX] のステータスラインを機能的に装飾するためのツールである [powerline][POWE] に対応したフォントを導入するための Formula です。

なお、この Formula は、 ```z80oolong/tmux/tmux``` 及び ```z80oolong/tmux/powerline-status``` を導入する際に、共に導入することを御勧めします。

### z80oolong/fonts/powerline-symbols

[tmux][TMUX] のステータスラインを機能的に装飾するためのツールである [powerline][POWE] で使用するシンボル文字のフォントを導入するための Formula です。

なお、この Formula は、 ```z80oolong/tmux/tmux``` 及び ```z80oolong/tmux/powerline-status``` を導入する際に、共に導入することを御勧めします。

### z80oolong/fonts/powerline-fontpatcher

TrueType フォントに、 [tmux][TMUX] のステータスラインを機能的に装飾するためのツールである [powerline][POWE] に対応したシンボル文字が使用できるように修正するためのシェルスクリプトを導入する Formula です。

なお、この Formula は、 ```z80oolong/fonts/umefont, z80oolong/fonts/vlgothic, z80oolong/fonts/koruri``` に依存します。

<!-- 外部リンク一覧 -->

[BREW]:https://linuxbrew.sh/
[TMUX]:https://tmux.github.io/
[UMEF]:https://ja.osdn.net/projects/ume-font/
[DICY]:http://dicey.org/
[MPLS]:http://mplus-fonts.osdn.jp/
[VLGO]:http://vlgothic.dicey.org/about.html
[OSAN]:https://fonts.google.com/specimen/Open+Sans
[SYMB]:https://dn-works.com/ufas/
[KORU]:https://koruri.github.io/
[POWE]:https://powerline.readthedocs.io/en/latest/#
