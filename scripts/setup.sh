#!/bin/bash

# Move relevant files
sudo mv home/userprofile/Pictures/Background ~/Pictures
sudo mv home/userprofile/Pictures/Documents ~/Pictures
sudo mv home/userprofile/Pictures/Profile ~/Pictures
sudo mv usr/share/fonts/segoe-ui-fonts /usr/share/fonts/segoe-ui-fonts
sudo mv usr/share/icons/Infinity /usr/share/icons/Infinity
sudo mv usr/share/icons/infinity-logo.svg /usr/share/icons/infinity-logo.svg
sudo mv usr/share/icons/infinity-logo-dark.svg /usr/share/icons/infinity-logo-dark.svg
sudo mv usr/share/icons/infinity-logo-256.png /usr/share/icons/infinity-logo-256.png
sudo mv usr/share/icons/infinity-logo-256-dark.png /usr/share/icons/infinity-logo-256-dark.png
sudo mv usr/share/icons/infinity-logo-104-dark.png /usr/share/icons/infinity-logo-104-dark.png
sudo mv /usr/share/plymouth/themes/spinner/watermark.png /usr/share/plymouth/themes/spinner/watermark_bak.png
sudo mv usr/share/plymouth/themes/spinner/watermark.png /usr/share/plymouth/themes/spinner/watermark.png
sudo mv usr/share/plymouth/themes/angular_alt /usr/share/plymouth/themes
sudo mv usr/share/plymouth/themes/hexagon /usr/share/plymouth/themes
sudo mv usr/share/plymouth/themes/hexagon_2 /usr/share/plymouth/themes
sudo mv usr/share/plymouth/themes/hexagon_dots /usr/share/plymouth/themes
sudo mv usr/share/plymouth/themes/hexa_retro /usr/share/plymouth/themes
sudo mv usr/share/plymouth/themes/red_loader /usr/share/plymouth/themes
sudo mv usr/share/plymouth/themes/sphere /usr/share/plymouth/themes
sudo mv usr/share/plymouth/themes/spin /usr/share/plymouth/themes
sudo mv usr/share/plymouth/themes/spinner /usr/share/plymouth/themes
sudo mv usr/share/plymouth/themes/spinner_alt /usr/share/plymouth/themes
sudo mv usr/share/plymouth/themes/splash /usr/share/plymouth/themes
sudo mv etc/dconf/db/gdm.d/01-logo /etc/dconf/db/gdm.d/01-logo

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

# Install Perl packages for compiling LaTeX
sudo dnf install 'perl(File::Copy)' -y
sudo dnf install 'perl(Time::HiRes)' -y
sudo dnf install 'perl(Unicode::Normalize)' -y
sudo dnf install 'perl(sigtrap)' -y

# Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf check-update
sudo dnf install code -y # or code-insider

# Install github and login
sudo dnf install 'dnf-command(config-manager)' -y
sudo dnf-3 config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli -y

git config --global user.name "Hillard28"
git config --global user.email "ryangilland@gmail.com"
gh auth login

# Install Microsoft Edge
#sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc # Duplicate from VSCode install
sudo dnf-3 config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf install microsoft-edge-stable -y

# Install onlyoffice
sudo flatpak install flathub org.onlyoffice.desktopeditors -y
flatpak run org.onlyoffice.desktopeditors --system-title-bar
kill $(pgrep DesktopEditors)

# Install dconf editor
sudo flatpak install flathub ca.desrt.dconf-editor -y

# Install Gnome Tweaks
sudo dnf install gnome-tweaks -y

# Install Extension Manager
sudo flatpak install flathub com.mattjakeman.ExtensionManager -y

# Install gparted
sudo dnf install gparted -y

# Install openSSL
sudo dnf install openssl -y

# Change boot logo
sudo dnf install plymouth-plugin-script -y
sudo plymouth-set-default-theme -R hexagon_dots

# Reload fonts
sudo dnf install rsms-inter-fonts -y
sudo dnf install cascadia-code-fonts -y
sudo fc-cache -vf

# Add minimize and maximize options
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
gsettings set org.gnome.login-screen logo '/usr/share/icons/infinity-logo-104-dark.png'
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
sudo dconf update
