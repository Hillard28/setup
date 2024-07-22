#!/bin/bash
# Install applications
sudo dnf install gparted -y
sudo flatpak install flathub org.onlyoffice.desktopeditors -y
flatpak run org.onlyoffice.desktopeditors --system-title-bar
kill $(pgrep DesktopEditors)

# Install dconf editor
sudo flatpak install flathub ca.desrt.dconf-editor

# Install Gnome Tweaks
sudo dnf install gnome-tweaks -y

# Install utilities
sudo dnf install openssl
