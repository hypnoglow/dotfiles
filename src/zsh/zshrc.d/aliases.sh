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
alias du1='du -d 1 -BM | sort -n -k1 -r | less -XSF'
alias du2='du -d 2'
alias tf='tail -f'
alias 1='watch -n1'

alias -g C='| wc -l'
alias -g H='| head'
alias -g T='| tail'
alias -g L='| less'
alias -g S='| sort'
alias -g G='| grep'

alias cdd='cd $DOTFILES_ROOT'

alias reload-zsh=". ~/.zshrc"
alias reload-xresources="xrdb -load -quiet ~/.Xresources"

alias psa="ps aux"
alias psg="ps aux | grep"

alias dss="cdiff -s -w 0 -c auto HEAD"

#
# Git
#
alias gst="git status"
alias gcb="git checkout -b"
alias gdt="git difftool"

#
# Docker
#
alias d="docker"
alias dpa="docker ps -a"
alias dm="docker-machine"
alias dme="docker-machine-env"
docker-machine-env() { test -z "$1" && return 1 ; eval $(dm env $1) }

#
# Simple functions
#

fnd() {
    [ -z "$1" ] && echo "Pattern not specified." && return 1
    ls **/*$1*
}

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

dfi() {
    cd $DOTFILES_ROOT
    git checkout master
    git pull
    ./install
    cd -
}
