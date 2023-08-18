#!/bin/bash

# Check if all the required packages are installed, and if not, install them
core() {
    echo "Checking if core packages are installed..."

    local packages=("curl" "wget" "git" "htop" "tree" "vim" "meson" "ninja" "cmake" "gcc" "g++" "make" "fzf")
    
    # Assume all packages are installed initially
    local all_installed=true
    
    # Check each package
    for pkg in "${packages[@]}"; do
        if ! [ -x "$(command -v $pkg)" ]; then
            # One of the packages is not installed
            all_installed=false
            break
        fi
    done
    
    if [ "$all_installed" = true ]; then
        echo "All core packages are already installed."
    else
      install_core
    fi
}

install_core(){
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
