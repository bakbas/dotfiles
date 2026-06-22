#!/bin/sh

sudo -v

# Resolve the dotfiles directory (where this script lives) and work from it,
# so relative references (Brewfile, npmfile, sibling scripts) resolve no matter
# where install.sh is invoked from.
DOTFILES="$(cd "$(dirname "$0")" && pwd)"
cd "$DOTFILES" || exit 1

# Generate SSH keys
pub=$HOME/.ssh/id_ed25519.pub

if [ -f "$pub" ]; then
    echo 'SSH key is already exists, no need to generate..'
else
    echo 'Generating SSH Key...'
    ssh-keygen -t ed25519 -C "bahtiyar@outlook.com"
fi

# Check and install or update xcode-select
if ! xcode-select -p >/dev/null 2>&1; then
    echo "xcode-select is not installed. Installing..."
    xcode-select --install
else
    echo "xcode-select is already installed."
fi

echo 'Installing Brew & Packages..'
sh brew.sh

# Make brew-installed tools available for the rest of this script
export PATH="/opt/homebrew/bin:$PATH"

echo 'Linking dotfiles into home..'
ln -sf "$DOTFILES/.zshrc"      "$HOME/.zshrc"
ln -sf "$DOTFILES/.zsh_alias"  "$HOME/.zsh_alias"
ln -sf "$DOTFILES/.gitconfig"  "$HOME/.gitconfig"
ln -sf "$DOTFILES/.nuxtrc"     "$HOME/.nuxtrc"
mkdir -p "$HOME/.config/git"
ln -sf "$DOTFILES/git/ignore"  "$HOME/.config/git/ignore"
mkdir -p "$HOME/.docker"
ln -sf "$DOTFILES/docker-config.json" "$HOME/.docker/config.json"

echo 'Installing VSCode extensions!..'
sh vscode-extensions.sh

echo 'Installing Node versions (nvm)..'
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
if command -v nvm >/dev/null 2>&1; then
    nvm install "$(cat "$DOTFILES/.nvmrc")"   # pinned default (22.11.0)
    nvm install 20.18.0
    nvm install 18.17.1
    nvm alias default "$(cat "$DOTFILES/.nvmrc")"
    nvm use default
fi

echo 'Installing global npm packages..'
command -v npm >/dev/null 2>&1 && xargs -n1 npm i -g < "$DOTFILES/npmfile"

echo 'Installing Ruby (rbenv)..'
if command -v rbenv >/dev/null 2>&1; then
    eval "$(rbenv init -)"
    rbenv install -s "$(cat "$DOTFILES/.ruby-version")"
    rbenv global "$(cat "$DOTFILES/.ruby-version")"
fi

echo 'Installing Python (pyenv)..'
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
    pyenv install -s "$(cat "$DOTFILES/.python-version")"
    pyenv global "$(cat "$DOTFILES/.python-version")"
fi

echo 'Setting up MacOS defaults!..'
sh macos.sh
