### EXPORTS & VARIABLES ###
#
# Some refs:
# http://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path
# http://unix.stackexchange.com/questions/68694/when-is-double-quoting-necessary/68748#68748
#
# @todo rewrite using functions, checking paths, et cetera.
# @todo If app is installed in something like /usr/local/ or /opt/, then
#       exports should be defined for any user in /etc/profile
#
################################################################################

# Check that path functions are defined.
declare -f -F pathappend > /dev/null
[ $? -ne 0 ] && echo "WARNING: path functions are not defined!" >&2

# golang path
export GOPATH="$HOME/projects/go"
pathappend "/usr/local/go/bin"
pathappend "$GOPATH/bin"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    pathprepend "$HOME/bin"
fi

# include applications binaries
if [ -d "$HOME/apps/bin" ] ; then
    pathprepend "$HOME/apps/bin"
fi

# n - Node.js version manager (see http://git.io/n-install-repo)
if [ -d "$HOME/apps/n" ] ; then
    export N_PREFIX="$HOME/apps/n";
    pathprepend "$N_PREFIX/bin"
fi
