#!/bin/bash

###############################################################################
# macOS Setup Script
# Author: Mats Tyldum
# Description: Automated setup script for a fresh macOS installation
#
# Manual installs required:
# - Magnet (Mac App Store)
# - Logi Options (Logitech website)
###############################################################################

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Logging functions
info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
error()   { echo -e "${RED}[ERROR]${NC} $1"; }
section() {
    echo ""
    echo -e "${BLUE}##########${NC} $1 ${BLUE}##########${NC}"
    echo ""
}

# Resolve script directory so the Brewfile path works regardless of cwd
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    error "This script is only for macOS"
    exit 1
fi

section "Xcode Command Line Tools"

if command -v xcode-select &>/dev/null && xcode-select --print-path &>/dev/null; then
    success "Xcode Command Line Tools already installed"
else
    info "Installing Xcode Command Line Tools..."
    xcode-select --install
    until xcode-select --print-path &>/dev/null; do
        sleep 5
    done
    success "Xcode Command Line Tools installed"
fi

section "Homebrew"

if ! command -v brew &>/dev/null; then
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    success "Homebrew installed"
else
    info "Updating Homebrew..."
    brew update
    success "Homebrew up to date"
fi

section "Brew Packages (from Brewfile)"

info "Installing packages from $SCRIPT_DIR/Brewfile..."
brew bundle --file="$SCRIPT_DIR/Brewfile"
success "Brew packages installed"

section "Oh My Zsh"

if [ -d ~/.oh-my-zsh ]; then
    success "Oh My Zsh already installed"
else
    info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    success "Oh My Zsh installed"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
    plugin_dir="$ZSH_CUSTOM/plugins/$plugin"
    if [ ! -d "$plugin_dir" ]; then
        info "Installing $plugin..."
        git clone "https://github.com/zsh-users/$plugin" "$plugin_dir"
        success "$plugin installed"
    else
        success "$plugin already installed"
    fi
done

section "Directory Setup"

if [ ! -d ~/Developer ]; then
    info "Creating 'Developer' folder..."
    mkdir ~/Developer
    success "Developer folder created"
else
    success "Developer folder already exists"
fi

section "Cleanup"

info "Running Homebrew cleanup..."
brew cleanup
success "Cleanup completed"

section "Setup Complete! 🎉"

echo ""
echo "Next steps:"
echo "  1. Run 'source ~/.zshrc' or restart your terminal"
echo "  2. Configure Git: ./scripts/git-setup.sh"
echo "  3. Apply macOS settings: ./scripts/macos-settings.sh"
echo "  4. Install VS Code extensions manually or sync settings"
echo "  5. Install manual apps: Magnet (App Store), Logi Options"
echo ""
echo "Add these plugins to your ~/.zshrc:"
echo "  plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"
echo ""
