alias vi='$EDITOR'

alias cp='cp -i'
alias mv='mv -i'
alias pd='pushd'
alias po='popd'
alias SU='sudo -H -s'

case "${OSTYPE}" in
    freebsd*|darwin*)
        alias ls='ls -G -w'
        ;;
    linux*)
        alias ls='ls --color'
        ;;
esac

if type ggrep > /dev/null 2>&1; then
    alias grep='ggrep'
fi
