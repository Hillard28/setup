yay -Syyu

sudo mv home/userprofile/Pictures/Background ~/Pictures
sudo mv home/userprofile/Pictures/Documents ~/Pictures
sudo mv home/userprofile/Pictures/Profile ~/Pictures

yay -S zram-generator

yay -S base-devel clang llvm cmake openssl zlib xz tk
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -fsSL https://install.julialang.org | sh
yay -S texlive-latexrecommended texlive-latexextra texlive-fontsrecommended texlive-fontsextra texlive-fontutils texlive-formatsextra texlive-xetex texlive-binextra texlive-pictures texlive-mathscience perl-yaml-tiny perl-file-homedir
. ~/.bashrc
. ~/.bash_profile

yay -S github-cli
git config --global user.email "ryangilland@gmail.com"
git config --global user.name "Ryan Gilland"
gh auth login

yay -S visual-studio-code-bin

yay -S dropbox
yay -S nautilus-dropbox
yay -S slack-desktop
yay -S libreoffice-fresh

yay -S inter-font

yay -S extension-manager gnome-tweaks dconf-editor

gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"
sudo -u gdm dbus-launch gsettings set org.gnome.login-screen logo '/usr/share/pixmaps/endeavouros-logo-text-dark.svg'
