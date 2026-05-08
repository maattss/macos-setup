#!/bin/bash

###############################################################################
# macOS Setup Script
# Author: Mats Tyldum
# Description: One-command setup for a fresh macOS installation.
#
# Usage:
#   ./install.sh                  # full setup (brew + zsh + macOS prefs)
#   ./install.sh --skip-macos     # skip macOS system preferences
###############################################################################

set -e

# Args
SKIP_MACOS=0
for arg in "$@"; do
    case "$arg" in
        --skip-macos) SKIP_MACOS=1 ;;
        -h|--help)
            sed -n '4,12p' "$0"
            exit 0
            ;;
        *) echo "Unknown flag: $arg" >&2; exit 1 ;;
    esac
done

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
error()   { echo -e "${RED}[ERROR]${NC} $1"; }
section() {
    echo ""
    echo -e "${BLUE}##########${NC} $1 ${BLUE}##########${NC}"
    echo ""
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

# `mas` requires you to be signed in to the Mac App Store. If not, the App
# Store entries fail soft and the script continues.
if ! mas account &>/dev/null 2>&1; then
    warning "Not signed in to the Mac App Store — App Store apps will be skipped."
    warning "Sign in via the App Store app, then re-run this script to install them."
fi

info "Installing packages from $SCRIPT_DIR/Brewfile..."
brew bundle --file="$SCRIPT_DIR/Brewfile" || warning "Some packages failed — see output above"
success "Brew packages processed"

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

section "Zsh Configuration"

ZSHRC="$HOME/.zshrc"
touch "$ZSHRC"

# Activate the plugins in ~/.zshrc. Replace the default `plugins=(git)` line
# (or any existing plugins=(...) line) with the full set we want.
DESIRED_PLUGINS="plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"
if grep -qE '^plugins=\(' "$ZSHRC"; then
    if ! grep -qF "$DESIRED_PLUGINS" "$ZSHRC"; then
        info "Updating zsh plugins line in ~/.zshrc..."
        # macOS sed: -i '' for in-place without backup
        sed -i '' -E "s|^plugins=\(.*\)|$DESIRED_PLUGINS|" "$ZSHRC"
        success "Zsh plugins activated"
    else
        success "Zsh plugins already activated"
    fi
else
    info "Adding zsh plugins line to ~/.zshrc..."
    printf '\n%s\n' "$DESIRED_PLUGINS" >> "$ZSHRC"
    success "Zsh plugins added"
fi

# NVM init block — only append if not already present.
if ! grep -q 'NVM_DIR' "$ZSHRC"; then
    info "Adding NVM init to ~/.zshrc..."
    cat >> "$ZSHRC" <<'EOF'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
EOF
    success "NVM init added"
else
    success "NVM init already in ~/.zshrc"
fi

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

if [ "$SKIP_MACOS" -eq 0 ]; then
    section "macOS System Preferences"
    bash "$SCRIPT_DIR/scripts/macos-settings.sh"
else
    info "Skipping macOS settings (--skip-macos)"
fi

section "Setup Complete! 🎉"

echo ""
echo "Next steps:"
echo "  1. Restart terminal (or run 'source ~/.zshrc')"
echo "  2. Restart your Mac so all macOS prefs take effect"
echo ""
