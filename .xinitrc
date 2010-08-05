#!/bin/sh

# Xmodmap
xmodmap ~/.Xmodmap &

# Window manager name
wmname LG3D &

# Terminal
urxvtd -q -o -f &

# Clipboard manager
parcellite &

exec awesome
