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

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

section() {
    echo ""
    echo -e "${BLUE}##########${NC} $1 ${BLUE}##########${NC}"
    echo ""
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    error "This script is only for macOS"
    exit 1
fi

section "Xcode Command Line Tools"

# Check for Xcode build tools, install if we don't have it
if type xcode-select >&- && xpath=$(xcode-select --print-path) && test -d "${xpath}" && test -x "${xpath}"; then
    success "Xcode build tools already installed"
else
    info "Installing Xcode build tools..."
    xcode-select --install
    # Wait for installation to complete
    until type xcode-select >&- && xpath=$(xcode-select --print-path) && test -d "${xpath}" && test -x "${xpath}"; do
        sleep 5
    done
    success "Xcode build tools installed"
fi

section "Homebrew"

# Check for Homebrew, install if we don't have it
if test ! "$(which brew)"; then
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    success "Homebrew installed"
else
    success "Homebrew already installed"
fi

# Update Homebrew
info "Updating Homebrew..."
brew update
success "Homebrew updated"

section "CLI Tools"

# Improved brew install function with better error handling
brew_install() {
    local package=$1
    local is_cask=$2
    
    if [[ "$is_cask" == "--cask" ]]; then
        if brew list --cask "$package" &>/dev/null; then
            success "$package (cask) already installed"
        else
            info "Installing $package (cask)..."
            if brew install --cask "$package"; then
                success "$package installed"
            else
                warning "Failed to install $package"
            fi
        fi
    else
        if brew list "$package" &>/dev/null; then
            success "$package already installed"
        else
            info "Installing $package..."
            if brew install "$package"; then
                success "$package installed"
            else
                warning "Failed to install $package"
            fi
        fi
    fi
}

# CLI Tools
brew_install git
brew_install gh
brew_install node
brew_install nvm
brew_install pnpm
brew_install jq
brew_install tree
brew_install wget
brew_install httpie

section "Development Applications"

# Development tools
brew_install docker --cask
brew_install warp --cask
brew_install github --cask
brew_install visual-studio-code --cask
brew_install rider --cask
brew_install dotnet-sdk --cask
brew_install bruno --cask

section "Productivity Applications"

# Productivity
brew_install slack --cask
brew_install raycast --cask
brew_install alt-tab --cask
brew_install dropbox --cask
brew_install linear-linear --cask

section "Media & Browsers"

# Media & Browsers
brew_install zen-browser --cask
brew_install spotify --cask
brew_install iina --cask

section "Utilities"

# Utilities
brew_install font-smoothing-adjuster --cask

# Uncomment to install VPN
# brew_install windscribe --cask

section "Oh My Zsh"

# Check for Oh My Zsh, install if we don't have it
if [ -d ~/.oh-my-zsh ]; then
    success "Oh My Zsh already installed"
else
    info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    success "Oh My Zsh installed"
fi

# Install useful Zsh plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    info "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    success "zsh-autosuggestions installed"
else
    success "zsh-autosuggestions already installed"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    info "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    success "zsh-syntax-highlighting installed"
else
    success "zsh-syntax-highlighting already installed"
fi

section "Directory Setup"

# Create Developer folder if it doesn't exist
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
