#
# Includes
#

# Prompt. Note that other plugins that modify prompt must not be included BEFORE
# this, otherwise they will not take effect.
if type -f starship &> /dev/null; then
    eval "$(starship init zsh)"
fi


[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# https://github.com/direnv/direnv
[ -x "$(which direnv 2>/dev/null)" ] && eval "$(direnv hook zsh)"
