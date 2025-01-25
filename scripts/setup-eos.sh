yay -Syyu

sudo mv home/userprofile/Pictures/Background ~/Pictures
sudo mv home/userprofile/Pictures/Documents ~/Pictures
sudo mv home/userprofile/Pictures/Profile ~/Pictures
sudo mv home/userprofile/.local/share/icons ~/.local/share

yay -S zram-generator
sudo sh -c "echo '[zram0]' > /etc/systemd/zram-generator.conf"
sudo sh -c "echo 'zram-size = ram * 2' >> /etc/systemd/zram-generator.conf"
sudo sh -c "echo 'compression-algorithm = zstd' >> /etc/systemd/zram-generator.conf"

yay -S base-devel clang llvm cmake openssl zlib xz tk
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -fsSL https://install.julialang.org | sh
. ~/.bashrc
. ~/.bash_profile
. ~/.profile

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

pyenv install 3.13
pyenv install 3.12

yay -S texlive-latexrecommended texlive-latexextra texlive-fontsrecommended texlive-fontsextra texlive-fontutils texlive-formatsextra texlive-xetex texlive-binextra texlive-pictures texlive-mathscience texlive-bibtexextra perl-yaml-tiny perl-file-homedir

yay -S github-cli
git config --global user.email "ryangilland@gmail.com"
git config --global user.name "Ryan Gilland"
gh auth login

yay -S visual-studio-code-bin

yay -S gvfs gvfs-afc gvfs-dnssd gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd

yay -S dropbox
yay -S nautilus-dropbox
yay -S slack-desktop
yay -S libreoffice-fresh

yay -S inter-font

yay -S extension-manager gnome-tweaks dconf-editor

#gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
sudo -u gdm dbus-launch gsettings set org.gnome.login-screen logo '/usr/share/pixmaps/endeavouros-logo-text-dark.svg'
#sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme Adwaita

yay -S niri
yay -S libastal-meta aylurs-gtk-shell-git
yay -S swww

sudo sh -c "echo '--enable-features=WaylandWindowDecorations' > ~/.config/electron-flags.conf"
sudo sh -c "echo '--ozone-platform-hint=auto' >> ~/.config/electron-flags.conf"

