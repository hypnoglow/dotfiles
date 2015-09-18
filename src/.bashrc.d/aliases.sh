# This is an include file for .bashrc

# listings
alias   l='ls --color=auto -F'
alias  ll='ls --color=auto -F -lh'
alias   L='ls --color=auto -F     -L'
alias  LL='ls --color=auto -F -lh -L'
alias  la='ls --color=auto -F        -a'
alias lla='ls --color=auto -F -lh    -a'
alias  l.='ls --color=auto -F        -A --ignore=\*'
alias ll.='ls --color=auto -F -lh    -A --ignore=\*'
alias treec="tree -C"

# common things
alias ..="cd .."
alias h='history'
alias g='git'

# >:]
alias suka="sudo"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias duc='du -hd1'
alias manru='man -L ru'
alias mansearch='apropos'

# wtf
alias fucking_swap='vmstat 60 -S M'

# apt-get
alias agi='sudo apt-get install'
alias agu='sudo apt-get update'
alias agar='sudo apt-get autoremove'

# bash-specific
alias bashenv='bash -c set'

#alias memory-usage=ps -e -orss=,pid=,args= | sort -nr | head | awk '{print $2"\t"$1/1024"\tMB\t"$3;}'

alias realsync-status="ps u | grep realsync | grep -v grep"
