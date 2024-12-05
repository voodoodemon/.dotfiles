#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source common shell functionality
source ~/.cmnrc

# user prompt '[user@host cwd] $ '
PS1='[%n@%m %1~]$ '

# Enable incremental history search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
