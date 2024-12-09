#!/bin/sh

sudo -v

./brew.sh
./vscode-extensions.sh
xargs npm i -g < npmfile
./bootstrap.sh