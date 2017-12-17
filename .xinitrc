export BAR_FIFO=/tmp/bar.fifo
export PATH=$PATH:~/bin

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

compton --backend xrender &
dunst &
dropbox &

feh --bg-fill ~/assets/wal/lash.png

exec bspwm
