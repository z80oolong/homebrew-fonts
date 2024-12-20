# z80oolong/fonts -- Homebrew for Linux に TrueType フォントを導入するための Formula 群

## 概要

[Homebrew for Linux][BREW] とは、Linux の各ディストリビューションにおけるソースコードの取得及びビルドに基づいたパッケージ管理システムです。 [Homebrew for Linux][BREW] の使用により、ソースコードからのビルドに基づいたソフトウェアの導入を単純かつ容易に行うことが出来ます。

この [Homebrew for Linux][BREW] 向け Tap リポジトリは、 [linuxbrew][BREW] に、 Linux, MacOS 及び Windows 等において使用されるベクターフォントの一つの規格である [TrueType][TRUE] に準拠したフォントファイルを導入するための Formula 群を含む Tap リポジトリです。

## 使用法

まず最初に、以下に示す Qiita の投稿及び Web ページの記述に基づいて、手元の端末に [Homebrew for Linux][BREW] を構築し、以下のように  ```brew tap``` コマンドを用いて本リポジトリを導入します。

- [thermes 氏][THER]による "[Linuxbrew のススメ][THBR]" の投稿
- [Homebrew for Linux の公式ページ][BREW]

そして、本リポジトリに含まれる Formula を以下のようにインストールします。

```
 $ brew tap z80oolong/fonts
 $ brew install <formula>
```

なお、一時的な手法ですが、以下のようにして URL を直接指定してインストールすることも出来ます。

```
 $ brew install https://raw.githubusercontent.com/z80oolong/homebrew-tmux/master/Formula/<formula>.rb
```

なお、本リポジトリに含まれる Formula の一覧及びその詳細については、本リポジトリに同梱する ```FormulaList.md``` を参照して下さい。

また、本リポジトリにおける Formula によって導入される TrueType フォントは、原則としてディレクトリ ```$HOMEBREW_PREFIX/share/fonts/Homebrew``` 以下に置かれます。従って、これらのフォントを、システムの環境及びユーザ個人の環境全体で使用する場合は、以下の通りにディレクトリ ```/usr/share/fonts``` 若しくは ```$HOME/.local/share/fonts``` にシンボリックリンクを張り、その後に ```fc-cache``` コマンドを実行する必要があります。

```
 (システムの環境全体で使用する場合。)
 $ sudo -s
 # cd /usr/share/fonts
 # ln -sf $HOMEBREW_PREFIX/share/fonts/Homebrew .  (ここに、 $HOMEBREW_PREFIX は、 Homebrew for Linux が導入されたディレクトリ。)
 # fc-cache -fv

 (ユーザ個人の環境全体で使用する場合。)
 $ cd $HOME/.local/share/fonts
 $ ln -sf $HOMEBREW_PREFIX/share/fonts/Homebrew .  (ここに、 $HOMEBREW_PREFIX は、 Homebrew for Linux が導入されたディレクトリ。)
 $ fc-cache -fv
```

## その他詳細について

その他、本リポジトリ及び [Homebrew for Linux][BREW] の使用についての詳細は ```brew help``` コマンド及び  ```man brew``` コマンドの内容、若しくは [Homebrew for Linux の公式ページ][BREW]を御覧下さい。

## 謝辞

本リポジトリの作成にあたっては、 [Homebrew for Linux][BREW] の導入に関しては、 [Homebrew for Linux の公式ページ][BREW] の他、 [thermes 氏][THER]による "[Linuxbrew のススメ][THBR]" 及び [Homebrew for Linux][BREW] 関連の各種資料を参考にしました。 [Homebrew for Linux の開発コミュニティ][BREW]及び[thermes 氏][THER]を始めとする関係各氏に心より感謝致します。

また、本リポジトリによって導入される TrueType フォントを開発された各氏及び関係各位に心より感謝致します。

最後に、 [Homebrew for Linux][BREW] に関わる全ての皆様に心より感謝致します。

## 使用条件

本リポジトリは、 [Homebrew for Linux][BREW] の Tap リポジトリの一つとして、 [Homebrew for Linux の開発コミュニティ][BREW]及び [Z.OOL. (mailto:zool@zool.jpn.org)][ZOOL] が著作権を有し、[Homebrew for Linux][BREW] のライセンスと同様である [BSD 2-Clause License][BSD2] に基づいて配布されるものとします。詳細については、本リポジトリに同梱する ```LICENSE``` を参照して下さい。

<!-- 外部リンク一覧 -->

[BREW]:https://linuxbrew.sh/
[THER]:https://qiita.com/thermes
[THBR]:https://qiita.com/thermes/items/926b478ff6e3758ecfea
[BSD2]:https://opensource.org/licenses/BSD-2-Clause
[ZOOL]:http://zool.jpn.org/
