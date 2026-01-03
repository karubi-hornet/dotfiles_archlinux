#!/bin/bash
set -e

# --- Timezone ---
echo "Setting timezone to Asia/Tokyo..."
timedatectl set-timezone Asia/Tokyo

# --- Locale ---
echo "Generating Japanese locale..."
sed -i 's/#ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

echo "Setting system language to Japanese..."
echo LANG=ja_JP.UTF-8 > /etc/locale.conf

# --- Keyboard Layout ---
echo "Setting keyboard layout to jp106..."
echo KEYMAP=jp106 > /etc/vconsole.conf

# --- Input Method (fcitx5-mozc) ---
echo "Configuring input method environment variables..."
cat << 'EOF' >> /etc/environment
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOF

echo "Locale setup complete. Please reboot for all changes to take effect."
