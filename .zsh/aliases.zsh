alias cp='cp -i'
alias mv='mv -i'

case "${OSTYPE}" in
    freebsd*|darwin*)
        alias ls='ls -G -w'
        ;;
    linux*)
        alias ls='ls --color'
        ;;
esac
