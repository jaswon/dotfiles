#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xinput set-prop 14 285 1 # tap to click
xinput set-prop 14 305 0.1 # mouse accel

xset b off # prevents beep
xset s off -dpms # prevent screen blanking

hsetroot -solid "#627b80"
exec compton &

# bar
bar &

# open term by default
exec kitty &

exec dwm
