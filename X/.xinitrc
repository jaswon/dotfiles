#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xinput set-prop 14 286 1 # tap to click

xset b off # prevents beep
xset s off -dpms # prevent screen blanking

exec compton &

# systray
exec pamac-tray &
exec volumeicon &
exec nm-applet &
exec slstatus &

# open term by default
exec termite &

exec dwm
