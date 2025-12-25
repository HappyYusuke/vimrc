#!/bin/bash


# Install vim
sudo apt update
sudo apt install software-properties-common
#リポジトリの追加
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim


# Install plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# JEDI
pip install jedi


# Flake8
sudo apt install flake8


# Move .vimrc
cp $HOME/vimrc/.vimrc $HOME


# Install plugin
VIM_PLUGIN_INSTALL=1 vim +qall


# Install colorscheme
mkdir $HOME/.vim/colorscheme && mkdir $HOME/.vim/colors
cd $HOME/.vim/colorscheme
git clone https://github.com/morhetz/gruvbox.git 
git clone https://github.com/altercation/vim-colors-solarized.git 
git clone https://github.com/w0ng/vim-hybrid.git 
git clone https://github.com/gosukiwi/vim-atom-dark.git 
git clone https://github.com/jacoborus/tender.vim.git 
git clone https://github.com/raphamorim/lucario.git 
git clone https://github.com/jonathanfilip/vim-lucius.git
cd $HOME
mv $HOME/.vim/colorscheme/gruvbox/colors/gruvbox.vim \
    $HOME/.vim/colorscheme/lucario/colors/lucario.vim \
    $HOME/.vim/colorscheme/tender.vim/colors/tender.vim \
    $HOME/.vim/colorscheme/vim-atom-dark/colors/atom-dark.vim \
    $HOME/.vim/colorscheme/vim-colors-solarized/colors/solarized.vim \
    $HOME/.vim/colorscheme/vim-hybrid/colors/hybrid.vim \
    $HOME/.vim/colorscheme/vim-lucius/colors/lucius.vim ~/.vim/colors

# Display
echo "!!! Vim セットアップ完了 !!!"
