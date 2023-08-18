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
    # ... rest of your installation commands
}

# Check if all required packages are installed, if not, run core()
if ! are_all_packages_installed; then
    core
fi

echo "Installation completed."
