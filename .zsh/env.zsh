# Shell
if type sheldon &> /dev/null; then
  eval "$(sheldon source)"
fi

if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt share_history
setopt extended_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_find_no_dups
