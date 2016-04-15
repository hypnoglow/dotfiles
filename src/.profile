#
# ~/.profile: executed by the command interpreter for login shells.
#

# This file is not read by bash(1),
# if ~/.bash_profile or ~/.bash_login exists.
# This file is not read by zsh(1) by default,
# so it should be sourced manually in ~/.zprofile

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

################################################################################

if [ ! -d "${HOME}/.profile.d" ]; then
    echo "WARNING! ~/.profile.d not found." >> "${HOME}/DOTS_ERRORS.log"
    return
fi

# Include everything from ~/.profile.d
# `(path|log)_functions.sh` are loaded manually.
. "${HOME}/.profile.d/path_functions.sh"
. "${HOME}/.profile.d/log_functions.sh"

_ddebug "Loading ~/.profile"

files=$( find "${HOME}/.profile.d/" -type f \
    -name '*.sh' -a ! -name '*_functions.sh' )

for file in ${files} ; do
    if [ -r "${file}" ]; then
        _ddebug "Reading file ${file}"
        . "${file}"
    fi
done

unset file files
