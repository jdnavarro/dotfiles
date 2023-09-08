if status --is-login
    bass source /etc/profile
    bass "export $(run-parts /usr/lib/systemd/user-environment-generators | xargs -0)"
end

if status --is-interactive
    set fish_greeting

    set -x LS_COLORS (vivid generate modus-operandi)

    starship init fish | source
    zoxide init fish | source
    direnv hook fish | source
    # Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

    source ~/.config/tabtab/fish/pnpm.fish

    fzf_configure_bindings \
        --directory=\cf \
        --git_status=\cg \
        --git_log=\co \
        --processes=\cp \
        --variables=\n # Ctrl-j

    abbr -a -- dae systemctl --user daemon-reload

    abbr -a -- hm history merge

    abbr -a -- fu fd . -Ltl -d1 -x unlink

    abbr -a -- ks kitty +kitten ssh
    abbr -a -- kc kitty +kitten icat

    abbr -a -- jf journalctl -f

    abbr -a -- ef $EDITOR ~/.config/fish/config.fish
    abbr -a -- ek $EDITOR ~/.config/kitty/kitty.conf
    abbr -a -- eh $EDITOR ~/.config/hypr/hyprland.conf
    abbr -a -- es $EDITOR ~/.config/sway/config

    cd .
end
