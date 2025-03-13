# Get script directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Update installed packages
yay -Syyu

# Install missing gnome packages
yay -S gnome --needed

# Copy background, profile, and icon folders
sudo mv $SCRIPT_DIR/../home/userprofile/Pictures/Background ~/Pictures
sudo mv $SCRIPT_DIR/../home/userprofile/Pictures/Documents ~/Pictures
sudo mv $SCRIPT_DIR/../home/userprofile/Pictures/Profile ~/Pictures
sudo mv $SCRIPT_DIR/../home/userprofile/.local/share/icons ~/.local/share

# Install Inter and Segoe UI font packages
sudo mv $SCRIPT_DIR/../home/userprofile/.local/share/fonts ~/.local/share
yay -S inter-font
# yay -S nerd-fonts
fc-cache -f

# Install and configure ZRAM package
yay -S zram-generator
sudo sh -c "echo '[zram0]' > /etc/systemd/zram-generator.conf"
sudo sh -c "echo 'zram-size = ram * 2' >> /etc/systemd/zram-generator.conf"
sudo sh -c "echo 'compression-algorithm = zstd' >> /etc/systemd/zram-generator.conf"

# Install development libraries
yay -S base-devel clang llvm cmake openssl zlib xz tk
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -fsSL https://install.julialang.org | sh
. ~/.bashrc
. ~/.bash_profile
. ~/.profile

# Install Pyenv
curl -fsSL https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init - bash)"' >> ~/.bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init - bash)"' >> ~/.profile

# After restarting terminal, run
# pyenv install 3.12
# pyenv install 3.13

# Install Stata requirements
yay -S gtk2 ncurses5-compat-libs

# Install TeX Live packages 
yay -S texlive-latexrecommended texlive-latexextra texlive-fontsrecommended texlive-fontsextra texlive-fontutils texlive-formatsextra texlive-xetex texlive-binextra texlive-pictures texlive-mathscience texlive-bibtexextra perl-yaml-tiny perl-file-homedir

# Install Gnome VFS packages
yay -S gvfs gvfs-afc gvfs-dnssd gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd

# Install workspace packages
yay -S python-gpgme
yay -S dropbox
yay -S slack-desktop
yay -S libreoffice-fresh
yay -S nautilus-dropbox

# Install configuration packages
yay -S extension-manager gnome-tweaks dconf-editor

# Install VSC
yay -S visual-studio-code-bin

# Install GitHub CLI
yay -S github-cli
git config --global user.email "ryangilland@gmail.com"
git config --global user.name "Ryan Gilland"
gh auth login

# gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
sudo -u gdm dbus-launch gsettings set org.gnome.login-screen logo '/usr/share/pixmaps/endeavouros-logo-text-dark.svg'
# sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme Adwaita

# Install niri, Hyprland, Astal, AGS, and SWWW packages
# yay -S niri fuzzel swww
# yay -S libastal-meta aylurs-gtk-shell-git
# yay -S hyprland ags-hyprpanel-git fuzzel swww
# sudo mv $SCRIPT_DIR/../home/userprofile/.config/hypr ~/.config
# sudo mv $SCRIPT_DIR/../home/userprofile/.config/hyprpanel ~/.config
# sudo mv $SCRIPT_DIR/../home/userprofile/.config/fuzzel ~/.config
sudo mv $SCRIPT_DIR/../home/userprofile/.config/paperwm ~/.config

# Add flags for Electron-native packages to use Wayland
# echo "--enable-features=WaylandWindowDecorations" > ~/.config/electron-flags.conf
# echo "--ozone-platform-hint=auto" >> ~/.config/electron-flags.conf
