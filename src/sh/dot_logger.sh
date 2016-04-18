#!/bin/bash
# WARNING! This file should not be executed directly.
#
# Dot logger - library for rc-files debugging.
################################################################################

dot_logger::getlogfile() {
    echo "/tmp/dots.log"
}

dot_logger::log() {
    echo "[$(date)] $*" >> "$(dot_logger::getlogfile)"
}
