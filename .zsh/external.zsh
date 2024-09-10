MY_Z=`brew --prefix`/etc/profile.d/z.sh
if [ -x `which brew` ] && [ -r $MY_Z ]; then
    source $MY_Z
fi

export CLOUDSDK_PYTHON=$(which python3)

# The next paragraph updates PATH for the Google Cloud SDK.
MY_GCLOUD=~/google-cloud-sdk/path.zsh.inc
if [ -f $MY_GCLOUD ]; then
    source $MY_GCLOUD
fi

# The next paragraph enables shell command completion for gcloud.
MY_GCLOUD_COMPLETION=~/google-cloud-sdk/completion.zsh.inc
if [ -f $MY_GCLOUD_COMPLETION ]; then
    source $MY_GCLOUD_COMPLETION
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
