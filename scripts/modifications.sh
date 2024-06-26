# Create modified gnome-control-center
dnf install rpm-build
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
dnf builddep rpmbuild/SPECS/gnome-control-center.spec
rpmbuild -ba rpmbuild/SPECS/gnome-control-center.spec

mkdir Projects
cd Projects
mkdir irepo
cd irepo
mkdir packages
cd ~/

mv ~/rpmbuild/RPMS/x86_64/gnome-control-center-46.2-1.fc40.x86_64.rpm ~/Projects/irepo/packages/gnome-control-center-46.2-1.fc40.x86_64.rpm

# Install modified gnome-control-center (need to add /etc/yum.repos.d/irepo.repo first)
sudo rpm -i --reinstall Projects/irepo/packages/gnome-control-center-46.2-1.fc40.x86_64.rpm

cd ~/Projects/Infinity/kickstarts/
sudo livecd-creator --verbose --config=fedora-live-infinity.ks --fslabel=Fedora-40-Infinity-0.1.0 --cache=cache --tmpdir=tmp
