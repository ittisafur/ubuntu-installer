#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with superuser privileges."
    echo "Use: sudo ./install.sh"
    exit 1
fi

source $(pwd)/core.sh
# source $(pwd)/nodejs.sh

# Prompt user to select modules to run
echo "Select the options you want to install:"
echo "1. Core Packages"
read -p "Enter the numbers (separated by space) of the options you want to install: " options

# Run the selected modules
for option in $options; do
    case $option in
        1) core ;;
        *) echo "Invalid option: $option" ;;
    esac
done

echo "Installation completed."

