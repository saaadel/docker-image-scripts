#!/bin/bash
## Description: Create a new mode, add it, and set it as current. Configured for VNC by default.


if [[ -z "$output" ]]; then
    output=VNC-0
fi

modeline=`cvt $1 $2 $3 | grep Modeline | sed 's/Modeline\s*//'`
mode=`echo $modeline | awk '{print $1}'`

xrandr --newmode $modeline
xrandr --addmode "$output" $mode
xrandr --output "$output" --mode $mode
