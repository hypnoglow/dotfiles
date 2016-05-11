#
# Aliases for zsh
#

#
# Default arguments for basic commands
#
alias cp="cp -i"
alias free="free -m"

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

#
# Simple functions
#

ex() {
    if [ -z "$1" ] ; then
        echo >&2 'File not specified'
        return 1
    fi

    if [ ! -f "$1" ] ; then
        echo "'$1' is not a valid file"
    fi

    case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1   ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1   ;;
        *.tgz)       tar xzf $1   ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1;;
        *.7z)        7z x $1      ;;
        *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
}
