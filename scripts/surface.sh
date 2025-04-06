# Install linux-surface kernel immediately after installing fedora
sudo chroot /mnt/sysimage
sudo dnf config-manager addrepo --from-repofile=https://pkg.surfacelinux.com/fedora/linux-surface.repo
sudo dnf --disablerepo=updates install --allowerasing kernel-surface iptsd libwacom-surface -y

# At the moment only works with Grub
sudo dnf install surface-secureboot

# After first boot in fedora
sudo dnf config-manager addrepo --from-repofile=https://pkg.surfacelinux.com/fedora/linux-surface.repo
