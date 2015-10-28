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

# golang path
export GOPATH="$HOME/projects/go"
PATH="$PATH:/usr/local/go/bin"
PATH="$PATH:$GOPATH/bin"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# include applications binaries
if [ -d "$HOME/apps/bin" ] ; then
    PATH="$HOME/apps/bin:$PATH"
fi