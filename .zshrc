source ~/.zsh/env.zsh
source ~/.zsh/options.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/plugins/incr*.zsh
if [ -e $HOME/.rbenv ]; then
    source ~/.rbenv/completions/rbenv.zsh
fi
