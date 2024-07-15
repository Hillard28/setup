#!/bin/bash
# Install applications
dnf install gparted -y
flatpak install flathub org.onlyoffice.desktopeditors -y
flatpak run org.onlyoffice.desktopeditors --system-title-bar
kill $(pgrep DesktopEditors)

# Install dconf editor
flatpak install flathub ca.desrt.dconf-editor

# Install Gnome Tweaks
dnf install gnome-tweaks -y

# Install utilities
dnf install openssl
