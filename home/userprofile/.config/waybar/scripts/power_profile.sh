#!/bin/bash

CURRENT=$(powerprofilesctl get)
case $CURRENT in
	*"power-saver")
		CURRENT="Power Saver";;
	*"balanced")
		CURRENT="Balanced";;
	*"performance")
		CURRENT="Performance";;
esac
SELECTION="$(printf " Power Saver\n Balanced\n Performance" | fuzzel --dmenu -l 3 --placeholder "$CURRENT" -a "top-right" -r 2 -f "Adwaita Mono:size=8" -w 14)"

case $SELECTION in
	*"Power Saver")
		powerprofilesctl set power-saver;;
	*"Balanced")
		powerprofilesctl set balanced;;
	*"Performance")
		powerprofilesctl set performance;;
esac

