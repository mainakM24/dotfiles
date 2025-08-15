#!/bin/bash

CONNECTED=$(bluetoothctl info | grep -i name | awk '{for(i = 2; i <= NF; i++) printf $i" "; printf "\n"}')
ACTION=$(printf "Connect\nDisconnect\nDevices\nToggle Bluetooth" | rofi -dmenu -i -p "Bluetooth: $CONNECTED" -theme ~/.config/rofi/themes/bluetooth.rasi)

case "$ACTION" in 
	"Connect")
		DEVICES=$(bluetoothctl devices | grep "Device" | awk '{for (i=2; i<=NF; i++) printf $i" " ; printf "\n"}' | rofi -dmenu -p "Connect to" -theme ~/.config/rofi/themes/bluetooth.rasi)
		if [ -n "$DEVICES" ]; then
			DEVICE_MAC=$(echo "$DEVICES" | awk '{printf $1}')
			DEVICE_NAME=$(echo "$DEVICES" | awk '{for (i=2; i<=NF; i++) printf $i" " ; printf "\n"}') 
			notify-send "Attempting to connect to" "$DEVICE_NAME"
			bluetoothctl connect "$DEVICE_MAC" && notify-send "Connected" || notify-send "Failed to connect"
		fi
		;;

	"Disconnect")
		CONNECTED=$(bluetoothctl info | grep "Name:" | awk '{for (i=2; i<=NF; i++) printf $i" " ; printf "\n"}' | rofi -dmenu -p "Disconnect" -theme ~/.config/rofi/themes/bluetooth.rasi)
		if [ -n "$CONNECTED" ]; then
			DEVICE_MAC=$(bluetoothctl info | grep "Device" | awk '{print $2}')
			notify-send "Attempting to disconnect from" "$CONNECTED"
			bluetoothctl disconnect "$DEVICE_MAC" && notify-send "Disconnected" || notify-send "Failed to disconnect"
		fi
		;;

	"Devices")
		bluetoothctl devices | awk '{for (i=2; i<=NF; i++) printf $i" " ; printf "\n"}' | rofi -dmenu -p "Paired Devices" -theme ~/.config/rofi/themes/bluetooth.rasi
		;;

	"Toggle Bluetooth")
		STATE=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
		if [[ $STATE = yes ]]; then
			notify-send "Turning off bluetooth"
			sudo rfkill block bluetooth
			sleep 1
			bluetoothctl power off && notify-send "Turned off" || notify-send "Failed"
		elif [[ $STATE = no ]]; then
			notify-send "Turning on bluetooth"
			sudo rfkill unblock bluetooth
			sleep 1
			bluetoothctl power on && notify-send "Turned on" || notify-send "Failed"
		fi
		;;
esac
