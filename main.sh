#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with superuser privileges."
    echo "Use: sudo ./main.sh"
    exit 1
fi

source $(pwd)/core.sh
source $(pwd)/ghcli.sh
source $(pwd)/nodejs.sh

read -p "Do you want to customize the installation? (yes/no): " customize

# Default option to install everything
if [ "$customize" != "yes" ]; then
    echo "Installing all packages..."
    core
    install_ghcli
    install_nodejs
else
    # Ask the user to customize the installation
    echo "Select the options you want to SKIP:"
    echo "1. Core Packages"
    echo "2. GH CLI"
    read -p "Enter the numbers (separated by space) of the options you want to SKIP: " skip_options

    # Array to hold the options that the user wants to skip
    skip_arr=($skip_options)

    # Run the selected modules, skipping those that the user specified
    options=(1 2)  # ... add other option numbers as needed
    for option in "${options[@]}"; do
        if ! [[ " ${skip_arr[@]} " =~ " ${option} " ]]; then
            case $option in
                1) core ;;
                2) install_ghcli;;
                3) install_nodejs;;
                *) echo "Invalid option: $option" ;;
            esac
        fi
    done
fi

echo "Installation completed."

