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
