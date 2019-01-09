#!/bin/bash
rm -rf ~/.vimrc
wget https://raw.githubusercontent.com/aod321/myneovimdotfile/master/.vimrc
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/
ln -s ~/.vimrc ~/.config/nvim/init.vim
