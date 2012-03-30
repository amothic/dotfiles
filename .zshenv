export LANG=en_US.UTF-8

export PATH=/usr/local/bin:$PATH

if [ -e $HOME/.rbenv ]; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi

## 重複したパスを登録しない
typeset -U path

## GNU grepがあったら優先して使う
if type ggrep > /dev/null 2>&1; then
    alias grep=ggrep
fi

## デフォルトオプションの設定
export GREP_OPTIONS
### バイナリファイルにはマッチさせない
GREP_OPTIONS="--binary-files=without-match"
### 可能なら色を付ける
if grep --help | grep -q -- --color; then
    GREP_OPTIONS="--color=auto $GREP_OPTIONS"
fi

## vimを使う
export EDITOR=vim
