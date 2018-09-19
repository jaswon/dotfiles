#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xinput set-prop 14 286 1 # tap to click

xset b off # prevents beep
xset s off -dpms # prevent screen blanking

exec compton &

# bar
while :; do
	DATE=$(date '+(%^a) %b %_d, %Y %I:%M %p')
	BAT=$(cat /sys/class/power_supply/BAT0/capacity)
	xsetroot -name " [ $BAT ] [ $DATE ] "
	sleep 1m
done &

# open term by default
exec termite &

exec dwm
