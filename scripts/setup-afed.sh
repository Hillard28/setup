#!/bin/bash

# Get script directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Copy background, profile, and icon folders
sudo mv $SCRIPT_DIR/../home/userprofile/Pictures/Background ~/Pictures
sudo mv $SCRIPT_DIR/../home/userprofile/Pictures/Documents ~/Pictures
sudo mv $SCRIPT_DIR/../home/userprofile/Pictures/Profile ~/Pictures
sudo mv $SCRIPT_DIR/../home/userprofile/.local/share/icons ~/.local/share
gtk-update-icon-cache --force ~/.local/share/icons/Infinity
gtk-update-icon-cache --force ~/.local/share/icons/Infinity-Inverse
gtk-update-icon-cache --force ~/.local/share/icons/Reversal

# Upgrade existing packages
sudo dnf upgrade -y

# Configure additional repositories
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf group install core -y

# Install multimedia
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf upgrade @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf install @sound-and-video -y

# Install drivers using rpmfusion
sudo dnf install intel-media-driver -y

# Install development tools
sudo dnf install gcc clang llvm cmake -y

# Install languages
curl -fsSL https://install.julialang.org | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

. ~/.bashrc
. ~/.bash_profile

# Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf check-update
sudo dnf install code -y # or code-insider

# Install github and login
sudo dnf install 'dnf-command(config-manager)' -y
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli -y

git config --global user.name "Hillard28"
git config --global user.email "ryangilland@gmail.com"
gh auth login

# Install dconf editor
sudo flatpak install flathub ca.desrt.dconf-editor -y

# Install Gnome Tweaks
sudo dnf install gnome-tweaks -y

# Install Extension Manager
sudo flatpak install flathub com.mattjakeman.ExtensionManager -y

# Install gparted
sudo dnf install gparted -y
