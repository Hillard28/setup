#!/bin/bash

CONFIRMATION="$(printf "No\nYes" | fuzzel --dmenu -l 2 --placeholder "Logout" -a "center" -r 2 -f "Adwaita Mono:size=12" -w 12)"
if [ "${CONFIRMATION,,}" = "yes" ]
then
	niri msg action quit --skip-confirmation
fi

