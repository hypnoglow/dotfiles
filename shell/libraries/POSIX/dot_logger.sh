#!/bin/sh
# NOTE: this file should not be executed, but sourced.
# Shebang here is for tools like "shellcheck".
#
# Dot logger - library for rc-files debugging.
################################################################################

dot_logger_getlogfile() {
    echo "/tmp/dots.log"
}

dot_logger_log() {
    echo "[$(date -u +"%Y-%m-%dT%H:%M:%SZ") INFO] $*" >> "$(dot_logger_getlogfile)"
}

dotlog_info() {
    dot_logger_log $@
}

dotlog_tail() {
    tail -f $(dot_logger_getlogfile)
}
