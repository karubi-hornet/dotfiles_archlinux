# Arch Linux Initial Setup Dotfiles

This repository contains dotfiles and scripts to perform an initial setup of an Arch Linux desktop environment.

## Prerequisites

- A fresh Arch Linux installation.
- A non-root user with `sudo` privileges.
- An active internet connection.

## Usage

1.  Clone this repository:
    ```bash
    git clone <this-repository-url>
    cd install_archlinux
    ```

2.  Run the setup:
    ```bash
    make
    ```
    You will be prompted for your `sudo` password multiple times as the scripts install packages and modify system configurations.

## What it does

The `make` command executes the following steps in order:

1.  **`setup-locale`**:
    - Sets the system timezone to `Asia/Tokyo`.
    - Configures the system locale for Japanese (`ja_JP.UTF-8`).
    - Sets the console keyboard layout to `jp106`.
    - Configures environment variables for the Fcitx5 input method engine with Mozc.

2.  **`install-packages`**:
    - Installs essential packages from the official repositories using `pacman`:
        - `git`
        - `base-devel` (for building AUR packages)
        - `fcitx5-mozc` and related packages for Japanese input.
        - `zsh`

3.  **`setup-zsh`**:
    - Installs "Oh My Zsh".
    - Changes the default shell for the user to `zsh`.

4.  **`install-aur-helper`**:
    - Installs `yay-bin`, a pre-compiled AUR helper, to speed up the process. It will not be reinstalled if `yay` is already present.

5.  **`install-aur-packages`**:
    - Installs the following applications from the AUR using `yay`:
        - `visual-studio-code-bin` (VSCode)
        - `slack-desktop` (Slack)
        - `discord`
        - `obsidian`

6. **`setup-conky`**
    - Installs "conky"
    - Configure `conky.conf`
