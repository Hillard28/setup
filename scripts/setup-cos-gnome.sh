# Get script directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Setup home folders
mkdir ~/.venv
mkdir ~/.tmp

# Copy background, profile, and icon folders
cp -r $SCRIPT_DIR/../home/userprofile/Pictures/Backgrounds ~/Pictures
cp -r $SCRIPT_DIR/../home/userprofile/Pictures/Profiles ~/Pictures
cp -r $SCRIPT_DIR/../home/userprofile/.local/share/icons ~/.local/share
gtk-update-icon-cache --force ~/.local/share/icons/infinity

# Update installed packages
paru -Syu --noconfirm

# Install missing gnome packages
paru -S gnome --needed --noconfirm
paru -S papers --needed --noconfirm

# Install Adwaita and Nerd fonts
paru -S adwaita-fonts --needed --noconfirm
# paru -S ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono --needed --noconfirm
fc-cache -f

# Install GTK3 Adwaita theme
paru -S adw-gtk-theme --needed --noconfirm

# Install development libraries
paru -S base-devel clang llvm just cmake ninja meson python-tqdm openssl zlib xz tk --needed --noconfirm
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -fsSL https://install.julialang.org | sh

# Install Python packages and Pyenv
paru -S python-gpgme --needed --noconfirm
# curl -fsSL https://pyenv.run | bash
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
# echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
# echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
# echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
# echo 'eval "$(pyenv init - bash)"' >> ~/.bash_profile
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
# echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
# echo 'eval "$(pyenv init - bash)"' >> ~/.profile

# Install Stata requirements
# paru -S gtk2 ncurses5-compat-libs --needed --noconfirm

# Install TeX Live packages
paru -S texlive-latexrecommended texlive-latexextra texlive-fontsrecommended texlive-fontsextra texlive-fontutils texlive-formatsextra texlive-xetex texlive-binextra texlive-pictures texlive-mathscience texlive-bibtexextra perl-yaml-tiny perl-file-homedir --needed --noconfirm

# Install Gnome VFS packages
paru -S gvfs gvfs-afc gvfs-dnssd gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd --needed --noconfirm

# Install workspace packages
paru -S libappindicator --needed --noconfirm
paru -S dropbox nautilus-dropbox slack-desktop libreoffice-fresh --needed --noconfirm
# paru -S dropbox nautilus-dropbox slack-desktop onlyoffice-bin --needed --noconfirm

# Install configuration packages
paru -S extension-manager gnome-tweaks dconf-editor --needed --noconfirm

# Install media
paru -S spotify inkscape --needed --noconfirm

# Install IDE
paru -S visual-studio-code-bin --needed --noconfirm

# Install ocr libraries
paru -S leptonica tesseract-data-osd tesseract-data-eng tesseract --needed --noconfirm

# Install GitHub CLI
paru -S github-cli --needed --noconfirm
git config --global user.email "ryangilland@gmail.com"
git config --global user.name "Ryan Gilland"

# Configure GitHub CLI
gh auth login
