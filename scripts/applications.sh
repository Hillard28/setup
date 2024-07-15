#!/bin/bash
# Install applications
dnf install gparted -y
flatpak install flathub org.onlyoffice.desktopeditors -y
flatpak run org.onlyoffice.desktopeditors --system-title-bar
kill $(pgrep DesktopEditors)
flatpak install flathub com.mattjakeman.ExtensionManager -y

# Install configuration software
dnf install dconf-editor gnome-tweaks -y

# Install utilities
dnf install openssl
