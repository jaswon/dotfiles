#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xset b off # prevents beep
xset s off -dpms # prevent screen blanking

. ~/.xinput

# set dpi
xrandr --dpi 83

# bar
bar | xargs -d$'\n' -I{} xsetroot -name "{}" &

xsetroot -solid '#eee'

# open term by default
exec st &

exec dwm
