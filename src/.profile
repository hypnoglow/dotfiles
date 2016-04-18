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

. "${HOME}/.sh/dot_logger.sh"

if [ ! -d "${HOME}/.profile.d" ]; then
    echo "WARNING! ~/.profile.d not found." >> "${HOME}/DOTS_ERRORS.log"
    return
fi

dot_logger::log "Loading ~/.profile"

for file in ${HOME}/.profile.d/*.sh ; do
    if [ -r "${file}" ]; then
        dot_logger::log "Reading file ${file}"
        . "${file}"
    fi
done
unset file
