MY_RBENV_COMPLETION=`brew --prefix rbenv`/completions/rbenv.zsh
if [ -x `which brew` ] && [ -r $MY_RBENV_COMPLETION ]; then
    source $MY_RBENV_COMPLETION
fi

MY_PLENV_COMPLETION=`brew --prefix plenv`/completions/plenv.zsh
if [ -x `which brew` ] && [ -r $MY_PLENV_COMPLETION ]; then
    source $MY_PLENV_COMPLETION
fi

MY_Z=`brew --prefix`/etc/profile.d/z.sh
if [ -x `which brew` ] && [ -r $MY_Z ]; then
    . $MY_Z
fi
