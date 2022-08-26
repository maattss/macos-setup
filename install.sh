#!/bin/sh

# Homebrew script for installing packages and applications on macOS.
#
# Some apps don't have a cask and so still need to be installed by hand:
# - Magnet (Mac App store)
# - Vectornator (Mac App Store)
# - Logi Options

echo "########## Xcode ##########"

# Check for Xcode build tools, install if we don't have it
if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}" ; then
  echo "Xcode build tools already installed... Skipping";
else
  echo "Installing Xcode build tools...";
  xcode-select --install 
fi

echo "########## Homebrew ##########"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
 else
  echo "Homebrew already installed... Skipping"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

echo "########## Apps and tools ##########"

# Check for Oh My Zsh, install if we don't have it
if [ -d ~/.oh-my-zsh ]; then
	echo "Oh My Zsh already installed... Skipping..."
 else
  echo "Installing Oh My Zsh..."
  /bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

brew_install() {
    if brew list $1 &>/dev/null; then
        echo "$1 already installed... Skipping"
    else
        brew install $2 $1 
    fi
}

brew_install git
brew_install node
brew_install nvm
brew_install iterm2 --cask
brew_install github --cask
brew_install visual-studio-code --cask
brew_install rider --cask
brew_install postman --cask
brew_install dotnet-sdk --cask
brew_install slack --cask
brew_install google-chrome --cask
brew_install dropbox --cask
brew_install alt-tab --cask
brew_install spotify --cask
brew_install iina --cask
brew_install 1password --cask
brew_install cheatsheet --cask

echo "########## Finishing up ########## "

echo "Homebrew cleanup..."
brew cleanup

echo "Create 'Developer' folder..."
mkdir ~/Developer

echo "########## Completed! ########## "