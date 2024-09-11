source ~/.zsh/env.zsh
source ~/.zsh/options.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/external.zsh

if [ -r ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# eval
if type sheldon &> /dev/null; then
  eval "$(sheldon source)"
fi
if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
