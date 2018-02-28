MY_RBENV_COMPLETION=`brew --prefix rbenv`/completions/rbenv.zsh
if [ -x `which brew` ] && [ -r $MY_RBENV_COMPLETION ]; then
    source $MY_RBENV_COMPLETION
fi

MY_PLENV_COMPLETION=`brew --prefix plenv`/completions/plenv.zsh
if [ -x `which brew` ] && [ -r $MY_PLENV_COMPLETION ]; then
    source $MY_PLENV_COMPLETION
fi

MY_PLENV_COMPLETION=`brew --prefix plenv`/completions/plenv.zsh
if [ -x `which brew` ] && [ -r $MY_PLENV_COMPLETION ]; then
    source $MY_PLENV_COMPLETION
fi

MY_Z=`brew --prefix`/etc/profile.d/z.sh
if [ -x `which brew` ] && [ -r $MY_Z ]; then
    source $MY_Z
fi

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
