#!/bin/bash

# Install GH CLI
install_ghcli() {
    echo "Installing GH CLI..."
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    apt update
    apt install gh
    echo "GH CLI is installed."
}

remove_ghcli() {
    echo "Removing GH CLI..."
    apt remove gh
    echo "GH CLI is removed."
}
