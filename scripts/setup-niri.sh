# Get script directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Copy background, profile, and icon folders
cp -r $SCRIPT_DIR/../home/userprofile/.config/niri ~/.config
cp -r $SCRIPT_DIR/../home/userprofile/.config/noctalia ~/.config
# sudo cp -r $SCRIPT_DIR/../home/userprofile/local/share/xdg-desktop-portal ~/.local/share

# Install niri and xwayland-satellite
yay -S niri xwayland-satellite --needed --noconfirm

# Install noctalia-shell dependencies
yay -S brightnessctl imagemagick cava cliphist wlsunset evolution-data-server --needed --noconfirm
# yay -S ddcutil --needed --noconfirm

# Install noctalia-shell
yay -S noctalia-shell noctalia-qs --needed --noconfirm

# Install swayidle
# yay -S swayidle --needed --noconfirm

# Install archlinux-xdg-menu for Dolphin compatability
# yay -S archlinux-xdg-menu --needed --noconfirm

# Attach swayidle service to niri session
# systemctl --user daemon-reload
# systemctl --user add-wants niri.service swayidle.service
