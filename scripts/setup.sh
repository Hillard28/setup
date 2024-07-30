#!/bin/bash

# Remove unwanted packages
sudo dnf remove unoconv libreoffice* rhythmbox -y

# Configure additional repositories
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager --enable fedora-cisco-openh264
sudo dnf groupupdate core -y

# Install multimedia
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf install @sound-and-video -y

# Install drivers using rpmfusion
sudo dnf install intel-media-driver

# Change boot logo
#TODO: move Plymouth files to correct location
sudo plymouth-set-default-theme -R igrt

# Reload fonts
#TODO: move font files to correct location
sudo fc-cache -vf

# Add minimize and maximize options
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
gsettings set org.gnome.login-screen logo '/usr/share/icons/infinity-logo-104-dark.png'
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
sudo dconf update

# Install development tools
sudo dnf install gcc clang llvm cmake -y

# Install languages
curl -fsSL https://install.julialang.org | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

. ~/.bashrc
. ~/.bash_profile

# Install RPM dev tools
sudo dnf install rpm-build rpmdevtools createrepo_c -y

# Install MikTeX
sudo rpm --import "https://miktex.org/download/key"
sudo curl -L -o /etc/yum.repos.d/miktex.repo https://miktex.org/download/fedora/40/miktex.repo
sudo dnf update -y
sudo dnf install miktex -y

# Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf check-update
sudo dnf install code # or code-insider

# Install github and login
sudo dnf install 'dnf-command(config-manager)' -y
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli -y

git config --global user.name "Hillard28"
git config --global user.email "ryangilland@gmail.com"
gh auth login

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
