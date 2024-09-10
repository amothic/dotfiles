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
eval "$(/opt/homebrew/bin/brew shellenv)"

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

MY_PYTHON="$HOME/.pyenv"
if [ -d $MY_PYTHON ]; then
    path=(
    $MY_PYTHON/bin(N-/)
    $path
    )
    eval "$(pyenv init -)"
fi

# Dart
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Poetry
export PATH="$PATH":"$HOME/.local/bin"

# Java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
