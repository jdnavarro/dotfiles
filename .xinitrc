#!/bin/sh

# Xmodmap
xmodmap ~/.Xmodmap &

# Window manager name
# wmname compiz &

# Terminal
urxvtd -q -o -f &

exec awesome
