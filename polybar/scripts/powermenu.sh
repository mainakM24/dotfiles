#!/bin/bash

chosen=$(printf " Shutdown\n Reboot\n Logout" | rofi -dmenu -i -p "Power Menu" -theme "$HOME/.config/rofi/themes/powermenu.rasi")
#chosen=$(printf " Shutdown\n Reboot\n Logout" | rofi -dmenu -i -p "Power Menu" )

case "$chosen" in
  #"Suspend") systemctl suspend ;;
  " Reboot") systemctl reboot ;;
  " Shutdown") systemctl poweroff ;;
  " Logout") bspc quit ;; 
esac

