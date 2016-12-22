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
alias als='less ${HOME}/.zshrc.d/aliases.sh'
alias h='history'
alias cb='xclip -selection clipboard'
alias tarls='tar t --exclude="*/*" -f'
alias du1='du -d 1 -BM | sort -n -k1 -r | less -XSF'
alias du2='du -d 2'
alias tf='tail -f'
alias 1='watch -n1'

alias wfl='nmcli device wifi list'
alias wfc='nmcli device wifi con'

alias ccat='grep -v -e "^#" -e "^$"t'

alias -g C='| wc -l'
alias -g H='| head'
alias -g T='| tail'
alias -g L='| less'
alias -g S='| sort'
alias -g G='| grep'
alias -g N1='| cat -n'
alias -g N2='| cat -b'

alias cdd='cd $DOTFILES_ROOT'
alias cdg='cd $GOPATH/src/github.com/hypnoglow'
alias cdb='cd $SOURCES_ROOT/hypnoglow/manjaro-bootstrap'
alias cds='cd $SOURCES_ROOT/hypnoglow'

alias bootstrap='(cdb && ./bootstrap ${WS_PROFILE})'
alias reload-zsh=". ~/.zshrc"
alias reload-xresources="xrdb -load -quiet ~/.Xresources"

alias psa="ps aux"
alias psg="ps aux | grep"

alias dss="cdiff -s -w 0 -c auto HEAD"

# Atom
alias a="atom ."
alias aa="atom -a ."

#
# Git
#
alias gst="git status"
alias gdt="git difftool"
alias gpf="git push --force-with-lease"
alias gcx="git commit --amend --reset-author --no-edit"
alias gtr="git log --graph --all --date=relative --pretty=format:'%Cred%h %Creset%<|(50,trunc)%s %C(bold blue)<%an>%Creset %Cgreen(%cd)%Creset%C(auto)%d'"
alias git-clean-merged-branches='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

#
# Docker
#
alias d="docker"
alias dri="docker run -ti"
alias dpa="docker ps -a"
alias drmf="docker rm -f"

alias dvl="docker volume ls"
alias dvc="docker volume create"
alias dvi="docker volume inspect"

alias docker-clean-containers='docker ps --filter "status=Exited" -a -q | xargs docker rm'
alias docker-clean-images='docker images --filter "dangling=true" -q | xargs docker rmi'
alias docker-clean-volumes='docker volume ls --filter dangling=true | xargs docker volume rm'

alias dm="docker-machine"
alias dme="docker-machine env"

alias dc="docker-compose"

#
# Go tools
#
alias goml='gometalinter --concurrency=1 --deadline=30s ./...'
gocov() {
    go-carpet "$@" | less -R
}
alias gocoh='go test -coverprofile cover.out && go tool cover -html=cover.out'
alias gocof='go test -coverprofile cover.out && go tool cover -func=cover.out'
alias gofw='goimports -local ${PWD##$GOPATH/src/} -l -w .'
alias gofd='goimports -local ${PWD##$GOPATH/src/} -l -d .'

#
# Simple functions
#

unzipr() {
    [ -z "$1" ] && echo "Directory not specified." && return 1
    find "$1" -type f -name '*.zip' -print0 | xargs -P 5 -I fileName sh -c 'unzip -o -d "$(dirname "fileName")/$(basename -s .zip "fileName")" "fileName"'
}

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
