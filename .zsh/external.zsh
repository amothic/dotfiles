# z
MY_Z=`brew --prefix`/etc/profile.d/z.sh
if [ -x `which brew` ] && [ -r $MY_Z ]; then
    source $MY_Z
fi

# google-cloud-sdk
export CLOUDSDK_PYTHON=$(which python3)
MY_GCLOUD=~/google-cloud-sdk/path.zsh.inc
if [ -f $MY_GCLOUD ]; then
    source $MY_GCLOUD
fi
MY_GCLOUD_COMPLETION=~/google-cloud-sdk/completion.zsh.inc
if [ -f $MY_GCLOUD_COMPLETION ]; then
    source $MY_GCLOUD_COMPLETION
fi

# fzf
if type fzf &> /dev/null; then
  FZF_CTRL_T_COMMAND=
  FZF_ALT_C_COMMAND=
  source <(fzf --zsh)
fi
