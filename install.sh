#!/bin/sh

sudo -v

# Generate SSH keys
pub=$HOME/.ssh/id_rsa.pub

if [ -f $pub ]; then
    echo 'SSH key is already exists, no need to generate..'
else
    ssh-keygen -t rsa -b 4096 -C "bahtiyar@outlook.com"
    echo 'Generating SSH Key...'
fi

# Check and install or update xcode-select
if ! xcode-select -p &>/dev/null; then
    echo "xcode-select is not installed. Installing..."
    xcode-select --install
else
    echo "xcode-select is already installed."
fi

# ./brew.sh
echo 'Installing VSCode extensions!..'
sh vscode-extensions.sh
# xargs npm i -g < npmfile
echo 'Setting up MacOS defaults!..'
sh macos.sh