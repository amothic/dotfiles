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

# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

MY_RBENV="$HOME/.rbenv"
if [ -d $MY_RBENV ]; then
    path=(
    $MY_RBENV/bin(N-/)
    $path
    )
    eval "$(rbenv init -)"
fi

MY_NODE="$HOME/.nodebrew"
if [ -d $MY_NODE ]; then
    path=(
    $MY_NODE/current/bin(N-/)
    $path
    )
fi

MY_GO="$HOME/go"
if [ -d $MY_GO ]; then
    export GOPATH=$MY_GO
    path=(
    $MY_GO/bin(N-/)
    $path
    )
fi
