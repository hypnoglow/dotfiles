# This file includes linux-specific zsh plugins.

if type -f urxvt &>/dev/null; then
    # Makes urxvt work with interactive ssh.
    zplug "seletskiy/zsh-ssh-urxvt"
fi

# Fish shell feature.
if [ "$TERM" != "linux" ]; then
    zplug "zsh-users/zsh-autosuggestions"
fi
