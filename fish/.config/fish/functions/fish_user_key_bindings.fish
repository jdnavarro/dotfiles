function fish_user_key_bindings
    bind -M insert \eg 'commandline -i " | rg "'
#    bind -M insert -k nul 'if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end'
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase
end
