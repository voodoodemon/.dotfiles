#
# ~/.bashrc
#

# env vars
export EDITOR="vim"
export VISUAL="vim"
export TERM=gnome-256color
export HISTSIZE=10000
export HISTFILESIZE=20000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source common shell functionality
source ~/.cmnrc

# user prompt '[user@host cwd] $ '
PS1='[\u@\h \W]\$ '
