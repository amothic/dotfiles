# PROMPT
setopt prompt_subst
setopt prompt_percent
setopt transient_rprompt
autoload colors; colors
PROMPT="%{$fg[green]%}%n @ %m%{$reset_color%} %(!.#.$) "
RPROMPT="[%{$fg[magenta]%}%~%{$reset_color%}]"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt no_flow_control
setopt hist_find_no_dups

# Other
bindkey -e

REPORTTIME=3

watch="all"
log

WORDCHARS=${WORDCHARS:s,/,,}
