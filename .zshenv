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
/usr/local/sbin
$path
)

if [ -e $HOME/.rbenv ]; then
    path=(
    $HOME/.rbenv/bin
    $path
    )
    eval "$(rbenv init -)"
fi

# Haskell
path=(
$HOME/Library/Haskell/bin
$path
)

if [ -d ${HOME}/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    for D in `ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi
