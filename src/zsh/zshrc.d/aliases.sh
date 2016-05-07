#
# Aliases for zsh
#

#
# Default arguments for basic commands
#
alias cp="cp -i"

#
# Shortcuts
#
alias h='history'
alias cb='xclip -selection clipboard'
alias tarls='tar t --exclude="*/*" -f'
alias cdd='cd $DOTFILES_ROOT'

alias reload-zsh=". ~/.zshrc"
alias reload-xresources="xrdb -load -quiet ~/.Xresources"

#
# Atom
#
alias atom-sync="apm list --bare --installed | tee ~/.atom/packages.list > /dev/null"
alias atom-install="apm install --production --packages-file ~/.atom/packages.list"

#
# Git
#
alias gst="git status"
alias gcb="git checkout -b"
alias gdt="git difftool"
