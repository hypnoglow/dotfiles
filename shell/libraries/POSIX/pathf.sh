#!/bin/sh
# WARNING! This file should not be executed directly.
#
# Pathf - library for portable PATH manipulation.
################################################################################

# Usage: indirect_expand PATH -> $PATH
pathf_indirect_expand() {
    if [ -z "$1" ]; then
        return 1;
    fi

    env | sed -n "s/^$1=//p"
}

# Usage: pathremove /path/to/bin [PATH]
# Eg, to remove ~/bin from $PATH
#     pathremove ~/bin PATH
pathf_remove() {
    local IFS=':'
    local newpath
    local dir
    local var=${2:-PATH}
    # Bash has ${!var}, but this is not portable.
    for dir in $(pathf_indirect_expand "$var"); do
        IFS=''
        if [ "$dir" != "$1" ]; then
            newpath=$newpath:$dir
        fi
    done
    export $var=${newpath#:}
}

# Usage: pathprepend /path/to/bin [PATH]
# Eg, to prepend ~/bin to $PATH
#     pathprepend ~/bin PATH
pathf_prepend() {
    # if the path is already in the variable,
    # remove it so we can move it to the front
    pathf_remove "$1" "$2"
    #[ -d "${1}" ] || return
    local var="${2:-PATH}"
    local value=$(pathf_indirect_expand "$var")
    export ${var}="${1}${value:+:${value}}"
}

# Usage: pathappend /path/to/bin [PATH]
# Eg, to append ~/bin to $PATH
#     pathappend ~/bin PATH
pathf_append() {
    pathf_remove "${1}" "${2}"
    #[ -d "${1}" ] || return
    local var=${2:-PATH}
    local value=$(pathf_indirect_expand "$var")
    export $var="${value:+${value}:}${1}"
}
