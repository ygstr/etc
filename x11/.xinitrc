#!/bin/sh
 


nitrogen --restore &
xset +fp ~/.fonts
xsetroot -cursor_name left_ptr
mpd &
xrdb ~/.Xresources
sh $HOME/.config/bar/panel.sh
sxhkd &
wew | evwatch &
exec xwait


