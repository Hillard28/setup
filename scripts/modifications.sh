# Remove unwanted packages
sudo dnf remove unoconv
sudo dnf remove @libreoffice
sudo dnf remove rhythmbox

# Install partition manager
sudo dnf install gparted

# Install programming languages
sudo dnf install gcc clang llvm
sudo rpm --import "https://miktex.org/download/key"
sudo curl -L -o /etc/yum.repos.d/miktex.repo https://miktex.org/download/fedora/40/miktex.repo
sudo dnf update
sudo dnf install miktex

curl -fsSL https://install.julialang.org | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install RPM dev tools
sudo dnf install rpm-build rpmdevtools createrepo_c

# Install tweaks
sudo dnf install dconf-editor gnome-tweaks

# Install packages
sudo dnf install inkscape

# Configure additional repositories
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Create modified gnome-control-center
rpmdev-setuptree

cd ~/rpmbuild/
git clone https://src.fedoraproject.org/rpms/gnome-control-center.git
cd gnome-control-center
git checkout f40
cd ..
mv ~/rpmbuild/gnome-control-center/gnome-control-center.spec ~/rpmbuild/SPECS/gnome-control-center.spec
sudo rm -R gnome-control-center

cd ~/rpmbuild/SOURCES/
curl -LO https://download.gnome.org/sources/gnome-control-center/46/gnome-control-center-46.2.tar.xz

cd ~/

sudo xdg-open rpmbuild/SPECS/gnome-control-center.spec

# AT THIS POINT, YOU NEED TO EDIT THE SPEC FILE TO REMOVE LOGO REFERENCES

sudo dnf builddep rpmbuild/SPECS/gnome-control-center.spec
rpmbuild -ba rpmbuild/SPECS/gnome-control-center.spec

mkdir -p Projects/irepo/packages

mv ~/rpmbuild/RPMS/x86_64/gnome-control-center-46.2-1.fc40.x86_64.rpm ~/Projects/irepo/packages/gnome-control-center-46.2-1.fc40.x86_64.rpm

sudo createrepo Projects/irepo

# Install modified gnome-control-center (need to add /etc/yum.repos.d/irepo.repo first)
sudo rpm -i --reinstall Projects/irepo/packages/gnome-control-center-46.2-1.fc40.x86_64.rpm

# Add minimize and maximize options
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

# Edit os-release settings
sudo xdg-open /usr/lib/os-release

# AT THIS POINT CAN EDIT LOGO PATH IN OS-RELEASE

# Create live-cd
cd ~/Projects/Infinity/kickstarts/
sudo livecd-creator --verbose --config=fedora-live-infinity.ks --fslabel=Fedora-40-Infinity-0.1.0 --cache=cache --tmpdir=tmp

# Install github and login
sudo dnf install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli

git config --global user.name "Hillard28"
git config --global user.email "ryangilland@gmail.com"
gh auth login

# Reload fonts
fc-cache -vf
