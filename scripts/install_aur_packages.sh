#!/bin/bash
set -e

# Check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "Error: yay is not installed. Please run 'make install-aur-helper' first."
    exit 1
fi

# Install packages from AUR
# Using --noconfirm to avoid interactive prompts
yay -S --noconfirm visual-studio-code-bin slack-desktop discord obsidian
