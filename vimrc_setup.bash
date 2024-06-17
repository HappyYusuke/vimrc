#!/bin/bash

# Install vim
sudo apt install vim

# Install plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# JEDI
pip install jedi

# Flake8
sudo apt install flake8

# Move .vimrc
cd ~/
cp ~/vimrc/.vimrc .

# Setup
vim + ":PlugInstall" +:q +:q
