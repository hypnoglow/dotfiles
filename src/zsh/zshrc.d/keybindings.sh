# Notice: human-friendly identifiers ('key_info') are defined in 'input' module
# of ZIM framework.

zle-custom-backward-kill-subword() {
    local WORDCHARS=${WORDCHARS//[\/]}
    zle backward-kill-word
}
zle -N zle-custom-backward-kill-subword

bindkey "^[^?" zle-custom-backward-kill-subword
bindkey "^H" backward-kill-word
