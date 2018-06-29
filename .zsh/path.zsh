# PATH
typeset -U path cdpath fpath manpath
path=(
/usr/local/bin(N-/)
/usr/local/sbin(N-/)
$path
)

# path for sudo
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=(
/usr/sbin(N-/)
/usr/local/sbin(N-/)
)

MY_RBENV="$HOME/.rbenv"
if [ -d $MY_RBENV ]; then
    path=(
    $MY_RBENV/bin(N-/)
    $path
    )
    eval "$(rbenv init -)"
fi

MY_NDENV="$HOME/.ndenv"
if [ -d $MY_NDENV ]; then
    path=(
    $MY_NDENV/bin(N-/)
    $path
    )
    eval "$(ndenv init -)"
fi

MY_PLENV="$HOME/.plenv"
if [ -d $MY_PLENV ]; then
    path=(
    $MY_PLENV/bin(N-/)
    $path
    )
    eval "$(plenv init -)"
fi

MY_PYENV="$HOME/.pyenv"
if [ -d $MY_PYENV ]; then
    path=(
    $MY_PYENV/bin(N-/)
    $path
    )
    eval "$(pyenv init -)"
fi

MY_GO="$HOME/go"
if [ -d $MY_GO ]; then
    export GOPATH=$MY_GO
    path=(
    $MY_GO/bin(N-/)
    $path
    )
fi
