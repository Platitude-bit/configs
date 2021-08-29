#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE= HISTFILESIZE= #infinite history

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export BROWSER="chromium"

# ~/Clean up:
export LESSHISTFILE="-"

#aliases
alias py="python"
alias cp="cp -iv"
alias diff="diff --color=auto"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias mv="mv -iv"
alias rm="rm -v"
alias vi="nvim"
alias zt="zathura"
alias tree="tree -C"

# PS1 prompt
PS1="\[$(tput bold)\]\[$(tput bold)\]\[$(tput bold)\]\u\[$(tput bold)\]@\[$(tput bold)\]\h:\[$(tput setaf 3)\]\w\[$(tput bold)\]\$ \[$(tput sgr0)\]"

env=~/.ssh/agent.env
agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }
agent_load_env
# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi
unset env
