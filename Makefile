# Makefile for Arch Linux setup

.PHONY: all setup-locale install-packages setup-zsh install-aur-helper install-aur-packages setup-conky setup-font

# Default target
all: setup-locale install-packages setup-zsh install-aur-helper install-aur-packages setup-conky setup-font

# Setup locale and keyboard
setup-locale:
	@echo "==> Setting up locale and keyboard..."
	sudo bash scripts/setup_locale.sh

# Install packages from official repositories
install-packages:
	@echo "==> Installing base packages..."
	sudo bash scripts/install_packages.sh

# Setup Zsh and Oh My Zsh
setup-zsh:
	@echo "==> Setting up Zsh and Oh My Zsh..."
	bash scripts/setup_zsh.sh

# Install AUR helper (yay)
install-aur-helper:
	@echo "==> Installing AUR helper (yay)..."
	bash scripts/install_aur_helper.sh

# Install packages from AUR
install-aur-packages:
	@echo "==> Installing AUR packages..."
	bash scripts/install_aur_packages.sh

# Setup Conky
setup-conky:
	@echo "==> Setting up Conky..."
	bash scripts/setup_conky.sh

# Setup Font
setup-font:
	@echo "==> Setting up Font..."
	sudo bash scripts/setup_font.sh