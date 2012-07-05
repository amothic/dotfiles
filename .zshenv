LANG=en_US.UTF-8
if type /usr/loca/bin/vim > /dev/null 2>&1; then
    EDITOR=/usr/local/bin/vim
else
    EDITOR=vi
fi

# PATH
typeset -U path
path=(
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

