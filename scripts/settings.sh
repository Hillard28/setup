#!/bin/bash
# Add minimize and maximize options
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
gsettings set org.gnome.login-screen logo '/usr/share/icons/infinity-logo-104-dark.png'
dconf update
