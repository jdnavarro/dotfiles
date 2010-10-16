#!/bin/sh

# Xmodmap
xmodmap ~/.Xmodmap &

# Cairo composition
cairo-compmgr &

# Window manager name
wmname LG3D &

# Terminal
urxvtd -q -o -f &

# Clipboard manager
parcellite &

# Load nvidia settings
nvidia-settings -l

# exec dbus-launch awesome
exec awesome
