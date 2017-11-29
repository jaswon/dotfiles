[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/.Xmodmap ]] & xmodmap ~/.Xmodmap

dunst &

while true; do
  sh .xsetroot.sh
  sleep .5s
done &

(sleep .5s && urxvt) &

exec dwm
