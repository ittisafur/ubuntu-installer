#!/bin/bash

# Check if GH CLI is installed
is_ghcli_installed() {
    if [ -x "$(command -v gh)" ]; then
        return 0
    else
        return 1
    fi
}

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
    # Remove GH ClI and its dependencies and the source list
    apt remove -y gh
    rm /etc/apt/sources.list.d/github-cli.list
    apt update
    echo "GH CLI is removed."
}
