[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] & xmodmap ~/.Xmodmap

compton &
dunst &
dropbox &

while true; do
  sh .xsetroot.sh
  sleep .5s
done &

urxvt &

feh --bg-fill ~/assets/wal/lash.png

exec dwm
