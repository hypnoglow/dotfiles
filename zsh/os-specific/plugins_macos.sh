# Fish shell feature.
if [ "$TERM" != "linux" ]; then
    zplug "zsh-users/zsh-autosuggestions"
fi

zplug "djui/alias-tips", defer:3

zplug "hypnoglow/kubezsh"
