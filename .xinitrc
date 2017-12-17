#!/bin/sh

export BAR_FIFO=/tmp/bar.fifo
export PATH=$PATH:~/bin

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xset s off -dpms

compton --config ~/.config/compton.conf -b 
dunst &
dropbox &

feh --bg-fill ~/assets/wal/lash.png

exec bspwm
