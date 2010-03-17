# -*- shell-script -*-
# 
# anrxc's init file for Z-SHELL 4.3.10 on Arch GNU/Linux.
# modified by Danny Navarro

# {{{ User settings

# {{{ Environment
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
export LESSHISTFILE="-"
export PAGER="vimpager"
export READNULLCMD="${PAGER}"
export EDITOR="vim"
export BROWSER="firefox"
export XTERM="urxvtc"
# }}}

# {{{ Manual pages
#     - colorize, since man-db fails to do so
export LESS_TERMCAP_mb=$'\E[01;31m'   # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'   # begin bold
export LESS_TERMCAP_me=$'\E[0m'       # end mode
export LESS_TERMCAP_se=$'\E[0m'       # end standout-mode
export LESS_TERMCAP_so=$'\E[1;33;40m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'       # end underline
export LESS_TERMCAP_us=$'\E[1;32m'    # begin underline
# }}}

# {{{ Aliases
alias -g rc.lua=".config/awesome/rc.lua"
alias -g awlib="/usr/share/awesome/lib/"
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -F --color=always"
alias ll="ls -l"
alias lfi="ls -l | egrep -v '^d'"
alias ldi="ls -l | egrep '^d'"
alias lst="ls -htl | grep `date +%Y-%m-%d`"
alias grep="grep --color=always"
alias cp="cp -ia"
alias mv="mv -i"
alias rm="rm -i"
alias cls="clear"
alias upmem="ps aux | sort -k 6"
alias top="htop"
alias psg="ps auxw | grep -i "
alias psptree="ps auxwwwf"
alias df="df -hT"
alias du="du -hc"
alias dus="du -S | sort -n"
alias free="free -m"
alias su="su - "
alias eject="eject -v "
alias retract="eject -t -v "
alias ping="ping -c 5"
alias sat="date +%R"
alias calc="bc -l <<<"
alias iodrag="ionice -c3 nice -n19"
alias spell="aspell -a <<< "
alias passgen="< /dev/urandom tr -cd \[:graph:\] | fold -w 32 | head -n 5"
# }}}

# {{{ Completion
compctl -k "(add delete draft edit list import preview publish update)" nb
# }}}

# {{{ Virtualenv wrapper
export WORKON_HOME=$HOME/sandbox/virtualenvs
source /usr/bin/virtualenvwrapper_bashrc
# }}}
# }}}

# {{{ ZSH settings
setopt nohup
setopt autocd
setopt cdablevars
setopt nobgnice
setopt noclobber
setopt shwordsplit
setopt interactivecomments
setopt autopushd pushdminus pushdsilent pushdtohome
setopt histreduceblanks histignorespace inc_append_history
setopt nobeep

# keybindings
bindkey -e # emacs
bindkey "\e[A" up-line-or-search
bindkey "\e[B" down-line-or-search
zle -N backward-kill-partial-word
bindkey '^x/' backward-kill-partial-word

# Prompt requirements
setopt extended_glob prompt_subst
autoload colors zsh/terminfo

# New style completion system
autoload -U compinit; compinit
#  * List of completers to use
zstyle ":completion:*" completer _complete _match _approximate
#  * Allow approximate
zstyle ":completion:*:match:*" original only
zstyle ":completion:*:approximate:*" max-errors 1 numeric
#  * Selection prompt as menu
zstyle ":completion:*" menu select=1
#  * Menu selection for PID completion
zstyle ":completion:*:*:kill:*" menu yes select
zstyle ":completion:*:kill:*" force-list always
zstyle ":completion:*:processes" command "ps -au$USER"
zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;32"
#  * Don't select parent dir on cd
zstyle ":completion:*:cd:*" ignore-parents parent pwd
#  * Complete with colors
zstyle ":completion:*" list-colors ""

# }}}

# {{{ Functions

function cl () { cd $1 && ls }
function backward-kill-partial-word {
        local WORDCHARS="${WORDCHARS//[\/.]/}"
	zle backward-kill-word "$@"
}

# {{{ Terminal and prompt


function precmd {
    # Terminal width = width - 1 (for lineup)
    local TERMWIDTH
    ((TERMWIDTH=${COLUMNS} - 1))

    # Truncate long paths
    PR_FILLBAR=""
    PR_PWDLEN=""
    local PROMPTSIZE="${#${(%):---(%n@%m:%l)---()--}}"
    local PWDSIZE="${#${(%):-%~}}"
    if [[ "${PROMPTSIZE} + ${PWDSIZE}" -gt ${TERMWIDTH} ]]; then
	((PR_PWDLEN=${TERMWIDTH} - ${PROMPTSIZE}))
    else
        PR_FILLBAR="\${(l.((${TERMWIDTH} - (${PROMPTSIZE} + ${PWDSIZE})))..${PR_HBAR}.)}"
    fi
}

