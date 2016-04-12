_getlogfile() {
    echo "/tmp/dots.log"
}
export -f _getlogfile

_ddebug() {
    echo "[$(date)] $@" >> "$(_getlogfile)"
}
export -f _ddebug
