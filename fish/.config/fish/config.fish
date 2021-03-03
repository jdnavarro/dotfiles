set fish_greeting

if status --is-interactive
    starship init fish | source
    thefuck --alias | source

    abbr -ag -- u systemctl --user
    abbr -ag -- hm history merge

    abbr -ag -- ef $EDITOR ~/.config/fish/config.fish
    abbr -ag -- ek $EDITOR ~/.config/kitty/kitty.conf
    abbr -ag -- e3 $EDITOR ~/.config/sway/config
end
