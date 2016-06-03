# This is an include file for .bashrc

#
# Listings
#

alias  ls='ls --color=auto -F --group-directories-first --time-style=+"%d.%m.%Y %H:%M"'
alias   l='ls -lh -A'
alias  ll='ls -lh'
alias  la='ls     -A'

alias   L='ls -lh -A -L'
alias  LL='ls -lh    -L'
alias  LA='ls     -A -L'

alias  l.='ls     -A    --ignore=\*'
alias ll.='ls -lh -A    --ignore=\*'

#
# Navigation
#
alias ..="cd .."

#
# Shortcuts
#
alias h='history'
alias g='git'
alias cb='xclip -selection clipboard'

# >:]
alias suka="sudo"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias duc='du -hd1'
#alias dutop='du -d1 -BM | sort -n -k1 -r | head'
dutop() {
    du -d1 -BM  $1 | sort -n -k1 -r | head
}
alias manru='man -L ru'
alias mansearch='apropos'

# X
alias reload-xresources="xrdb -merge ~/.Xresources"

if [[ "$(lsb_release -i)" =~ "Ubuntu" ]]; then
    alias ap='sudo aptitude'
    alias apti='sudo aptitude install'
    alias aptu='sudo aptitude update'
    alias aptar='sudo aptitude autoremove'
fi

# atom sync
alias atom-sync="apm list --bare --installed | tee ~/.atom/packages.list > /dev/null"
alias atom-install="apm install --production --packages-file ~/.atom/packages.list"

# Apps shortcuts
alias snd="alsamixer"

# Some rarely used things that are not important to remember.
alias fucking_swap='vmstat 60 -S M'
alias bashenv='bash -c set'
alias clear-fonts-cache="sudo fc-cache -f -v"
alias kc="xmodmap -pke"

# Custom projects aliases
alias n1-auth="bash <(curl -s http://git.rn/users/i.zibarev/repos/snippets/browse/n1/auth/n1-auth-token-claimant.bash?raw)"
