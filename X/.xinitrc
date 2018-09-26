#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xinput set-prop 14 'libinput Tapping Enabled' 1 # tap to click
xinput set-prop 14 'libinput Accel Speed' 0.1 # mouse accel

xset b off # prevents beep
xset s off -dpms # prevent screen blanking

compton -b

# bar
bar &

# open term by default
exec urxvt &

exec dwm
