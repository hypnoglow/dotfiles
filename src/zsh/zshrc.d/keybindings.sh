# Notice: human-friendly identifiers ('key_info') are defined in 'input' module
# of ZIM framework.

zle-custom-backward-kill-subword() {
    local WORDCHARS=${WORDCHARS//[\/-]}
    zle backward-kill-word
}
zle -N zle-custom-backward-kill-subword

zle-custom-replace-first-word-of-last-command() {
     zle up-history
     zle beginning-of-line
     zle delete-word
}
zle -N zle-custom-replace-first-word-of-last-command

zle-custom-replace-last-word-of-last-command() {
    zle up-history
    zle end-of-line
    zle backward-delete-word
}
zle -N zle-custom-replace-last-word-of-last-command

bindkey "^[^?" zle-custom-backward-kill-subword
bindkey "^H" backward-kill-word

bindkey "^[" zle-custom-replace-first-word-of-last-command
bindkey "^]" zle-custom-replace-last-word-of-last-command
