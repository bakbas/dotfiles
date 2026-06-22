#!/bin/bash

# Check Homebrew installation
if ! command -v brew &> /dev/null
then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

# Ensure brew is on PATH for the rest of this script. The Homebrew installer
# does NOT modify the current shell's PATH; on Apple Silicon brew lives at
# /opt/homebrew, on Intel at /usr/local.
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Update Homebrew and install dependencies
echo "Homebrew updating and Brewfile dependencies installing..."
brew update
brew bundle -v
brew cleanup --prune=all

echo "Homebrew and dependencies installed successfully."