#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xinput set-prop 14 286 1 # tap to click

xset b off # prevents beep
xset s off -dpms # prevent screen blanking

hsetroot -solid "#627b80"
exec compton &

# bar
bar &

# open term by default
exec termite &

exec dwm
