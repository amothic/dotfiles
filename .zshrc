## Emacsキーバインドを使う
bindkey -e

## ディレクトリ名だけでcdする
setopt auto_cd
## cdで移動してもpushdと同じようにディレクトリスタックに追加する
setopt auto_pushd
## カレントディレクトリ中に指定されたディレクトリが見つからなかった場合に
## 移動先を検索するリスト
cdpath=(~)

## ヒストリを保存するファイル
HISTFILE=~/.zsh_history
## メモリ上のヒストリ数
## 大きな数を指定してすべてのヒストリを保存するようにしている
HISTSIZE=10000000
## 保存するヒストリ数
SAVEHIST=$HISTSIZE
## ヒストリファイルにコマンドラインだけではなく実行時刻と実行時間も保存する
setopt extended_history
## 同じコマンドラインを連続で実行した場合はヒストリに登録しない
setopt hist_ignore_dups
## スペースで始まるコマンドラインはヒストリに追加しない
setopt hist_ignore_space
## すぐにヒストリファイルに追記する
setopt inc_append_history
## zshプロセス間でヒストリを共有する
setopt share_history
## C-sでのヒストリ検索が潰されてしまうため、出力停止・開始用にC-s/C-qを使わない
setopt no_flow_control
## ヒストリの検索時に重複したものは表示しない
setopt hist_find_no_dups

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 補完
## 初期化
autoload -U compinit
compinit

## 補完方法毎にグループ化する
### 補完方法の表示方法
###   %B...%b: 「...」を太字にする
###   %d: 補完方法のラベル
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''

## 補完侯補をメニューから選択する
### select=2: 補完候補を一覧から選択する
###           ただし、補完候補が2つ以上なければすぐに補完する
zstyle ':completion:*:default' menu select=2

## 補完候補に色を付ける
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

## 補完候補がなければより曖昧に候補を探す
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

## 補完方法の設定指定した順番に実行する
### _oldlist 前回の補完結果を再利用する
### _complete: 補完する
### _match: globを展開しないで候補の一覧から補完する
### _history: ヒストリのコマンドも補完候補とする
### _ignored: 補完候補にださないと指定したものも補完候補とする
### _approximate: 似ている補完候補も補完候補とする
### _prefix: カーソル以降を無視してカーソル位置までで補完する
zstyle ':completion:*' completer \
    _oldlist _complete _match _history _ignored _approximate _prefix

## 補完候補をキャッシュする
zstyle ':completion:*' use-cache yes
## 詳細な情報を使う
zstyle ':completion:*' verbose yes

## カーソル位置で補完する
setopt complete_in_word
## globを展開しないで候補の一覧から補完する
setopt glob_complete
## 補完時にヒストリを自動的に展開する
setopt hist_expand
## 補完候補がないときなどにビープ音を鳴らさない
setopt no_beep
## 補完時にビープ音を鳴らさない
setopt nolistbeep
## 辞書順ではなく数字順に並べる
setopt numeric_glob_sort



## --prefix=~/localというように「=」の後でも
## 「~」や「=コマンド」などのファイル名展開を行う
setopt magic_equal_subst

## 拡張globを有効にする
## glob中で「(#...)」という書式で指定する
setopt extended_glob
## globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける
setopt mark_dirs

export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

local GREEN=$'%{\e[0;32m%}'
local PINK=$'%{\e[0;35m%}'
local DEFAULT=$'%{\e[0;m%}'

PROMPT="$GREEN%n @ %m$DEFAULT %(!.#.$) "
RPROMPT="[$PINK%~$DEFAULT]"
## PROMPT内で変数展開・コマンド置換・算術演算を実行する
setopt prompt_subst
## PROMPT内で「%」文字から始まる置換機能を有効にする
setopt prompt_percent
## コピペしやすいようにコマンド実行後は右プロンプトを消す
setopt transient_rprompt

## 実行したプロセスの消費時間が3秒以上かかったら
## 自動的に消費時間の統計情報を表示する
REPORTTIME=3

export LISTMAX=100000
setopt list_packed

## 全てのユーザのログイン・ログアウトを監視する
watch="all"
## ログイン時にはすぐに表示する
log

## ^Dでログアウトしないようにする
setopt ignore_eof


## 「/」も単語区切りとみなす
WORDCHARS=${WORDCHARS:s,/,,}

## ページャーを使いやすくする
### grep -r def *.rb L -> grep -r def *.rb |& lv
alias -g L="|& $PAGER"
## grepを使いやすくする
alias -g G='| grep'
## 後はおまけ
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sed'

alias vi='vim'

## pushd/popdのショートカット
alias pd="pushd"
alias po="popd"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

case "${OSTYPE}" in
	darwin*)
		# rbenv
		eval "$(rbenv init -)"
		source ~/.rbenv/completions/rbenv.zsh
		;;
esac
