#
# Homebrew
#

alias brup="brew update"
alias brug="brew upgrade"

alias brl="brew list --versions"
alias brcl="brew cask list --versions"

alias brs="brew search"
alias brcs="brew cask search"

alias brif="brew info"
alias brcif="brew cask info"

alias bri="brew install"
alias brci="brew cask install"

#
# Remap macOS core utils to GNU
#

alias sed="gsed"

#
# macOS specific versions of commands
#

alias dateiso='date -u +"%Y-%m-%dT%H:%M:%SZ"'

alias tlis="lsof -iTCP -sTCP:LISTEN -n -P"
alias stlis="sudo lsof -iTCP -sTCP:LISTEN -n -P"

alias dns-flush="sudo killall -HUP mDNSResponder"

#
# iTerm2
#

tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

tab-color-red() {
    tab-color 244 67 54
}

tab-color-pink() {
    tab-color 233 30 99
}

tab-color-purple() {
    tab-color 156 39 176
}

tab-color-green() {
    tab-color 76 175 80
}

tab-color-lime() {
    tab-color 205 220 57
}

tab-color-yellow() {
    tab-color 255 183 77
}

tab-color-indigo() {
    tab-color 140 158 255
}

tab-color-teal() {
    tab-color 167 255 235
}

tab-color-orange() {
    tab-color 255 209 128
}

tab-color-blue() {
    tab-color 130 177 255
}

tab-color-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}

#
# Utilities
#

alias pcat="pygmentize -O style=native -g"
alias pless="pcat | less -R"
alias -g PC="| pcat"
alias -g PL="| pless"

#
# Shortcuts
#
alias cdb='cd $SOURCES_ROOT/github.com/hypnoglow/macOS-bootstrap'
