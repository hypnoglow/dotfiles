# This file contains output of `/opt/homebrew/bin/brew shellenv`

#echo "[dotfiles]==> Loading 'homebrew.sh' ..."

if [ ! -d "/opt/homebrew" ]; then
  return
fi

#
# Core configuration
#

export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

#
# Optional configuration
#

# Disables 'brew cleanup <installed_package>'
#export HOMEBREW_NO_INSTALL_CLEANUP="1"

# TODO: describe
#export HOMEBREW_NO_AUTO_UPDATE=1
