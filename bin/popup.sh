#!/bin/bash
#
# pop - Popup for the lemonbar with relevant extended info
#

background="#101010"
foreground="#b3b8c4"
highlight="#2C3C1C"

YPOS="20"
HEIGHT="7"
FONT='marathonmod'
white0="#8cbaa8"
bar_bg="#101010"
bar_fg="#2C3C1C"
notify="#2C3C1C"
XPOS="890"
WIDTH="138"
LINES="9"

# VOLUME
#vol=$(amixer get Master | egrep -o "[0-9]+%" | head -1 | egrep -o "[0-9]*")

# CALENDAR + DATE
time=$(TZ="America/New_York" date | awk -F " " '{print $4}')
calendar=$(cal -m1)

(echo " "; echo " "; echo "$calendar"; sleep 5) | dzen2 -fg $foreground -bg $background -ta c -sa c -fn $FONT -x $XPOS -y $YPOS -w $WIDTH -l $LINES -e 'onstart=uncollapse,hide;button1=exit;button3=exit'




