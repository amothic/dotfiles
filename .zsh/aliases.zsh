alias cp='cp -i'
alias mv='mv -i'
alias tmux='tmux -u'

case "${OSTYPE}" in
    freebsd*|darwin*)
        alias ls='ls -G -w'
        ;;
    linux*)
        alias ls='ls --color'
        ;;
esac
