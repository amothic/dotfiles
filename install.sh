#!/bin/sh
cd $(dirname $0)

echo "Change Shell to Zsh"
chsh -s /bin/zsh

echo "Create dotfile links"
$PWD/create_link.sh

echo "Install vim plugin"
$PWD/vim.sh

echo "Install Homebrew and Install Apps"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle

echo "iTunes use Japanese"
defaults write com.apple.iTunes AppleLanguages "(ja)"
