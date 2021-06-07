alias g='git'
alias cp='cp -i'
alias mv='mv -i'
alias -s hs=runhaskell

case "${OSTYPE}" in
    freebsd*|darwin*)
        alias ls='ls -G -w'
        ;;
    linux*)
        alias ls='ls --color'
        ;;
esac
