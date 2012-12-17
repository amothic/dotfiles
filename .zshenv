export LANG=en_US.UTF-8
export LC_ALL=$LANG
if type /usr/local/bin/vim > /dev/null 2>&1; then
    export EDITOR=/usr/local/bin/vim
else
    export EDITOR=vi
fi

# PATH
typeset -U path
path=(
/usr/sbin
/usr/local/bin
$path
)

if [ -e $HOME/.rbenv ]; then
    path=(
    $HOME/.rbenv/bin
    $path
    )
    eval "$(rbenv init -)"
fi

