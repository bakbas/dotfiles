#!/bin/bash

# Check Homebrew installation
if ! command -v brew &> /dev/null
then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

# Update Homebrew and install dependencies
echo "Homebrew updating and Brewfile dependencies installing..."
brew update
brew bundle -v
brew cleanup --prune=all

echo "Homebrew and dependencies installed successfully."