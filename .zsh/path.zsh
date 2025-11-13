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
MY_ASDF="$HOME/.asdf"
if [ -d $MY_ASDF ]; then
    path=(
    $MY_ASDF/shims(N-/)
    $path
    )
fi

# google-cloud-sdk
MY_GCLOUD=/opt/homebrew/share/google-cloud-sdk/path.zsh.inc
if [ -f $MY_GCLOUD ]; then
  source $MY_GCLOUD
fi
