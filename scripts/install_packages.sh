#!/bin/bash
set -e

# Update package database and install packages
# base-devel is required for building AUR packages
pacman -Syu --noconfirm \
    base-devel \
    conky \
    docker \
    docker-compose \
    fcitx5-configtool \
    fcitx5-gtk \
    fcitx5-im \
    fcitx5-mozc \
    fcitx5-qt \
    git \
    github-cli \
    jdk-openjdk \
    nodejs \
    python \
    thunderbird \
    zsh

echo "==> Enabling and starting Docker service..."
sudo systemctl enable docker.service
sudo systemctl start docker.service

echo "==> Adding current user to the docker group..."
sudo usermod -aG docker "$USER"
echo "Please log out and log back in for the docker group change to take effect."
