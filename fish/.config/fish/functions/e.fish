function e --wraps emacs --description 'alias e=emacs'
    emacs &>/dev/null $argv &
    disown
end
