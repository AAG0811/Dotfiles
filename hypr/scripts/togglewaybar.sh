#!/bin/bash

#check if waybar running
if pgrep -x "waybar" > /dev/null; then
  killall waybar
else 
  waybar &
fi

