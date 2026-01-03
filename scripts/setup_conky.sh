#!/bin/bash
set -e

echo "==> Setting up Conky..."

# Create conky configuration directory
CONKY_DIR="$HOME/.config/conky"
mkdir -p "$CONKY_DIR"

# Copy the conky configuration file
cp ./dotfiles/conky/conky.conf "$CONKY_DIR/conky.conf"

echo "==> Created default conky configuration at ~/.config/conky/conky.conf"

# Create autostart directory if it doesn't exist
AUTOSTART_DIR="$HOME/.config/autostart"
mkdir -p "$AUTOSTART_DIR"

# Create conky.desktop file for autostart
cat > "$AUTOSTART_DIR/conky.desktop" << 'EOL'
[Desktop Entry]
Type=Application
Exec=conky
Name=Conky
Comment=A lightweight system monitor
EOL

echo "==> Conky has been configured to start automatically on login."