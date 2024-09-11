source ~/.zsh/env.zsh
source ~/.zsh/options.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/external.zsh

if [ -r ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

