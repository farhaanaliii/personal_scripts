# my msys2 .bashrc
# Wed, Mar  4, 2026 10:26:10 AM

[[ "$-" != *i* ]] && return

if [ -z "$WINDOWS_PATH_IMPORTED" ]; then
    export WINDOWS_PATH_IMPORTED=1
    WIN_PATH=$(cmd //C "echo %PATH%" | tr -d '\r' | tr ';' ':' | awk -v RS=: -v ORS=: '!seen[$0]++')
    export PATH=$(echo "/usr/local/bin:/usr/bin:/bin:/opt/bin:$WIN_PATH" | awk -v RS=: -v ORS=: '!seen[$0]++' | sed 's/:$//')
fi

RED='\[\e[1;31m\]'
GREEN='\[\e[1;32m\]'
BLUE='\[\e[1;34m\]'
CYAN='\[\e[1;36m\]'
WHITE='\[\e[1;37m\]'
RESET='\[\e[0m\]'

parse_git_branch() {
    git branch 2>/dev/null | grep '^*' | colrm 1 2
}

export PS1="${GREEN}\w${BLUE}\$(parse_git_branch)${CYAN} # ${RESET}"

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh --color=auto --group-directories-first'
alias la='ls -Ah --color=auto --group-directories-first'
alias l='ls -CF'
alias vps='ssh root@ssh.ftoolz.org'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
alias du='du -h'
alias ..='cd ..'
alias ...='cd ../..'
alias cls='clear'

HISTCONTROL=ignoredups:erasedups
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r"
