# Install linux-surface kernel immediately after installing fedora
sudo chroot /mnt/sysimage

# If netinstall, boot into Workstation Live USB
sudo mount /dev/nvme0n1p8 /mnt
sudo mount --rbind /dev /mnt/root/dev
sudo mount --rbind /proc /mnt/root/proc
sudo mount --rbind /sys /mnt/root/sys
sudo mount --rbind /run /mnt/root/run
sudo mount --rbind /boot /mnt/root/boot
sudo chroot /mnt/root /usr/bin/bash

# Once chroot done
dnf config-manager --add-repo=https://pkg.surfacelinux.com/fedora/linux-surface.repo
dnf --disablerepo=updates install --allowerasing kernel-surface iptsd libwacom-surface -y

# At the moment only works with Grub
dnf install surface-secureboot -y

# After first boot in fedora
dnf config-manager --add-repo=https://pkg.surfacelinux.com/fedora/linux-surface.repo
