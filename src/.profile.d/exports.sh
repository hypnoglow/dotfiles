### EXPORTS & VARIABLES ###
#
# Some refs:
# http://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path
# http://unix.stackexchange.com/questions/68694/when-is-double-quoting-necessary/68748#68748
#
# @todo If app is installed in something like /usr/local/ or /opt/, then
#       exports should be defined for any user in /etc/profile
#
################################################################################

# Check that path functions are defined.
if ! declare -f -F pathappend > /dev/null; then
    _ddebug "WARNING: path functions are not defined (in exports.sh)!"
fi

# golang path
if [ -x "$(which go 2>/dev/null)" ]; then
    export GOPATH="${HOME}/go"
    pathappend "${GOPATH}/bin"
fi

# n - Node.js version manager (see http://git.io/n-install-repo)
if [ -d "$HOME/apps/n" ] ; then
    export N_PREFIX="$HOME/apps/n";
    pathprepend "$N_PREFIX/bin"
fi

# include applications binaries
if [ -d "$HOME/apps/bin" ] ; then
    pathprepend "$HOME/apps/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    pathprepend "$HOME/bin"
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
