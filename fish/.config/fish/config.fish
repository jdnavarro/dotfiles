if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

set -x PATH ~/.emacs.d/bin ~/.local/bin ~/.cargo/bin (yarn global bin) $PATH
set -x BROWSER "firefox"
set -x EDITOR "nvim"
set -x PAGER "bat"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

abbr -a -- hm history merge

abbr -a -- cf nvim ~/.config/fish/config.fish
abbr -a -- ck nvim ~/.config/kitty/kitty.conf
abbr -a -- ci nvim ~/.config/i3/config