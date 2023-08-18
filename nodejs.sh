#!/bin/bash

# Check if Node.js is installed
is_nodejs_installed() {
    if [ -x "$(command -v node)" ] && [ -x "$(command -v npm)" ]; then
        return 0
    else
        return 1
    fi
}

# Install Node.js
install_nodejs() {
    echo "Installing Node.js, npm, yarn, and pnpm..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
    apt install -y nodejs
    npm i -g npm@latest
    echo "Adding Yarn"
    npm install -g yarn
    echo "Adding Pnpm"
    npm install -g pnpm
    echo "Node.js, npm, yarn, and pnpm are installed."
}

# Remove Node.js
remove_nodejs() {
    echo "Removing Node.js, npm, yarn, and pnpm..."
    apt remove -y nodejs
    npm uninstall -g npm
    npm uninstall -g yarn
    npm uninstall -g pnpm
    echo "Node.js, npm, yarn, and pnpm are removed."
}


