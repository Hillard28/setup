# Install linux-surface kernel
sudo chroot /mnt/sysimage
dnf config-manager --add-repo=https://pkg.surfacelinux.com/fedora/linux-surface.repo
dnf --disablerepo=updates install --allowerasing kernel-surface iptsd libwacom-surface -y
dnf install surface-secureboot -y
