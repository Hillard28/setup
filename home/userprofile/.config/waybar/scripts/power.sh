#!/bin/bash

SELECTION="$(printf "⏾ Suspend\n⭘ Logout\n⏼ Reboot\n⏻ Shutdown" | fuzzel --dmenu -l 4 --placeholder "Command" -a "top-right" -r 2 -f "Adwaita Mono:size=12" -w 12 -B 0)"
if [ "$SELECTION" ]
then
	CONFIRMATION="$(printf "No\nYes" | fuzzel --dmenu -l 2 --placeholder "Confirm" -a "center" -r 2 -f "Adwaita Mono:size=12" -w 12)"
	if [ "${CONFIRMATION,,}" = "yes" ]
	then
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
	fi
fi

