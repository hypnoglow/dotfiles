# This file contains autocomplete for scripts in $HOME/bin
# It needs to be source'd in .bashrc

# @todo automatically load for each file in $HOME/bin ?

_default_autocomplete()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=$1
    opts=$($HOME/bin/${cmd} autocomplete)

    if [ -z "$prev" ] || [ "$prev" = "$cmd" ] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    fi

    return 0
}

complete -o nospace -F _default_autocomplete rs
complete -o nospace -F _default_autocomplete dfl