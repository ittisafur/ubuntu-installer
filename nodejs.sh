#!/bin/bash

# Check if Node.js is installed
nodejs() {
    if [ -x "$(command -v node)" ] && [ -x "$(command -v npm)" ] && [ -x "$(command -v yarn)" ] && [ -x "$(command -v pnpm)" ] && [ -x "$(command -v nvm)" ]; then
        echo "NVM, Node.js, npm, yarn, and pnpm are already installed."
    else
        install_nodejs
    fi
}

# Install Node.js
install_nodejs() {

    echo "Installing NVM (Node Version Manager)..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

    # Get the actual user's home directory
    USER_HOME=$(eval echo ~$SUDO_USER)
    
    export NVM_DIR="$USER_HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    echo "Adding NVM to .zshrc..."
    echo 'export NVM_DIR="$HOME/.nvm"' >> $USER_HOME/.zshrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $USER_HOME/.zshrc
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $USER_HOME/.zshrc

    echo "Source .zshrc..."
    source $USER_HOME/.zshrc

    echo "Installing latest LTS version of Node.js..."
    nvm install --lts

    echo "Setting the default Node.js version..."
    nvm alias default node

    echo "Node.js version: $(node -v)"
    echo "npm version: $(npm -v)"

    echo "Adding Yarn"
    npm install -g yarn
    echo "Adding Pnpm"
    npm install -g pnpm

    echo "Done installing Node.js, npm, yarn, and pnpm."
}

# Remove Node.js
remove_nodejs() {
    echo "Removing NVM Node.js, npm, yarn, and pnpm..."
    npm uninstall -g npm
    npm uninstall -g yarn
    npm uninstall -g pnpm

    rm -rf ~/.nvm
    rm -rf ~/.npm
    rm -rf ~/.yarn
    rm -rf ~/.pnpm
    rm -rf ~/.config/yarn
    rm -rf ~/.config/pnpm
    rm -rf ~/.local/share/yarn
    rm -rf ~/.local/share/pnpm
    rm -rf ~/.cache/yarn
    rm -rf ~/.cache/pnpm
    rm -rf ~/.node-gyp
    rm -rf ~/.npmrc
    rm -rf ~/.pnpm-store
    rm -rf ~/.yarnrc
    rm -rf ~/.yarnrc.yml
    rm -rf ~/.yarnignore
    rm -rf ~/.yarn-integrity
    rm -rf ~/.yarn-metadata.json
    rm -rf ~/.yarn-tarball.tgz
    rm -rf ~/.yarn
    rm -rf ~/.pnpm-lock.yaml
    rm -rf ~/.pnpm
    rm -rf ~/.pnpm-store
    rm -rf ~/.pnpmfile.cjs
    rm -rf ~/.pnpmfile.js
    rm -rf ~/.pnpmfile.json
    rm -rf ~/.pnpm-workspace.yaml
    echo "Node.js, npm, yarn, and pnpm are removed."
}


