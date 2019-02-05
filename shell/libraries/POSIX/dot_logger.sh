#!/bin/sh
# WARNING! This file should not be executed directly.
# Shebang here is only for shellcheck.
#
# Dot logger - library for rc-files debugging.
################################################################################

dot_logger_outfile() {
    echo "/tmp/DOTS.log"
}

dot_logger_errfile() {
    echo "${HOME}/DOTS_ERRORS.log"
}

dot_logger_log() {
    echo "[$(date)] $*" >> "$(dot_logger_outfile)"
}

dot_logger_error() {
    # TODO: check if shell is interactive and then output to stderr also.
    echo "[$(date)] $*" >> "$(dot_logger_errfile)"
}
