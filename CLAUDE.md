# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

これはmacOS環境用のdotfiles管理リポジトリです。Zsh、Vim、tmux、Gitなどの設定ファイルと、Homebrewを使ったアプリケーション管理を含みます。

## Setup and Installation

### 初期セットアップ
```bash
./install.sh
```
このスクリプトは以下を実行します：
1. シェルをZshに変更
2. シンボリックリンクの作成（`create_link.sh`経由）
3. Vimプラグインのインストール（`vim.sh`経由）
4. Homebrewのインストールと`brew bundle`の実行

### Brewfile管理
```bash
# 現在インストールされているパッケージでBrewfileを更新
make dump
# または直接
brew bundle dump --force
```

## Architecture

### Configuration Structure

```
.dotfiles/
├── .zsh/               # Zsh設定のモジュール分割
│   ├── env.zsh         # 環境変数
│   ├── options.zsh     # Zshオプション
│   ├── aliases.zsh     # エイリアス定義
│   ├── functions.zsh   # カスタム関数
│   ├── external.zsh    # 外部ツール統合（tmux自動起動、fzf、zoxideなど）
│   └── path.zsh        # PATH設定（asdf、anyenv、Go、Dart、Poetryなど）
├── .config/            # XDG Base Directory対応の設定
│   ├── sheldon/        # Zshプラグインマネージャー
│   └── starship.toml   # Starshipプロンプト設定
├── .vim/               # Vim関連（dein.vimでプラグイン管理）
├── Brewfile            # Homebrew管理のパッケージリスト
├── .zshrc              # Zshメインエントリーポイント（.zsh/*を読み込む）
├── .vimrc              # Vim設定
├── .tmux.conf          # tmux設定
└── .gitconfig          # Git設定
```

### Key Design Patterns

1. **シンボリックリンク管理**: `create_link.sh`はこのリポジトリからホームディレクトリへシンボリックリンクを作成します。`.git*`と`.config`は特別扱いされます。

2. **Zshモジュール化**: `.zshrc`は薄いラッパーで、実際の設定は`.zsh/`ディレクトリ内のモジュールに分割されています。順序は以下の通り：
   - env.zsh → options.zsh → aliases.zsh → functions.zsh → external.zsh

3. **PATH管理**: `.zsh/path.zsh`で言語環境とツールのPATH設定を集中管理：
   - Homebrew (`/opt/homebrew`)
   - ASDF (shimsを優先PATH)
   - anyenv
   - Go (`$HOME/go/bin`)
   - Dart (`$HOME/.pub-cache/bin`)
   - Poetry (`$HOME/.local/bin`)
   - Java (OpenJDK via Homebrew)

4. **tmux自動起動**: `.zsh/external.zsh`でVSCodeとIntelliJ以外のターミナルでtmuxセッションを自動起動。fzfで既存セッションの選択または新規作成を選択できます。

5. **ローカル設定の上書き**: `.zshrc`は`~/.zshrc.local`を、`.gitconfig`は`~/.gitconfig.local`を読み込み、個人的な設定の上書きを可能にします。

## Git Configuration

- デフォルトブランチ: `main`
- コミット署名: GPG署名が有効
- 自動セットアップ: `push.autoSetupRemote = true`
- LFS有効化
- ブランチソート: コミット日時順（`-committerdate`）

## Important Notes

- Vimプラグインは`dein.vim`で管理されています（`~/.vim/dein.toml`参照）
- Zshプラグインは`sheldon`で管理されています（`.config/sheldon/`参照）
- 変更をリロードする場合: `reload`エイリアス（`exec $SHELL -l`）を使用
- tmux設定をリロード: `prefix + r`（prefixは`Ctrl-t`）
