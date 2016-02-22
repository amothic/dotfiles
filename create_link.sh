#!/bin/bash
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [[ $dotfile != \.git* ]]; then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

# exception
ln -Fis "$PWD/.gitconfig" $HOME
ln -Fis "$PWD/.gitignore.global" $HOME
