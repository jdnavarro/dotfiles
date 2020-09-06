function fish_user_key_bindings
    bind -M insert \eg 'commandline -i " | rg "'
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase
end
