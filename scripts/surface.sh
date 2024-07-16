# Install linux-surface kernel immediately after installing fedora
sudo chroot /mnt/sysimage
dnf config-manager --add-repo=https://pkg.surfacelinux.com/fedora/linux-surface.repo
dnf --disablerepo=updates install --allowerasing kernel-surface iptsd libwacom-surface -y

# At the moment only works with Grub
dnf install surface-secureboot -y

# After first boot in fedora
dnf config-manager --add-repo=https://pkg.surfacelinux.com/fedora/linux-surface.repo