function preexec () {
    # Screen window titles as currently running programs
    if [[ "${TERM}" == "screen-256color" ]]; then
        local CMD="${1[(wr)^(*=*|sudo|-*)]}"
        echo -n "\ek$CMD\e\\"
    fi
}

function setprompt () {
    if [[ "${terminfo[colors]}" -ge 8 ]]; then
        colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
	eval PR_"${color}"="%{${terminfo[bold]}$fg[${(L)color}]%}"
	eval PR_LIGHT_"${color}"="%{$fg[${(L)color}]%}"
    done
    PR_NO_COLOUR="%{${terminfo[sgr0]}%}"

    # Try to use extended characters to look nicer
    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    PR_SET_CHARSET="%{${terminfo[enacs]}%}"
    PR_SHIFT_IN="%{${terminfo[smacs]}%}"
    PR_SHIFT_OUT="%{${terminfo[rmacs]}%}"
    PR_HBAR="${altchar[q]:--}"
    PR_ULCORNER="${altchar[l]:--}"
    PR_LLCORNER="${altchar[m]:--}"
    PR_LRCORNER="${altchar[j]:--}"
    PR_URCORNER="${altchar[k]:--}"

    # Terminal prompt settings
    case "${TERM}" in
        dumb) # Simple prompt for dumb terminals
            unsetopt zle
            PROMPT='%n@%m:%~%% '
            ;;
        linux) # Simple prompt with Zenburn colors for the console
            echo -en "\e]P01e2320" # zenburn black (normal black)
            echo -en "\e]P8709080" # bright-black  (darkgrey)
            echo -en "\e]P1705050" # red           (darkred)
            echo -en "\e]P9dca3a3" # bright-red    (red)
            echo -en "\e]P260b48a" # green         (darkgreen)
            echo -en "\e]PAc3bf9f" # bright-green  (green)
            echo -en "\e]P3dfaf8f" # yellow        (brown)
            echo -en "\e]PBf0dfaf" # bright-yellow (yellow)
            echo -en "\e]P4506070" # blue          (darkblue)
            echo -en "\e]PC94bff3" # bright-blue   (blue)
            echo -en "\e]P5dc8cc3" # purple        (darkmagenta)
            echo -en "\e]PDec93d3" # bright-purple (magenta)
            echo -en "\e]P68cd0d3" # cyan          (darkcyan)
            echo -en "\e]PE93e0e3" # bright-cyan   (cyan)
            echo -en "\e]P7dcdccc" # white         (lightgrey)
            echo -en "\e]PFffffff" # bright-white  (white)
            PROMPT='$PR_GREEN%n@%m$PR_WHITE:$PR_YELLOW%l$PR_WHITE:$PR_RED%~$PR_YELLOW%%$PR_NO_COLOUR '
            ;;
        *)  # Main prompt
            PROMPT='$PR_SET_CHARSET$PR_GREEN$PR_SHIFT_IN$PR_ULCORNER$PR_GREEN$PR_HBAR\
$PR_SHIFT_OUT($PR_GREEN%(!.%SROOT%s.%n)$PR_GREEN@%m$PR_WHITE:$PR_YELLOW%l$PR_GREEN)\
$PR_SHIFT_IN$PR_HBAR$PR_GREEN$PR_HBAR${(e)PR_FILLBAR}$PR_GREEN$PR_HBAR$PR_SHIFT_OUT(\
$PR_RED%$PR_PWDLEN<...<%~%<<$PR_GREEN)$PR_SHIFT_IN$PR_HBAR$PR_GREEN$PR_URCORNER$PR_SHIFT_OUT\

$PR_GREEN$PR_SHIFT_IN$PR_LLCORNER$PR_GREEN$PR_HBAR$PR_SHIFT_OUT(\
%(?..$PR_RED%?$PR_WHITE:)%(!.$PR_RED.$PR_YELLOW)%#$PR_GREEN)$PR_NO_COLOUR '

            RPROMPT=' $PR_GREEN$PR_SHIFT_IN$PR_HBAR$PR_GREEN$PR_LRCORNER$PR_SHIFT_OUT$PR_NO_COLOUR'
            ;;
    esac
}

# Prompt init
setprompt
# }}}
# }}}
