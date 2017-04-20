#!/bin/sh
cd $(dirname $0)

$PWD/create_link.sh
$PWD/vim.sh

brew tap Homebrew/bundle
brew bundle
