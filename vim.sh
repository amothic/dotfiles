#!/bin/bash
cd $(dirname $0)

git submodule init
git submodule update
mkdir ~/.vimundo
vim +NeoBundleInstall
