# This is an include file for .bashrc

# listings
alias   l='ls --color=auto -F'
alias  ll='ls --color=auto -F -lh'
alias  la='ls --color=auto -F        -A'
alias lla='ls --color=auto -F -lh    -A'
alias   L='ls --color=auto -F     -L'
alias  LL='ls --color=auto -F -lh -L'
alias  LA='ls --color=auto -F     -L -A'
alias LLA='ls --color=auto -F -lh -L -A'
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
alias dutop='du -d1 -BM | sort -n -k1 -r | head'
alias manru='man -L ru'
alias mansearch='apropos'

# apt-get
alias agi='sudo apt-get install'
alias agu='sudo apt-get update'
alias agar='sudo apt-get autoremove'

# Some rarely used things that are not important to remember.
alias fucking_swap='vmstat 60 -S M'
alias bashenv='bash -c set'
alias clear-fonts-cache="sudo fc-cache -f -v"

# Custom projects aliases
alias n1-auth="bash <(curl -s http://git.rn/users/i.zibarev/repos/snippets/browse/n1/auth/n1-auth-token-claimant.bash?raw) z.d"