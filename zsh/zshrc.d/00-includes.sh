#
# Includes
#

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# https://github.com/jonmosco/kube-ps1
if [ -f /usr/local/opt/kube-ps1/share/kube-ps1.sh ]; then
    . /usr/local/opt/kube-ps1/share/kube-ps1.sh
    KUBE_PS1_SUFFIX=") " # Add space to separate prompt symbol
    PROMPT='$(kube_ps1)'$PROMPT
fi

# https://github.com/direnv/direnv
[ -x "$(which direnv 2>/dev/null)" ] && eval "$(direnv hook zsh)"
