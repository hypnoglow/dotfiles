# This file should be source'd in .bashrc.

# Include autocomplete for user binaries in $HOME/bin
if [ -n ${HOME}/bin/autocomplete ]; then
    . $HOME/bin/autocomplete.sh
fi
