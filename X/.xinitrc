if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources
xmodmap .Xmodmap
xsetroot -cursor_name left_ptr
unclutter &
clipit &

session=${1:-i3}

case $session in
    bsp|bspwm         ) exec bspwm;;
    i3|i3wm           ) exec i3;;
    xmonad            ) exec xmonad;;
    kodi              ) exec kodi-standalone;;
    *) exec $1;;
esac
