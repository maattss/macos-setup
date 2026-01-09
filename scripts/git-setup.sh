#!/bin/bash

###############################################################################
# Git Setup Script
# Author: Mats Tyldum
# Description: Configure Git settings and SSH keys for GitHub
###############################################################################

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

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

section "Git Configuration"

# Check if git is installed
if ! command -v git &> /dev/null; then
    error "Git is not installed. Please run install.sh first."
    exit 1
fi

# Get user info
echo ""
read -p "Enter your full name for Git commits: " GIT_NAME
read -p "Enter your email for Git commits: " GIT_EMAIL

info "Configuring Git user settings..."

# Set Git user config
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

success "Git user configured: $GIT_NAME <$GIT_EMAIL>"

section "Git Global Settings"

info "Setting up Git defaults..."

# Default branch name
git config --global init.defaultBranch main

# Enable colored output
git config --global color.ui auto

# Set default editor to VS Code (if installed)
if command -v code &> /dev/null; then
    git config --global core.editor "code --wait"
    success "Default editor set to VS Code"
else
    warning "VS Code not found, using default editor"
fi

# Set pull strategy
git config --global pull.rebase false

# Set push default
git config --global push.default current
git config --global push.autoSetupRemote true

# Useful aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.lg "log --oneline --graph --decorate --all"
git config --global alias.amend 'commit --amend --no-edit'
git config --global alias.undo 'reset --soft HEAD~1'

# Global gitignore
git config --global core.excludesfile ~/.gitignore_global

# Create global gitignore if it doesn't exist
if [ ! -f ~/.gitignore_global ]; then
    cat > ~/.gitignore_global << 'EOF'
# macOS
.DS_Store
.AppleDouble
.LSOverride
._*
.Spotlight-V100
.Trashes

# IDE
.idea/
.vscode/
*.swp
*.swo
*~

# Dependencies
node_modules/
.pnpm-store/

# Build
dist/
build/
*.log

# Environment
.env
.env.local
.env.*.local

# Misc
*.tmp
*.temp
.cache/
EOF
    success "Created global gitignore at ~/.gitignore_global"
fi

success "Git global settings configured"

section "SSH Key Setup"

# Check if SSH key already exists
if [ -f ~/.ssh/id_ed25519 ]; then
    warning "SSH key already exists at ~/.ssh/id_ed25519"
    read -p "Do you want to create a new key? (y/N): " CREATE_NEW_KEY
    
    if [[ "$CREATE_NEW_KEY" != "y" && "$CREATE_NEW_KEY" != "Y" ]]; then
        info "Skipping SSH key creation"
    else
        info "Creating new SSH key..."
        ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f ~/.ssh/id_ed25519_new
        mv ~/.ssh/id_ed25519 ~/.ssh/id_ed25519_backup
        mv ~/.ssh/id_ed25519.pub ~/.ssh/id_ed25519_backup.pub
        mv ~/.ssh/id_ed25519_new ~/.ssh/id_ed25519
        mv ~/.ssh/id_ed25519_new.pub ~/.ssh/id_ed25519.pub
        success "New SSH key created (old key backed up)"
    fi
else
    info "Creating SSH key..."
    mkdir -p ~/.ssh
    ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f ~/.ssh/id_ed25519
    success "SSH key created"
fi

# Start ssh-agent and add key
eval "$(ssh-agent -s)" > /dev/null

# Create SSH config if it doesn't exist
if [ ! -f ~/.ssh/config ]; then
    cat > ~/.ssh/config << EOF
Host github.com
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519
EOF
    success "SSH config created"
fi

# Add key to keychain
ssh-add --apple-use-keychain ~/.ssh/id_ed25519 2>/dev/null || ssh-add -K ~/.ssh/id_ed25519 2>/dev/null || true

section "GitHub CLI Setup"

# Check if gh is installed
if command -v gh &> /dev/null; then
    # Check if already authenticated
    if gh auth status &> /dev/null; then
        success "GitHub CLI already authenticated"
    else
        info "Setting up GitHub CLI authentication..."
        echo ""
        echo "This will open a browser for GitHub authentication."
        read -p "Press Enter to continue..."
        gh auth login -p ssh -h github.com -w
        success "GitHub CLI authenticated"
    fi
    
    # Upload SSH key to GitHub if gh is authenticated
    if gh auth status &> /dev/null; then
        read -p "Do you want to add your SSH key to GitHub? (y/N): " ADD_KEY
        if [[ "$ADD_KEY" == "y" || "$ADD_KEY" == "Y" ]]; then
            KEY_TITLE="$(hostname) - $(date +%Y-%m-%d)"
            if gh ssh-key add ~/.ssh/id_ed25519.pub -t "$KEY_TITLE" 2>/dev/null; then
                success "SSH key added to GitHub"
            else
                warning "SSH key may already exist on GitHub"
            fi
        fi
    fi
else
    warning "GitHub CLI (gh) not installed. Skipping GitHub authentication."
fi

section "Complete! 🎉"

echo ""
echo "Your Git is now configured!"
echo ""
echo "Git user:"
echo "  Name:  $(git config --global user.name)"
echo "  Email: $(git config --global user.email)"
echo ""
echo "SSH public key (copy this to GitHub if not done automatically):"
echo ""
cat ~/.ssh/id_ed25519.pub
echo ""
echo ""
echo "Useful Git aliases added:"
echo "  git st     - status"
echo "  git co     - checkout"
echo "  git br     - branch"
echo "  git ci     - commit"
echo "  git lg     - pretty log"
echo "  git amend  - amend last commit"
echo "  git undo   - undo last commit (soft)"
echo ""
