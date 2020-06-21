# Based on default Ubuntu 18.04 .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

###############################################################################
# History
###############################################################################
# History size
HISTSIZE=2000
HISTFILESIZE=5000

# Don't put duplicate lines and lines starting with space in the history
HISTCONTROL=ignoreboth

###############################################################################
# Options
###############################################################################
# Append to the history file, don't overwrite it
shopt -s histappend

# Save multiline commands to the same history entry
shopt -s cmdhist

# Automatically "cd" when entering path
shopt -s autocd

# Check the window size (for correct wrapping)
shopt -s checkwinsize

# Correct spelling errors when "cd" into a directory
shopt -s cdspell

###############################################################################
# Prompt
###############################################################################
# Set variable identifying the chroot you work in
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Try to detect if the terminal has color support
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
else
    case "$TERM" in
        xterm-color|*-256color) color_prompt=yes;;
        *) color_prompt= ;;
    esac
fi

# Set prompt
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00;36m\]@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[32m\]\$\[\033[00m\] '
    PS2='\[\033[01;33m\]>\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS2='>'
fi
unset color_prompt

# Set window title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

###############################################################################
# Aliases
###############################################################################
# Enable color support of ls and stuff
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# More ls aliases
alias ll='ls -lhF'
alias lla='ls -alhF'
alias la='ls -A'

# Send alert: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Some safety precautions
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Print path with each entry on separate line
alias ppath='echo -e ${PATH//:/\\n}'

# Show all listening ports
alias lslisten='sudo netstat -lnptu'

# Show all network connections
alias lsconn='sudo netstat -nape --inet --inet6'

###############################################################################
# Functions
###############################################################################
function stopwatch()
(
    local begin_timestamp=`date +%s`
    echo "  started  > $(date --date @$begin_timestamp +%H:%M:%S)"

    print_timestamp_diff()
    {
        local begin=$1
        local end=$2
        echo -ne "  duration > $(date -u --date @$(($end - $begin)) +%H:%M:%S)\r"
    }

    trap 'echo -ne "\r"; print_timestamp_diff $begin_timestamp `date +%s`; echo -e "\n  finished > $(date +%H:%M:%S)"; exit;' SIGINT

    while true; do
        print_timestamp_diff $begin_timestamp `date +%s`
        sleep 0.5
    done
)

###############################################################################
# Other
###############################################################################
# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

