#!/bin/bash

# Configuration Setup Script
# This script helps restore configuration files and brew packages

echo "Setting up configuration files..."

# Backup existing config files
echo "Creating backups of existing config files..."
for file in .zshrc .bashrc .vimrc .bash_profile; do
    if [ -f "$HOME/$file" ]; then
        echo "Backing up $HOME/$file to $HOME/$file.backup"
        cp "$HOME/$file" "$HOME/$file.backup"
    fi
done

# Copy configuration files to home directory
echo "Copying configuration files..."
cp .zshrc .bashrc .vimrc .bash_profile "$HOME/"

# Make sure brew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Please install Homebrew first:"
    echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
fi

# Install brew packages from Brewfile
if [ -f "Brewfile" ]; then
    echo "Installing brew packages from Brewfile..."
    brew bundle install
else
    echo "Brewfile not found. Installing from package lists..."
    
    # Install formulae
    if [ -f "brew-packages.txt" ]; then
        echo "Installing brew formulae..."
        while read -r package; do
            brew install "$package"
        done < brew-packages.txt
    fi
    
    # Install casks
    if [ -f "brew-casks.txt" ]; then
        echo "Installing brew casks..."
        while read -r cask; do
            brew install --cask "$cask"
        done < brew-casks.txt
    fi
fi

echo "Setup complete! You may need to restart your terminal or run 'source ~/.zshrc' to apply changes."
