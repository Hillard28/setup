#!/bin/bash

SELECTION="$(printf "Logout\nSuspend\nReboot\nShutdown" | fuzzel --dmenu -l 4)"

case $SELECTION in
	*"Logout")
		niri msg action quit --skip-confirmation;;
	*"Suspend")
		systemctl suspend;;
	*"Reboot")
		systemctl reboot;;
	*"Shutdown")
		systemctl poweroff;;
esac

