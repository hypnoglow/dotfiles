# This file contains autocomplete for scripts in $HOME/bin
# It needs to be source'd in .bashrc

# @todo automatically load for each file in $HOME/bin ?

_autocomplete_rs()
{
    _script_commands=$($HOME/bin/rs autocomplete)

    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "${_script_commands}" -- ${cur}) )

    return 0
}
complete -o nospace -F _autocomplete_rs rs

_autocomplete_dfl()
{
    _script_commands=$($HOME/bin/dfl autocomplete)

    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=( $(compgen -W "${_script_commands}" -- ${cur}) )

    return 0
}
complete -o nospace -F _autocomplete_dfl dfl