function e --wraps emacs --description 'alias e=emacs'
    emacsclient --alternate-editor emacs $argv 2>/dev/null &
    disown
end
