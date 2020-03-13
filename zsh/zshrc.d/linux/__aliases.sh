alias wfl='nmcli device wifi list'
alias wfc='nmcli device wifi con'

#
# Shortcuts
#
alias cdb='cd $SOURCES_ROOT/github.com/hypnoglow/manjaro-bootstrap'

# Kitty terminal setup for remote ssh host.
# See: https://sw.kovidgoyal.net/kitty/faq.html#i-get-errors-about-the-terminal-being-unknown-or-opening-the-terminal-failing-when-sshing-into-a-different-computer
kitty-ssh-term() {
    infocmp xterm-kitty | ssh $1 tic -x -o \~/.terminfo /dev/stdin
}
kitty-ssh-term-gcloud() {
    infocmp xterm-kitty | $(gcloud compute ssh $1 --dry-run) tic -x -o \~/.terminfo /dev/stdin
}
