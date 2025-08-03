# Configuration

Mac configurations and dotfiles repository.

## Contents

This repository contains:

- **Shell configurations**: `.zshrc`, `.bashrc`, `.bash_profile`
- **Editor configurations**: `.vimrc`
- **Brew packages**: `Brewfile`, `brew-packages.txt`, `brew-casks.txt`
- **Setup script**: `setup.sh` for easy restoration
- **Environment template**: `.env.template` for managing secrets

## Quick Setup

To restore these configurations on a new machine:

```bash
git clone https://github.com/lesnerd/configuration.git
cd configuration
./setup.sh
```

## Manual Setup

### Configuration Files
```bash
# Copy dotfiles to home directory
cp .zshrc .bashrc .vimrc .bash_profile ~/
```

### Brew Packages
```bash
# Install from Brewfile (recommended)
brew bundle install

# Or install individually
brew install $(cat brew-packages.txt)
brew install --cask $(cat brew-casks.txt)
```

### Setting up Secrets

⚠️ **Important**: The configuration files contain placeholder values for sensitive information. You'll need to replace these with your actual credentials:

1. **Copy the environment template**: `cp .env.template .env`
2. **Edit `.env`** with your actual credentials
3. **Source the file**: `source .env`
4. **Update your `.zshrc`** to use the environment variables

Look for comments like `# REPLACE WITH YOUR...` in the configuration files.

## Updating

To update this repository with current configurations:

```bash
# Copy current config files (make sure to clean secrets first!)
cp ~/.zshrc ~/.bashrc ~/.vimrc ~/.bash_profile .

# Update brew packages
brew bundle dump --force

# Commit changes
git add -A
git commit -m "Update configurations"
git push
```
