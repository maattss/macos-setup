#!/bin/sh

# Homebrew script for installing packages and applications on macOS
# 
# This should be idempotent so it can be run multiple times.
#
# Some apps don't have a cask and so still need to be installed by hand. These
# include:
#
# - Magnet (Mac App store)
# - Vectornator (Mac App Store)
# - Logi Options

# Check for Xcode build tools, install if we don't have it
if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}" ; then
  #... is correctly installed
  echo "Xcode build tools already installed... skipping";
else
  echo "Installing Xcode build tools...";
  xcode-select --install 
fi

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
 else
  echo "Homebrew already installed... Skipping..."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install dev Tools
echo "Installing dev tools..."
brew install git
brew install --cask iterm2
brew install --cask github
brew install --cask visual-studio-code
brew install --cask rider
brew install --cask sublime-text
brew install --cask postman
brew install --cask dotnet-sdk
brew install node
brew install nvm

# Install other apps
echo "Installing other apps..."
brew install --cask slack
brew install --cask google-chrome
brew install --cask dropbox
brew install --cask alt-tab
brew install --cask spotify
brew install --cask iina
brew install --cask 1password
brew install --cask cheatsheet

# Homebrew Cleanup
echo "Cleanup..."
brew cleanup

# Check for Oh My Zsh, install if we don't have it
if [ -d ~/.oh-my-zsh ]; then
	echo "Oh My Zsh already installed... Skipping..."
 else
  echo "Installing Oh My Zsh..."
  /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Create "Developer" folder
mkdir ~/Developer

echo "Finished!"