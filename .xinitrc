#!/bin/sh

export BAR_FIFO=/tmp/bar.fifo
export PATH=$PATH:~/bin

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xset s off -dpms # prevent screen blanking

compton --config ~/.config/compton.conf -b 
dunst &
dropbox &

feh --bg-fill ~/dotfiles/assets/wal/lash.png

exec bspwm
