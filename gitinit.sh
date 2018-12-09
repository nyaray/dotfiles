#!/bin/bash

set -e
cd "$(dirname "$0")"

echo "Copying gitconfig..."
cp git/gitconfig ~/.gitconfig
echo "Copying gitignore_global..."
cp git/gitignore_global ~/.gitignore_global
echo "Configuring global gitignore..."
git config --global core.excludesfile ~/.gitignore_global
echo "Done"
