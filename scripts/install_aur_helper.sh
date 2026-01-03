#!/bin/bash
set -e

# Check if yay is already installed
if command -v yay &> /dev/null; then
    echo "yay is already installed."
    exit 0
fi

# Install yay from AUR
echo "Installing yay..."
TEMP_DIR=$(mktemp -d)
git clone https://aur.archlinux.org/yay-bin.git "$TEMP_DIR"
(cd "$TEMP_DIR" && makepkg -si --noconfirm)
rm -rf "$TEMP_DIR"

echo "yay installation complete."
