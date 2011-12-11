export LANG=en_US.UTF-8

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
### 拡張子が.tmpのファイルは無視する
GREP_OPTIONS="--exclude=\*.tmp $GREP_OPTIONS"
## 管理用ディレクトリを無視する
if grep --help | grep -q -- --exclude-dir; then
    GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.hg $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.deps $GREP_OPTIONS"
    GREP_OPTIONS="--exclude-dir=.libs $GREP_OPTIONS"
fi
### 可能なら色を付ける
if grep --help | grep -q -- --color; then
    GREP_OPTIONS="--color=auto $GREP_OPTIONS"
fi
### grep対象としてディレクトリを指定したらディレクトリ内を再帰的にgrepする
GREP_OPTIONS="--directories=recurse $GREP_OPTIONS"

## vimを使う
export EDITOR=vim
