# Linux specific aliases.

alias cb='xclip -selection clipboard'

alias wfl='nmcli device wifi list'
alias wfc='nmcli device wifi con'

alias reload-xresources="xrdb -load -quiet ~/.Xresources"

#
# Shortcuts
#
alias cdb='cd $SOURCES_ROOT/github.com/hypnoglow/manjaro-bootstrap'

# Kitty terminal setup for remote ssh host.
# See: https://sw.kovidgoyal.net/kitty/faq.html#i-get-errors-about-the-terminal-being-unknown-or-opening-the-terminal-failing-when-sshing-into-a-different-computer
kitty-ssh-term() {
    infocmp xterm-kitty | ssh $@ tic -x -o \~/.terminfo /dev/stdin
}
kitty-ssh-term-gcloud() {
    infocmp xterm-kitty | $(gcloud compute ssh $@ --dry-run) tic -x -o \~/.terminfo /dev/stdin
    gcloud compute ssh $@
}

alias ggc="git log --pretty=format:'%h' -1 | xclip -selection clipboard"
