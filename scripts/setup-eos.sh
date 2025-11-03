# Get script directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Copy background, profile, and icon folders
cp -r $SCRIPT_DIR/../home/userprofile/Pictures/Backgrounds ~/Pictures
cp -r $SCRIPT_DIR/../home/userprofile/Pictures/Profiles ~/Pictures
cp -r $SCRIPT_DIR/../home/userprofile/.local/share/icons ~/.local/share
gtk-update-icon-cache --force ~/.local/share/icons/infinity

# Update installed packages
yay -Syyu --noconfirm

# Install missing gnome packages
yay -S gnome --needed --noconfirm
yay -S papers --needed --noconfirm

# Install Nerd and Segoe UI fonts
# sudo mv $SCRIPT_DIR/../home/userprofile/.local/share/fonts ~/.local/share
# yay -S nerd-fonts --noconfirm
yay -S adwaita-fonts ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono --noconfirm
fc-cache -f

# Install GTK3 Adwaita theme
yay -S adw-gtk-theme --needed --noconfirm

# Install and configure ZRAM package
yay -S zram-generator --needed --noconfirm
sudo sh -c "echo '[zram0]' > /etc/systemd/zram-generator.conf"
sudo sh -c "echo 'zram-size = ram * 2' >> /etc/systemd/zram-generator.conf"
sudo sh -c "echo 'compression-algorithm = zstd' >> /etc/systemd/zram-generator.conf"
sudo sh -c "echo 'vm.swappiness = 100' > /etc/sysctl.d/99-vm-zram-parameters.conf"
# sudo sh -c "echo 'vm.watermark_boost_factor = 0' >> /etc/sysctl.d/99-vm-zram-parameters.conf"
# sudo sh -c "echo 'vm.watermark_scale_factor = 10' >> /etc/sysctl.d/99-vm-zram-parameters.conf"
sudo sh -c "echo 'vm.page-cluster = 0' >> /etc/sysctl.d/99-vm-zram-parameters.conf"

# Install development libraries
yay -S base-devel clang llvm cmake ninja meson python-tqdm openssl zlib xz tk --needed --noconfirm
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

# Install Stata requirements
# yay -S gtk2 ncurses5-compat-libs --needed --noconfirm

# Install TeX Live packages 
yay -S texlive-latexrecommended texlive-latexextra texlive-fontsrecommended texlive-fontsextra texlive-fontutils texlive-formatsextra texlive-xetex texlive-binextra texlive-pictures texlive-mathscience texlive-bibtexextra perl-yaml-tiny perl-file-homedir --needed --noconfirm

# Install Gnome VFS packages
yay -S gvfs gvfs-afc gvfs-dnssd gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd --needed --noconfirm

# Install workspace packages
yay -S libappindicator --needed --noconfirm
yay -S python-gpgme --needed --noconfirm
yay -S dropbox slack-desktop --needed --noconfirm
yay -S onlyoffice-bin --needed --noconfirm

# Install configuration packages
yay -S extension-manager gnome-tweaks dconf-editor --needed --noconfirm

# Install media
yay -S spotify inkscape --needed --noconfirm

# Install VSC
yay -S visual-studio-code-bin --needed --noconfirm

# Install GitHub CLI
yay -S github-cli --needed --noconfirm
git config --global user.email "ryangilland@gmail.com"
git config --global user.name "Ryan Gilland"

# gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:appmenu"
# sudo -u gdm dbus-launch gsettings set org.gnome.login-screen logo '/usr/share/pixmaps/endeavouros-logo-text-dark.svg'
# sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme Adwaita

# Install niri, Hyprland, Astal, AGS, SWWW, and utility packages
# yay -S uwsm --noconfirm
# yay -S brightnessctl --noconfirm
# yay -S niri fuzzel swww --noconfirm
# yay -S libastal-meta aylurs-gtk-shell-git --noconfirm
# yay -S hyprland hyprlock fuzzel swww grim slurp --noconfirm
# sudo mv $SCRIPT_DIR/../home/userprofile/.config/ags ~/.config
# sudo mv $SCRIPT_DIR/../home/userprofile/.config/themes ~/.config
# sudo mv $SCRIPT_DIR/../home/userprofile/.config/hypr ~/.config
# sudo mv $SCRIPT_DIR/../home/userprofile/.config/hyprpanel ~/.config
# sudo mv $SCRIPT_DIR/../home/userprofile/.config/fuzzel ~/.config
# sudo mv $SCRIPT_DIR/../home/userprofile/.config/paperwm ~/.config

# Configure GitHub CLI
gh auth login
