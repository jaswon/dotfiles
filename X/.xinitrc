#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xinput set-prop 14 286 1 # tap to click

xset b off # prevents beep
xset s off -dpms # prevent screen blanking

exec compton &

# bar
env LANG=en_US.UTF-8 ~/bin/bar &

# open term by default
exec termite &

exec dwm
