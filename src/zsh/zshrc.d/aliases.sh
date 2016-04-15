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

#
# Atom
#
alias atom-sync="apm list --bare --installed | tee ~/.atom/packages.list > /dev/null"
alias atom-install="apm install --production --packages-file ~/.atom/packages.list"
