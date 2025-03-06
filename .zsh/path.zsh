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

# Packages
if [ -d /opt/homebrew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Languages
if type anyenv &> /dev/null; then
  eval "$(anyenv init -)"
fi

MY_GO="$HOME/go"
if [ -d $MY_GO ]; then
    export GOPATH=$MY_GO
    path=(
    $MY_GO/bin(N-/)
    $path
    )
fi

# Dart
MY_DART="$HOME/.pub-cache/bin"
if [ -d $MY_DART ]; then
    path=(
    $MY_DART(N-/)
    $path
    )
fi

# Poetry
MY_POETRY="$HOME/.local/bin"
if [ -d $MY_POETRY ]; then
    path=(
    $MY_POETRY(N-/)
    $path
    )
fi

# Java
MY_JAVA="/opt/homebrew/opt/openjdk/bin"
if [ -d $MY_JAVA ]; then
    path=(
    $MY_JAVA(N-/)
    $path
    )
fi

# Docker (Rancher Desktop)
MY_DOCKER="$HOME/.rd/bin"
if [ -d $MY_DOCKER ]; then
    path=(
    $MY_DOCKER(N-/)
    $path
    )
fi
