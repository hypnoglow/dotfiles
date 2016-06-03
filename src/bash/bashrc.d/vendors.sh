# This is an include file for .bashrc

# Include all vendors stuff here.

# All STDERR output is in red color.
# https://github.com/sickill/stderred
if [ -f /opt/stderred/build/libstderred.so ] ; then
    export LD_PRELOAD="/opt/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
fi

# Enable FUCK
# https://github.com/nvbn/thefuck
if [ -x "$(which thefuck 2>/dev/null)" ]; then
    eval "$(thefuck --alias)"
fi
