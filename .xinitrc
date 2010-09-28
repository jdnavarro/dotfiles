#!/bin/sh

# Xmodmap
xmodmap ~/.Xmodmap &

# Cairo composition
cairo-compmgr &

# Window manager name
wmname LG3D &

# Terminal
#urxvtd -q -o -f &

# Clipboard manager
parcellite &

exec dbus-launch awesome
