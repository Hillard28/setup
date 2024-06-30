# Remove unwanted packages
dnf remove unoconv @libreoffice rhythmbox -y

# Install partition manager
dnf install gparted -y

# Install programming languages
dnf install gcc clang llvm -y
rpm --import "https://miktex.org/download/key"
curl -L -o /etc/yum.repos.d/miktex.repo https://miktex.org/download/fedora/40/miktex.repo
dnf update -y
dnf install miktex -y

curl -fsSL https://install.julialang.org | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install RPM dev tools
dnf install rpm-build rpmdevtools createrepo_c -y

# Install tweaks
dnf install dconf-editor gnome-tweaks -y

# Install packages
dnf install inkscape -y

# Configure additional repositories
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Create modified gnome-control-center
rpmdev-setuptree

cd ~/rpmbuild/
git clone https://src.fedoraproject.org/rpms/gnome-control-center.git
cd gnome-control-center
git checkout f40
cd ..
mv ~/rpmbuild/gnome-control-center/gnome-control-center.spec ~/rpmbuild/SPECS/gnome-control-center.spec
rm -R gnome-control-center

cd ~/rpmbuild/SOURCES/
curl -LO https://download.gnome.org/sources/gnome-control-center/46/gnome-control-center-46.2.tar.xz

cd ~/

xdg-open rpmbuild/SPECS/gnome-control-center.spec

# AT THIS POINT, YOU NEED TO EDIT THE SPEC FILE TO REMOVE LOGO REFERENCES

dnf builddep rpmbuild/SPECS/gnome-control-center.spec
rpmbuild -ba rpmbuild/SPECS/gnome-control-center.spec

mkdir -p Projects/irepo/packages

mv ~/rpmbuild/RPMS/x86_64/gnome-control-center-46.2-1.fc40.x86_64.rpm ~/Projects/irepo/packages/gnome-control-center-46.2-1.fc40.x86_64.rpm

createrepo Projects/irepo

# Install modified gnome-control-center (need to add /etc/yum.repos.d/irepo.repo first)
rpm -i --reinstall Projects/irepo/packages/gnome-control-center-46.2-1.fc40.x86_64.rpm

# Add minimize and maximize options
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

# Edit os-release settings
xdg-open /usr/lib/os-release

# AT THIS POINT CAN EDIT LOGO PATH IN OS-RELEASE

# Create live-cd
cd ~/Projects/Infinity/kickstarts/
livecd-creator --verbose --config=fedora-live-infinity.ks --fslabel=Fedora-40-Infinity-0.1.0 --cache=cache --tmpdir=tmp

# Install github and login
dnf install 'dnf-command(config-manager)' -y
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
dnf install gh --repo gh-cli -y

git config --global user.name "Hillard28"
git config --global user.email "ryangilland@gmail.com"
gh auth login

# Reload fonts
fc-cache -vf
