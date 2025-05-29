#!/bin/bash

SELECTION="$(printf "⏾ Suspend\n⭘ Logout\n⏼ Reboot\n⏻ Shutdown" | fuzzel --dmenu -l 4 --placeholder "Command" -a "top-right" -r 2 -f "Adwaita Mono:size=12" -w 12)"

case $SELECTION in
	*"Suspend")
		systemctl suspend;;
	*"Logout")
		niri msg action quit --skip-confirmation;;
	*"Reboot")
		systemctl reboot;;
	*"Shutdown")
		systemctl poweroff;;
esac

