# All STDERR output is in red color.
# https://github.com/sickill/stderred
if [ -f /opt/stderred/build/libstderred.so ] ; then
    export LD_PRELOAD="/opt/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
fi

# Enable FUCK
eval "$(thefuck --alias)"