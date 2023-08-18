#!/bin/bash

# Check if the required package is installed
is_installed() {
    if [ -x "$(command -v $1)" ]; then
        return 0
    else
        return 1
    fi
}

# Install Core Packages and Update System
core() {
    echo "Installing core packages..."
    apt update
    apt upgrade -y
    echo "Installing Ubuntu Restricted Extras, Steam, Build Essentials, Curl, Wget, Git, Htop, Tree, Vim, Meson, Ninja, CMake, GCC, G++, Make, FZF, APT Transport HTTPS, CA Certificates, GNUPG..."
    apt install ubuntu-restricted-extras steam-installer build-essential curl wget git htop tree vim meson ninja-build cmake gcc g++ make fzf apt-transport-https ca-certificates gnupg -y
    echo "Installing ZSH..."
    apt install zsh -y
    echo "Changing default shell to ZSH..."
    chsh -s $(which zsh)
    echo "Installing ZAP..."
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
    echo "Done installing core packages."
}

# List of required packages
required_packages=("curl" "wget" "git" "htop" "tree" "vim" "meson" "ninja-build" "cmake" "gcc" "g++" "make" "fzf" "zsh")

# Flag to track if any package is missing
any_missing=0

# Check each package
for pkg in "${required_packages[@]}"; do
    if is_installed $pkg; then
        echo "$pkg is installed"
    else
        echo "$pkg is NOT installed"
        any_missing=1
    fi
done

# If any package is missing, run the core() function
if [ $any_missing -eq 1 ]; then
    core
else
    echo "All required packages are installed."
fi
