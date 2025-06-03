#!/bin/bash

CONFIRMATION="$(printf "No\nYes" | fuzzel --dmenu -l 2 --placeholder "Shutdown" -a "center" -r 2 -f "Adwaita Mono:size=12" -w 12)"
if [ "${CONFIRMATION,,}" = "yes" ]
then
	systemctl poweroff
fi

