#!/bin/bash
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
