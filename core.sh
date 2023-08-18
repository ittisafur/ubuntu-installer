#!/bin/bash


# Install Core Packages and Update System
core() {
    echo "Installing core packages..."
    apt update
    apt upgrade -y
    echo "Installing Ubuntu Restricted Extras, Steam, Build Essentials, Curl, Wget, Git, Htop, Tree, Vim, Meson, Ninja, CMake, GCC, G++, Make, Fzf..."
    apt install ubuntu-restricted-extras steam-installer build-essential curl wget git htop tree vim meson ninja-build cmake gcc g++ make fzf -y
    echo "Installing ZSH..."
    apt install zsh -y
    echo "Changing default shell to ZSH..."
    chsh -s $(which zsh)
    echo "Installing ZAP..."
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
    echo "Done installing core packages."
}
