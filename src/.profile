# ~/.profile: executed by the command interpreter for login shells.

# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

################################################################################

# Monitor preferences
# TODO: this should not be here.
#       Move this to local rc files.
if [ "${HOSTNAME}" = "procyon" ]; then
    xrandr --output HDMI-0 --left-of DVI-I-1
fi

# Include everything from ~/.profile.d
# `path_functions.sh` is loaded manually.
if [ -d $HOME/.profile.d ]; then
    . "$HOME/.profile.d/path_functions.sh"

    files=$( find "$HOME/.profile.d/" -type f \
        -name '*.sh' -a ! -name 'path_functions.sh' )

    for file in "$files" ; do
        [ -r "$file" ] && . "$file"
    done

    unset file files
fi
