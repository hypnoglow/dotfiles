#!/bin/sh
# WARNING! This file should not be executed directly.
# Shebang here is for shellcheck.
#
# ~/.xinitrc
#
# Executed by startx or xinit
# (run your window manager from here).
# This is not sourced by lightdm.

. "${HOME}/.sh/POSIX/dot_logger.sh"

dot_logger_log "Loading ~/.xinitrc"

# Load xprofile manually
[ -r "${HOME}/.xprofile" ] && . ${HOME}/.xprofile

exec i3

#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
