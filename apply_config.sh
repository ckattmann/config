#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y

echo "-- Install and Configure git"
sudo apt-get install -y git
git config --global user.name "kipfer"
git config --global push.default simple


echo "-- Download and install Anaconda"
# TODO


echo "-- Setting up Vim"
if [ -e "~/.vimrc" ]
then
	echo ".vimrc exists, moving to .vimrc2"
	cp ~/.vimrc ~/.vimrc2
	rm ~/.vimrc
fi
ln -s $(pwd)/.vimrc ~/.vimrc 
sudo apt-get install -y vim-gnome
sudo apt-get install -y build-essential cmake

sudo apt-get install -y python-dev
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
python ~/.vim/bundle/YouCompleteMe/install.py
chown -R $USER ~/.vim
echo "-- Copying .bashrc into location"
if [ -e "~/.bash_aliases" ]
then
	echo ".bash_aliases exists, moving to .bash_aliases2"
	cp ~/.bashaliases ~/.bash_aliases2
	rm ~/.bash_aliases
fi


# Create symbolic links to rc's in version controlled directory
ln -s $(pwd)/.bash_aliases ~/.bash_aliases


echo "--Finished, sourcing bashrc"
source ~/.bashrc
