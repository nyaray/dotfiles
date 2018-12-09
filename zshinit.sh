#!/bin/bash

set -e
cd "$(dirname "$0")"

if [ ! -f /usr/local/bin/antigen.zsh ]; then
    echo "Antigen not found, downloading..."
    curl -L git.io/antigen > /usr/local/bin/antigen.zsh
    echo "Done"
else
    echo "Using pre-existing antigen."
fi

if [ ! -d "$HOME/.zsh" ]; then
    echo "Creating ~/.zsh/"
    mkdir -p ~/.zsh
fi

echo "Copying zshrc..."
cp zsh/zshrc ~/.zshrc
echo "Done"
