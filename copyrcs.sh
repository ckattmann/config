#!/bin/bash

echo "--Installing Packages with apt-get"
sudo apt-get install vim-gnome
sudo apt-get install git
sudo apt-get install build-essential cmake
sudo apt-get install python-dev

# Set up Vundle
echo "--Setting up Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git config --global user.name "kipfer"
git config --global push.default simple

python ~/.vim/bundle/YouCompleteMe/install.py

# Copy existing .bashrc and .vimrc
echo "--Making Copies of .bashrc and .vimrc if necessary"
if [ -e "~/.bashrc" ]
then
	echo ".bashrc exists, moving to .bashrc2"
	cp ~/.bashrc ~/.bashrc2
	rm ~/.bashrc
fi

if [ -e "~/.vimrc" ]
then
	echo ".vimrc exists, moving to .vimrc2"
	cp ~/.vimrc ~/.vimrc2
	rm ~/.vimrc
fi

# Create symbolic links to rc's in version controlled directory
ln -s $(pwd)/.bashrc ~/.bashrc
ln -s $(pwd)/.vimrc ~/.vimrc 

# Add pythonlocal to PYTHONPATH
echo "--Modifying PYTHONPATH"
if [ ! -e "$HOME/pythonlocal" ]
then
    mkdir ~/pythonlocal
fi
export PYTHONPATH="${PYTHONPATH}:$HOME/pythonlocal"

echo "--Finished, sourcing bashrc"
source ~/.bashrc
