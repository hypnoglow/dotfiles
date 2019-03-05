#!/bin/sh
# WARNING! This file should not be executed directly.
# Shebang here is for shellcheck.
#
### EXPORTS & VARIABLES ###
################################################################################

# golang path
if [ -x "$(which go 2>/dev/null)" ]; then
    export GOPATH="${HOME}/go"
    pathf_prepend "${GOPATH}/bin"
fi

# Rust binaries path
if [ -d "${HOME}/.cargo/bin" ] ; then
    pathf_prepend "${HOME}/.cargo/bin"
fi

# n - Node.js version manager (see http://git.io/n-install-repo)
if [ -d "${HOME}/apps/n" ] ; then
    export N_PREFIX="${HOME}/apps/n";
    pathf_prepend "$N_PREFIX/bin"
fi

if [ -d "$HOME/Library/Python/3.7/bin" ]; then
    pathf_prepend "$HOME/Library/Python/3.7/bin"
fi

if [ -d "$HOME/.linkerd2/bin" ]; then
    pathf_append "$HOME/.linkerd2/bin"
fi

if [ -d "$HOME/.krew/bin" ]; then
    pathf_append "$HOME/.krew/bin"
fi

# NGS binaries
if [ -d "${HOME}/ngs/bin" ] ; then
    pathf_prepend "${HOME}/ngs/bin"
fi

# include applications binaries
if [ -d "${HOME}/apps/bin" ] ; then
    pathf_prepend "${HOME}/apps/bin"
fi

# Composer global binaries
if [ -d "${HOME}/.config/composer/vendor/bin" ] ; then
    pathf_prepend "${HOME}/.config/composer/vendor/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
    pathf_prepend "${HOME}/bin"

    if [ -d "${HOME}/bin/local" ] ; then
        pathf_prepend "${HOME}/bin/local"
    fi
fi

if [ ! -d "${HOME}/.local/bin" ]; then
    mkdir -p "${HOME}/.local/bin"
fi
pathf_prepend "${HOME}/.local/bin"

# Workstation profile
if [ -z "${WS_PROFILE}" ]; then
    WS_PROFILE="default"
    case "$(hostname)" in
        rigel)
            WS_PROFILE="vm"
        ;;
        vega|procyon)
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


if [ -x "$(which google-chrome-stable 2>/dev/null)" ]; then
    BROWSER="$(which google-chrome-stable)"
else
    # This is to stop xdg-open from going to
    # infinite loop when trying to open an URL.
    BROWSER=""
fi
export BROWSER

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
