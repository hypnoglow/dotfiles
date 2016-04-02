# ~/.profile: executed by the command interpreter for login shells.

# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

################################################################################

# Include everything from ~/.profile.d
# `path_functions.sh` is loaded manually.
if [ -d $HOME/.profile.d ]; then
    . "$HOME/.profile.d/path_functions.sh"

    files=$( find "$HOME/.profile.d/" -type f \
        -name '*.sh' -a ! -name 'path_functions.sh' )

    for file in ${files} ; do
        echo "[$(date)] loading file ${file}" >> /tmp/dot_profile.log
        if [ -r "${file}" ]; then
            echo "[$(date)] reading file ${file}" >> /tmp/dot_profile.log
            . "$file"
        fi
    done

    unset file files
fi
