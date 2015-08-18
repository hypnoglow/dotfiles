# ~/.bash_logout is executed by bash(1) when login shell exits.

# when leaving the console, clear the screen to increase privacy
if [ "$SHLVL" = 1 ] ; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console
    [ -x /usr/bin/reset ] && /usr/bin/reset
fi
