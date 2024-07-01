#!/bin/bash
# Add minimize and maximize options
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

# Reload fonts
fc-cache -vf
