function fish_user_key_bindings
    bind -M insert \eg 'commandline -i " | rg"'
    bind -M insert jk 'if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end'
    bind -M insert \ce end-of-line
    bind -M insert \ca beginning-of-line
    bind -M insert \cf forward-char
end

fish_vi_key_bindings
