#!/bin/sh
# WARNING! This file should not be executed directly.
# Shebang here is for shellcheck.
#
### EXPORTS & VARIABLES ###
################################################################################

# Golang path
if [ -d "${HOME}/go/bin" ]; then
    pathf_prepend "${HOME}/go/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
    pathf_prepend "${HOME}/bin"
fi

if [ ! -d "${HOME}/.local/bin" ]; then
    mkdir -p "${HOME}/.local/bin"
fi
pathf_prepend "${HOME}/.local/bin"
