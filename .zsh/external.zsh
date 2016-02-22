if [ -d $HOME/.rbenv ]; then
    source ~/.rbenv/completions/rbenv.zsh
fi

if [ -d $HOME/.rbenv ]; then
    source ~/.rbenv/completions/rbenv.zsh
fi

if [ -x brew ] && [ -r `brew --prefix`/etc/profile.d/z.sh ]; then
    . `brew --prefix`/etc/profile.d/z.sh
fi
