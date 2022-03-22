if status --is-login 
    bass source /etc/profile

    fish_add_path -P \
      ~/.deno/bin \
      ~/.emacs/doom/bin \
      ~/.cargo/bin \
      ~/.ghcup/bin \
      ~/.cabal/bin \
      ~/.node_modules/bin \
      ~/.local/bin

    set -x EDITOR "emacs -nw --no-desktop"
    set -x BROWSER "firefox"

    set -x SYSTEMD_COLORS "16"
    set -x LESS '-XR --use-color -Dd+r$Du+b'
    set -x MANPAGER 'less -R --use-color -Dd+r -Du+b'
    set -x FZF_DEFAULT_OPTS "--color=16"

    set -x npm_config_prefix "~/.node_modules"

    set -x FERAL_DIR "$HOME/feral"
    set -x FERAL_PREVIEW "dev"

    # TODO: Remove PATH when feral isolated flake (needs PATH for pnpm)
    systemctl --user import-environment FERAL_DIR PATH

end

if status --is-interactive
    set fish_greeting

    starship init fish | source
    zoxide init fish | source
    direnv hook fish | source

    # pnpm tabtab source for packages
    [ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

    fzf_configure_bindings --directory=\cf --git_status=\cg --git_log=\co

    abbr -ag -- s systemctl
    abbr -ag -- su systemctl --user
    abbr -ag -- sg systemd-cgls
    
    abbr -ag -- j journalctl
    abbr -ag -- ju journalctl --user-unit
    
    abbr -ag -- hm history merge

    abbr -ag -- ef $EDITOR ~/.config/fish/config.fish
    abbr -ag -- ek $EDITOR ~/.config/kitty/kitty.conf
    abbr -ag -- e3 $EDITOR ~/.config/i3/config
    abbr -ag -- es $EDITOR ~/.config/sway/config

    cd .
end