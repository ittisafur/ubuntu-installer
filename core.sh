#!/bin/bash

# Check if all the required packages are installed
are_all_packages_installed() {
    # List of required packages
    local packages=("curl" "wget" "git" "htop" "tree" "vim" "meson" "ninja" "cmake" "gcc" "g++" "make" "fzf")
    
    # Check each package
    for pkg in "${packages[@]}"; do
        if ! [ -x "$(command -v $pkg)" ]; then
            # One of the packages is not installed, return 1
            return 1
        fi
    done
    
    # All packages are installed, return 0
    return 0
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

# Check if all required packages are installed, if not, run core()
if ! are_all_packages_installed; then
    core
    echo "Installation completed."
fi

