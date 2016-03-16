export LANG=en_US.UTF-8
export LC_ALL=$LANG
if type vim > /dev/null 2>&1; then
    export EDITOR=vim
    export GIT_EDITOR=vim
    alias vi=vim
else
    export EDITOR=vi
    export GIT_EDITOR=vim
fi

setopt no_global_rcs
source ~/.zsh/path.zsh
