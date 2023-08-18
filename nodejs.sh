#!/bin/bash


# Install Node.js
install_nodejs() {
    echo "Installing Node.js and npm..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
    apt install -y nodejs
    npm i -g npm@latest
    echo "Node.js and npm installed."
}
