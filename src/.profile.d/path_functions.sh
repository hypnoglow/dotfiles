# Usage: indirect_expand PATH -> $PATH
indirect_expand() {
    if [ -z "$1" ]; then
        return 1;
    fi

    env | sed -n "s/^$1=//p"
}
export -f indirect_expand

# Usage: pathremove /path/to/bin [PATH]
# Eg, to remove ~/bin from $PATH
#     pathremove ~/bin PATH
pathremove() {
    local IFS=':'
    local newpath
    local dir
    local var=${2:-PATH}
    # Bash has ${!var}, but this is not portable.
    for dir in `indirect_expand "$var"`; do
        IFS=''
        if [ "$dir" != "$1" ]; then
            newpath=$newpath:$dir
        fi
    done
    export $var=${newpath#:}
}
export -f pathremove

# Usage: pathprepend /path/to/bin [PATH]
# Eg, to prepend ~/bin to $PATH
#     pathprepend ~/bin PATH
pathprepend() {
    # if the path is already in the variable,
    # remove it so we can move it to the front
    pathremove "$1" "$2"
    #[ -d "${1}" ] || return
    local var="${2:-PATH}"
    local value=`indirect_expand "$var"`
    export ${var}="${1}${value:+:${value}}"
}
export -f pathprepend

# Usage: pathappend /path/to/bin [PATH]
# Eg, to append ~/bin to $PATH
#     pathappend ~/bin PATH
pathappend() {
    pathremove "${1}" "${2}"
    #[ -d "${1}" ] || return
    local var=${2:-PATH}
    local value=`indirect_expand "$var"`
    export $var="${value:+${value}:}${1}"
}
export -f pathappend

# Usage: ssource filename
ssource() {
    if [ ! -r "$1" ]; then
        echo "File $1 is not readable!" >&2
    fi

    . "$1"
}
export -f ssource