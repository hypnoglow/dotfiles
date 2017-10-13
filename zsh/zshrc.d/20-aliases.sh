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

alias tr1='tree -L 1'
alias tr2='tree -L 2'

alias ccat='grep -v -e "^#" -e "^$"t'

alias -g C='| wc -l'
alias -g H='| head'
alias -g T='| tail'
alias -g L='| less'
alias -g S='| sort'
alias -g G='| grep'
alias -g N1='| cat -n'
alias -g N2='| cat -b'
alias -g PHPG='| egrep -v "^(;|$)"'

alias cdd='cd $DOTFILES_ROOT'
alias cdg='cd $GOPATH/src'
if [[ "$OSTYPE" = *darwin* ]]; then
    alias cdb='cd $SOURCES_ROOT/hypnoglow/macOS-bootstrap'
else
    alias cdb='cd $SOURCES_ROOT/hypnoglow/manjaro-bootstrap'
fi
alias cds='cd $SOURCES_ROOT'
alias cdsh='cd $SOURCES_ROOT/hypnoglow'

alias bootstrap='(cdb && ./bootstrap ${WS_PROFILE})'
alias reload-zsh=". ~/.zshrc"
alias reload-xresources="xrdb -load -quiet ~/.Xresources"

alias psa="ps aux"
alias psg="ps aux | grep"

alias dss="cdiff -s -w 0 -c auto HEAD"

# Atom
alias a="atom ."
alias aa="atom -a ."
alias aaw="atom -a -n ."

#
# Git
#
alias gst="git status"
alias gbC="git checkout -B"
alias gdt="git difftool"
alias gpf="git push --force-with-lease"
alias gpff="git push --force"
alias gcx="git commit --amend --reset-author --no-edit"
alias gtr="git log --graph --all --date=relative --pretty=format:'%Cred%h %Creset%<|(50,trunc)%s %C(bold blue)<%an>%Creset %Cgreen(%cd)%Creset%C(auto)%d'"
alias git-clean-merged-branches='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d ; git remote prune origin'

#
# Composer
#
alias cri='composer install       --ignore-platform-reqs'
alias cru='composer update        --ignore-platform-reqs'
alias crr='composer require       --ignore-platform-reqs'
alias crd='composer require --dev --ignore-platform-reqs'

#
# Vagrant
#
alias vg='vagrant'
alias vgu='vagrant up'
alias vgh='vagrant halt'
alias vgd='vagrant destroy --force'
alias vgs='vagrant ssh'

#
# Docker
#
alias d="docker"
alias dri="docker run -ti"
alias dpa="docker ps -a"
alias drmf="docker rm -f"
dst() {
    # docker search tags
    curl -sS "https://registry.hub.docker.com/v2/repositories/$1/tags/" | jq '."results"[]["name"]' |sort
}
alias dex="docker exec -i -t"
dgi() {
    # docker go into container
    docker exec -i -t "$1" /bin/sh
}
alias dvl="docker volume ls"
alias dvc="docker volume create"
alias dvi="docker volume inspect"

alias docker-clean-containers='docker ps --filter "status=exited" -a -q | xargs docker rm -v'
alias docker-clean-images='docker images --filter "dangling=true" -q | xargs docker rmi'
alias docker-clean-volumes='docker volume ls --filter dangling=true | xargs docker volume rm'

alias dm="docker-machine"
alias dme="docker-machine env"

alias dc="docker-compose"

#
# k8s
#

alias k="kubectl" # hardcore
alias ku="kubectl"
alias kucv="kubectl config view"
kusp() {
    # kubectl service port
    kubectl describe service $1 | grep "NodePort:" | cut -f 4 | cut -d "/" -f 1
}
kuns() {
    if [ -z "$1" ]; then
        kubectl config get-contexts | egrep "\*" | awk '{print $NF}'
    else
        kubectl config set-context $(kubectl config current-context) --namespace $1
    fi
}
kuctx() {
    if [ -z "$1" ]; then
        kubectl config get-contexts
    else
        kubectl config use-context $1
    fi
}

alias mik='minikube'
alias miks='minikube start --vm-driver xhyve'
alias mikdb='chrome-cli open $(minikube dashboard --url)'
alias mikds='eval $(minikube docker-env)'
alias mikdu='eval $(minikube docker-env -u)'

#
# Go tools
#

alias gob='go build'
alias goc='go clean'
alias god='go doc'
alias gof='go fmt'
alias gofa='go fmt . ./...'
alias gog='go get'
alias goi='go install'
alias gol='go list'
alias gor='go run'
alias got='go test'
alias gota='go test ./...'
alias gotav='go test -v ./...'
alias gotv='go test $(go list ./... | grep -v "/vendor/")'
alias gotvv='go test -v $(go list ./... | grep -v "/vendor/")'
alias gov='go vet'
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

# OS-specific aliases
if [ -e "${HOME}/.zshrc.d/aliases/list.sh" ]; then
    . "${HOME}/.zshrc.d/aliases/list.sh"
fi
