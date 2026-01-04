#!/bin/bash
set -e

echo "==> Setting up font configuration..."
sudo cp ./dotfiles/fontconfig/local.conf /etc/fonts/local.conf

echo "==> Rebuilding font cache..."
sudo fc-cache -fv

echo "Font configuration updated. You may need to restart applications or your session for changes to take full effect."
