#!/bin/sh
# WARNING! This file should not be executed directly.
#
# Dot logger - library for rc-files debugging.
################################################################################

dot_logger_getlogfile() {
    echo "/tmp/dots.log"
}

dot_logger_log() {
    echo "[$(date)] $*" >> "$(dot_logger_getlogfile)"
}
