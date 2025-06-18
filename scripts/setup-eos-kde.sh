# Get script directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Copy background, profile, and icon folders
cp -r $SCRIPT_DIR/../home/userprofile/Pictures/Backgrounds ~/Pictures
cp -r $SCRIPT_DIR/../home/userprofile/Pictures/Profiles ~/Pictures

# Update installed packages
yay -Syyu --noconfirm

# Install Nerd and Segoe UI fonts
# sudo mv $SCRIPT_DIR/../home/userprofile/.local/share/fonts ~/.local/share
# yay -S nerd-fonts --noconfirm
yay -S ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono --noconfirm
fc-cache -f

# Install and configure ZRAM package
yay -S zram-generator --needed --noconfirm
sudo sh -c "echo '[zram0]' > /etc/systemd/zram-generator.conf"
sudo sh -c "echo 'zram-size = ram * 2' >> /etc/systemd/zram-generator.conf"
sudo sh -c "echo 'compression-algorithm = zstd' >> /etc/systemd/zram-generator.conf"
sudo sh -c "echo 'vm.swappiness = 60' > /etc/sysctl.d/99-vm-zram-parameters.conf"
sudo sh -c "echo 'vm.watermark_boost_factor = 0' >> /etc/sysctl.d/99-vm-zram-parameters.conf"
sudo sh -c "echo 'vm.watermark_scale_factor = 10' >> /etc/sysctl.d/99-vm-zram-parameters.conf"
sudo sh -c "echo 'vm.page-cluster = 0' >> /etc/sysctl.d/99-vm-zram-parameters.conf"

# Install development libraries
yay -S base-devel clang llvm cmake openssl zlib xz tk --needed --noconfirm
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

# Install workspace packages
yay -S python-gpgme --needed --noconfirm
yay -S libreoffice-fresh --needed --noconfirm
yay -S dropbox slack-desktop --needed --noconfirm

# Install media
yay -S spotify inkscape --needed --noconfirm

# Install VSC
yay -S visual-studio-code-bin --needed --noconfirm

# Install GitHub CLI
yay -S github-cli --needed --noconfirm
git config --global user.email "ryangilland@gmail.com"
git config --global user.name "Ryan Gilland"

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

# Configure GitHub CLI
gh auth login
