#!/bin/bash
cd $(dirname $0)

# Create symlinks for dotfiles in the current directory
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [[ $dotfile != \.git* ]] && [ $dotfile != ".config" ]; then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

# Handle specific dotfiles
ln -Fis "$PWD/.gitconfig" $HOME
ln -Fis "$PWD/.gitignore.global" $HOME

# Create symlinks for files in ~/.config directory
if [ -d "$PWD/.config" ]; then
    mkdir -p $HOME/.config
    for configfile in $PWD/.config/*
    do
        ln -Fis "$configfile" $HOME/.config
    done
fi
