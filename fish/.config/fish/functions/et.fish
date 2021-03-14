function et --wraps emacsclient
    emacsclient -nw --alternate-editor "emacs -nw" $argv 2> /dev/null
end

