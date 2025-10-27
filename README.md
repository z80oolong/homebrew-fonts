# z80oolong/fonts -- TrueType フォントを Homebrew for Linux に導入するための Formula 群

## 概要

[Homebrew for Linux][BREW] は、Linux ディストリビューション向けのソースコードベースのパッケージ管理システムであり、ソフトウェアのビルドおよびインストールを簡素化します。

この [Homebrew for Linux][BREW] 向け Tap リポジトリ ```z80oolong/fonts``` は、Linux、macOS、Windows などで使用されるベクターフォント規格である [TrueType][TRUE] に準拠したフォントファイルをインストールするための Formula 群を提供します。詳細な Formula 一覧は、本リポジトリに同梱の ```FormulaList.md``` を参照してください。

## 使用方法

以下の手順で、本リポジトリの Formula をインストールします。

1. [Homebrew for Linux][BREW] を端末にインストールします。以下のリソースを参考にしてください：
    - [thermes 氏][THER] の Qiita 投稿 "[Linuxbrew のススメ][THBR]"
    - [Homebrew for Linux 公式ページ][BREW]
2. 本リポジトリを以下のように Tap して Formula をインストールします：

    ```
      $ brew tap z80oolong/fonts
      $ brew install <formula>
    ```

    または、一時的な方法として、以下のように URL を直接指定してインストール可能です：

    ```
      $ brew install https://raw.githubusercontent.com/z80oolong/homebrew-fonts/master/Formula/<formula>.rb
    ```

本リポジトリに含まれる Formula の詳細および一覧は、```FormulaList.md``` を参照してください。

### フォントのシステムへの登録

本リポジトリの Formula によりインストールされる TrueType フォントは、原則として ```$HOMEBREW_PREFIX/share/fonts/Homebrew``` ディレクトリに配置されます。システム全体またはユーザ環境でフォントを使用するには、以下の手順でシンボリックリンクを作成し、フォントキャッシュを更新してください：

- **システム全体で使用する場合**：

    ```
      $ sudo -s
      # cd /usr/share/fonts
      # ln -sf $HOMEBREW_PREFIX/share/fonts/Homebrew . # ($HOMEBREW_PREFIX は、[Homebrew for Linux][BREW] がインストールされているディレクトリを指します)
      # fc-cache -fv
    ```

- **ユーザ環境で使用する場合**：

    ```
      $ cd $HOME/.local/share/fonts
      $ ln -sf $HOMEBREW_PREFIX/share/fonts/Homebrew . # ($HOMEBREW_PREFIX は、[Homebrew for Linux][BREW] がインストールされているディレクトリを指します)
      $ fc-cache -fv
    ```

## 詳細情報

本リポジトリおよび [Homebrew for Linux][BREW] の使用方法の詳細は、以下のコマンドやリソースを参照してください：

- ```brew help``` コマンド
- ```man brew``` コマンド
- [Homebrew for Linux 公式ページ][BREW]

## 謝辞

本リポジトリの作成にあたり、[Homebrew for Linux 公式ページ][BREW] および [thermes 氏][THER] の Qiita 投稿 "[Linuxbrew のススメ][THBR]" を参考にしました。[Homebrew for Linux 開発コミュニティ][BREW] および [thermes 氏][THER] に心より感謝いたします。

また、本リポジトリで提供する TrueType フォントの開発者および関連コミュニティに深く感謝申し上げます。

最後に、[Homebrew for Linux][BREW] に関わるすべての皆様に心より感謝いたします。

## 使用条件

本リポジトリは、[Homebrew for Linux][BREW] の Tap リポジトリとして、[Homebrew for Linux 開発コミュニティ][BREW] および [Z.OOL. (mailto:zool@zool.jpn.org)][ZOOL] が著作権を有し、[BSD 2-Clause License][BSD2] に基づいて配布されます。詳細は、本リポジトリに同梱の ```LICENSE``` を参照してください。

<!-- 外部リンク一覧 -->

[BREW]: https://linuxbrew.sh/
[TRUE]: https://www.microsoft.com/typography/TrueTypeFonts.mspx
[THER]: https://qiita.com/thermes
[THBR]: https://qiita.com/thermes/items/926b478ff6e3758ecfea
[BSD2]: https://opensource.org/licenses/BSD-2-Clause
[ZOOL]: http://zool.jpn.org/
