if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

set -x PATH ~/.local/bin ~/.emacs.d/bin ~/.cargo/bin (yarn global bin) ~/.cabal/bin ~/.ghcup/bin (ruby -e 'puts Gem.user_dir')/bin $PATH
set -x BROWSER "firefox"
set -x EDITOR "emacsclient -t"
set -x PAGER "bat"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x TSSERVER_LOG_FILE "/tmp/tsserver.log"

abbr -a -- hm history merge

abbr -a -- ef $EDITOR ~/.config/fish/config.fish
abbr -a -- ek $EDITOR ~/.config/kitty/kitty.conf
abbr -a -- e3 $EDITOR ~/.config/i3/config
