#
!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources


xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/envypn
xset +fp rehash

# Normal cursor
xsetroot -cursor_name left_ptr &

## Clavier en français
setxkbmap fr &

#Ecran externe
xrandr --output VGA-0 --mode 1600x900 --output LVDS --off &
#sxhkd &
udiskie &
urxvtd -q -o -f &
syndaemon -t -k -i 2 -d &
#exec bspwm
# exec awesome
# exec startkde
exec openbox-session
# exec xfce4-session
# exec i3
# ...or the Window Manager of your choice
