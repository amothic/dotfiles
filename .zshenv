export LANG=ja_JP.UTF-8
export LC_ALL=$LANG
if type vim &> /dev/null; then
    export EDITOR=vim
    export GIT_EDITOR=vim
    alias vi=vim
else
    export EDITOR=vi
    export GIT_EDITOR=vim
fi

setopt no_global_rcs
source ~/.zsh/path.zsh
