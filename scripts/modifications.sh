#!/bin/bash
# Add Pop!_OS Shell
dnf install gnome-shell-extension-pop-shell xprop

# Change boot logo
plymouth-set-default-theme -R igrt

# Reload fonts
fc-cache -vf
