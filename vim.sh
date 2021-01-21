#!/bin/bash
cd $(dirname $0)

mkdir ~/.vim/undo

mkdir -p ~/.vim/bundle/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim ~/.vim/bundle/repos/github.com/Shougo/dein.vim

vim +"call dein#install()"
