#
# Includes
#

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# https://github.com/direnv/direnv
[ -x "$(which direnv 2>/dev/null)" ] && eval "$(direnv hook zsh)"
