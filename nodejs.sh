#!/bin/bash

# Check if Node.js is installed
nodejs() {
    echo "Checking Node.js, npm, yarn, and pnpm installation status..."

    echo "Node.js: $(command -v node)"
    echo "Exit status for Node.js: $?"
    
    echo "npm: $(command -v npm)"
    echo "Exit status for npm: $?"
    
    echo "yarn: $(command -v yarn)"
    echo "Exit status for yarn: $?"
    
    echo "pnpm: $(command -v pnpm)"
    echo "Exit status for pnpm: $?"

    if [ -x "$(command -v node)" ] && [ -x "$(command -v npm)" ] && [ -x "$(command -v yarn)" ] && [ -x "$(command -v pnpm)" ]; then
        echo "Node.js, npm, yarn, and pnpm are already installed."
    else
        install_nodejs
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


