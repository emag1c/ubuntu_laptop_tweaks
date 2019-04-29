#!/bin/sh
xhost +local:
display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"
user=$(who | grep '('$display')' | awk '{print $1}')
uid=$(id -u $user)
xauthority="/home/$user/.Xauthority"
# set the cmd to use with sudo
# su $user
echo $xauthority
echo $display
echo $user
echo $uid
export DISPLAY=$display
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus
export XAUTHORITY=$xauthority
xinput --disable 20
xinput --disable 29
xinput --disable 21
xinput --disable 22