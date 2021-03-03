#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

export $(systemctl --user show-environment | xargs)

export BROWSER="firefox"
export LESS="-Xr"
export EDITOR="emacs -nw"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export TSSERVER_LOG_FILE="/tmp/tsserver.log"
export _JAVA_AWT_WM_NONREPARENTING="1"
export XDG_CURRENT_DESKTOP="sway"

eval "$(starship init bash)"
