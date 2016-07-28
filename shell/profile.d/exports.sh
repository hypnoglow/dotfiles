#!/bin/sh
# WARNING! This file should not be executed directly.
# Shebang here is for shellcheck.
#
### EXPORTS & VARIABLES ###
################################################################################

. "${HOME}/.sh/POSIX/pathf.sh"

# golang path
if [ -x "$(which go 2>/dev/null)" ]; then
    export GOPATH="${HOME}/go"
    pathf_prepend "${GOPATH}/bin"
fi

# n - Node.js version manager (see http://git.io/n-install-repo)
if [ -d "${HOME}/apps/n" ] ; then
    export N_PREFIX="${HOME}/apps/n";
    pathf_prepend "$N_PREFIX/bin"
fi

# NGS binaries
if [ -d "${HOME}/ngs/bin" ] ; then
    pathf_prepend "${HOME}/ngs/bin"
fi

# include applications binaries
if [ -d "${HOME}/apps/bin" ] ; then
    pathf_prepend "${HOME}/apps/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
    pathf_prepend "${HOME}/bin"
fi

# Workstation profile
if [ -z "${WS_PROFILE}" ]; then
    WS_PROFILE="default"
    case "$HOSTNAME" in
        rigel)
            WS_PROFILE="vm"
        ;;
        vega)
            WS_PROFILE="job"
        ;;
        naos)
            WS_PROFILE="laptop"
        ;;
        sirius)
            WS_PROFILE="desktop"
        ;;
    esac
    export WS_PROFILE
fi


# This variable is already exported.
if [ -x "$(which google-chrome-stable 2>/dev/null)" ]; then
    BROWSER="$(which google-chrome-stable)"
else
    # This is to stop xdg-open from going to
    # infinite loop when trying to open an URL.
    BROWSER=""
fi

SOURCES_ROOT="${HOME}/sources"
export SOURCES_ROOT
DOTFILES_ROOT="$(dirname $(dirname $(readlink -e "${HOME}/.profile")))"
export DOTFILES_ROOT
