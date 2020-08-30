function ec --wraps emacsclient --description 'alias e=emacsclient -cn'
    emacsclient -nc $argv
end
