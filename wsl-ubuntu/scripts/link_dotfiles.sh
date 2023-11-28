#!/bin/bash

# Terminal 
# ln (create link) -s (--symbolic) -f (--force)
ln -sf ~/.dotfiles/wsl-ubuntu/dotfiles/.bashrc            ~/.bashrc
ln -sf ~/.dotfiles/wsl-ubuntu/dotfiles/.bash_aliases      ~/.bash_aliases
ln -sf ~/.dotfiles/wsl-ubuntu/dotfiles/.zshrc             ~/.zshrc
ln -sd ~/.dotfiles/wsl-ubuntu/dotfiles/brendev.zsh-theme  $ZSH/themes/brendev.zsh-theme

# R
ln -sf ~/.dotfiles/dotfiles/.Rprofile       ~/.Rprofile

# Git
