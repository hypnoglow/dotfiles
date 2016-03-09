# ~/.bashrc: executed by bash(1) for interactive non-login shells. ɀ
#
# However, in ~/.profile , there is a ~/.bashrc include,
# so, actually, it IS executed for login shells also.
#
# See bash(1) for more options you can set.
#
################################################################################

# If not running interactively, don't do anything.
if [[ $- != *i* ]] ; then
    return
fi

# VARIABLES

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=20000

# SHELL BUILTIN

# Prevents from redirecting output to an existing file, or appending output to a non-existing file.
# Remember you can override this with >|
set -o noclobber

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# MISC

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Default prompt, if not further overriden
C_RED="\[\033[01;31m\]"
C_GREEN="\[\033[01;32m\]"
C_MAGENTA="\[\033[01;35m\]"
C_CIAN="\[\033[01;36m\]"
C_RESET="\[\033[00m\]"
PS1="${debian_chroot:+($debian_chroot)}$C_GREEN\u$C_RESET@$C_MAGENTA\h$C_RESET:$C_CIAN\w$C_RESET$C_REDɀ$C_RESET "
unset C_RED C_GREEN C_MAGENTA C_CIAN C_RESET debian_chroot

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix && [ -z "$BASH_COMPLETION_COMPAT_DIR" ] ; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# And finally include all from ~/.bashrc.d
if [ -d $HOME/.bashrc.d ]; then
    for file in $HOME/.bashrc.d/* ; do
        if [ -r $file ]; then
            . $file
        fi
    done
    unset file
fi

case $TERM in
    screen)
        # In screen - override PROMT_COMMAND to make screen title work.
        # ref:http://aperiodic.net/screen/title_examples
        CURRENT_PROMPT_COMMAND="$PROMPT_COMMAND"
        __prompt_command() {
            echo -n -e '\033k\033\\'
            $(echo $CURRENT_PROMPT_COMMAND)
        }
        PROMPT_COMMAND=__prompt_command
    ;;
esac

# Overwrites bash-it setups.

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
