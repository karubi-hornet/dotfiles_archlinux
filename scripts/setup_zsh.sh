#!/bin/bash
set -e

echo "==> Installing Oh My Zsh..."

# Install Oh My Zsh non-interactively
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed."
fi

# Install powerlevel10k theme
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
else
    echo "Powerlevel10k is already installed."
fi

# Install zsh-syntax-highlighting plugin
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting is already installed."
fi

# Install zsh-autosuggestions plugin
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions is already installed."
fi

# Copy the .zshrc configuration file
cp ./dotfiles/zsh/.zshrc "$HOME/.zshrc"

# Change shell to zsh for the current user
# This requires sudo password
if [[ "$(getent passwd "$USER" | cut -d: -f7)" != "$(which zsh)" ]]; then
    echo "==> Changing default shell to zsh for user $USER..."
    sudo chsh -s "$(which zsh)" "$USER"
    echo "Default shell changed to zsh. Please log out and log back in for the change to take effect."
else
    echo "Default shell is already zsh."
fi
