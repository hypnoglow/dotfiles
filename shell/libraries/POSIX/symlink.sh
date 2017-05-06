#!/bin/sh
# WARNING! This file should not be executed directly.
#
# Symlink - library for simple symlink manipulations.
################################################################################

# Resolves a symlink.
# This was written because macOS has no GNU readlink by default.
__symlink_resolve() {
    cd $(dirname "$1")
    echo "$(pwd -P)/$(basename "$1")"
    cd - 1>/dev/null
}
