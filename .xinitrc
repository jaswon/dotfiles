export BAR_FIFO=/tmp/bar.fifo

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] & xmodmap ~/.Xmodmap

compton &
dunst &
dropbox &

feh --bg-fill ~/assets/wal/lash.png

exec bspwm
