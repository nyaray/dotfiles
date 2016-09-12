#!/usr/bin/env bash

set -e

# change directory to script location
cd "$(dirname "$0")"

# create directories and copy files
echo "Copying .gitconfig"
cp gitconfig ~/.gitconfig
echo

echo "Creating .notion"
mkdir ~/.notion
echo "Copying cfg_notion.lua"
cp notion.d/cfg_notion.lua ~/.notion/
echo

echo "Creating .ssh"
mkdir ~/.ssh
echo

echo "Copying .Xresources"
cp Xresources ~/.Xresources
echo "Copying .Xresources.d"
cp Xresources.d ~/.Xresources.d
echo

echo "Creating .zsh"
mkdir ~/.zsh
echo "Copying .zshrc"
cp zshrc ~/.zshrc
echo

echo "Cherry-pick entries from the `packages` file for installation"
echo "Post-package installation todo:"
echo "[ ] visudo for self"
echo "[ ] ssh-keygen for self"
echo "[ ] push pub key to ALL the things"
echo "[ ] sddm configuration"
echo "[ ] notion configuration?"
echo "[ ] ssh configuration?"
echo "[ ] tmux configuration?"
echo

