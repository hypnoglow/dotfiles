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

# include applications binaries
if [ -d "${HOME}/apps/bin" ] ; then
    pathf_prepend "${HOME}/apps/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
    pathf_prepend "${HOME}/bin"
fi

# Workstation profile
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
esac
export WS_PROFILE

# Browser is already exported
BROWSER=""
