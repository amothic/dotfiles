#!/bin/sh
cd $(dirname $0)

echo "Change Shell to Zsh"
chsh -s /bin/zsh

echo "Create dotfile links"
$PWD/create_link.sh

echo "Install vim plugin"
$PWD/vim.sh

echo "Install Homebrew and Install Apps"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew bundle
