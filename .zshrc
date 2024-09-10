source ~/.zsh/env.zsh
source ~/.zsh/options.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/external.zsh

if [ -r ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/daichi.toma/.dart-cli-completion/zsh-config.zsh ]] && . /Users/daichi.toma/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

