# PATH
typeset -U path cdpath fpath manpath
path=(
/usr/local/bin(N-/)
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
