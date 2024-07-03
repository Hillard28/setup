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
cd ~/rpmbuild/SPECS/

perl -p0i -e 's/%if\s0%{\?fedora}(\r\n|\r|\n)\s+-Ddistributor_logo=%{_datadir}\/pixmaps\/fedora_logo_med\.png\s+\\(\r\n|\r|\n)\s+-Ddark_mode_distributor_logo=%{_datadir}\/pixmaps\/fedora_whitelogo_med\.png\s+\\(\r\n|\r|\n)%endif(\r\n|\r|\n)//g' gnome-control-center.spec
perl -p0i -e 's/%if\s0%{\?rhel}(\r\n|\r|\n)\s+-Ddistributor_logo=%{_datadir}\/pixmaps\/fedora-logo\.png\s+\\(\r\n|\r|\n)\s+-Ddark_mode_distributor_logo=%{_datadir}\/pixmaps\/system-logo-white\.png\s+\\(\r\n|\r|\n)%endif(\r\n|\r|\n)//g' gnome-control-center.spec

cd ~/rpmbuild/SOURCES/
curl -LO https://download.gnome.org/sources/gnome-control-center/46/gnome-control-center-46.2.tar.xz

cd ~/

dnf builddep rpmbuild/SPECS/gnome-control-center.spec
rpmbuild -ba rpmbuild/SPECS/gnome-control-center.spec

mkdir -p Projects/irepo/packages

mv ~/rpmbuild/RPMS/x86_64/gnome-control-center-46.2-1.fc40.x86_64.rpm ~/Projects/irepo/packages/gnome-control-center-46.2-1.fc40.x86_64.rpm

createrepo Projects/irepo

# Install modified gnome-control-center (need to add /etc/yum.repos.d/irepo.repo first)
rpm -i --reinstall Projects/irepo/packages/gnome-control-center-46.2-1.fc40.x86_64.rpm

# Add minimize and maximize options
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,maximize,close"

# Edit os-release settings
sed -i 's/LOGO=fedora-logo-icon/LOGO=infinity-logo-256/g' /usr/lib/os-release

