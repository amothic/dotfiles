# Completions

# fpath setup (before compinit)
# asdf
fpath=($HOME/.asdf/completions $fpath)

# initialize completions
autoload -Uz compinit
compinit

# external completions (after compinit)
# google-cloud-sdk
MY_GCLOUD_COMPLETION=/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc
if [ -f $MY_GCLOUD_COMPLETION ]; then
  source $MY_GCLOUD_COMPLETION
fi
