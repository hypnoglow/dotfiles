#
# Includes
#

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# https://github.com/jonmosco/kube-ps1
# TODO: move to macos-specific
if [ -f /usr/local/opt/kube-ps1/share/kube-ps1.sh ] ; then
    . /usr/local/opt/kube-ps1/share/kube-ps1.sh
fi

# https://github.com/direnv/direnv
[ -x "$(which direnv 2>/dev/null)" ] && eval "$(direnv hook zsh)"
