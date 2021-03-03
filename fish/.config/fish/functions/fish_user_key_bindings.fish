function fish_user_key_bindings
    bind -M insert \ek 'commandline -i " | rg "'
    bind -M insert \ej 'commandline -i " | less "'
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase
end
