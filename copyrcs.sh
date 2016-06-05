#!/bin/bash

sudo apt-get update

echo "-- Install and Configure git"
sudo apt-get install -y git
git config --global user.name "kipfer"
git config --global push.default simple


echo "--Configure Terminal"
# This path is correct for Linux Mint 17.3, might be .config/Terminal for others
cp $(pwd)/terminalrc ~/.config/xfce4/terminal


echo "-- Installing i3 stuff"
sudo apt-get install -y i3 i3status dmenu
# Install i3-gaps including all dependencies
sudo apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev
rm -rf i3-gaps
git clone https://www.github.com/Airblader/i3 i3-gaps
pushd .
cd i3-gaps
git checkout gaps && git pull
make
sudo make install
popd


echo "-- Setting Wallpaper"
WALLPAPERLINK=https://wallpaperscraft.com/image/los_angeles_laguna_beach_buildings_skyscrapers_58395_3840x2400.jpg
WALLPAPERLINKNOHTTPS=${WALLPAPERLINK:7}
sudo apt-get install -y feh
sudo apt-get install -y curl
pushd .
cd ~/Downloads
curl --silent -o ~/Downloads/ $WALLPAPERLINK
popd
feh --bg-scale ~/Downloads/ ${WALLPAPERLINKNOTHTTPS##/*/}


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

echo "-- Copying .bashrc into location"
if [ -e "~/.bashrc" ]
then
	echo ".bashrc exists, moving to .bashrc2"
	cp ~/.bashrc ~/.bashrc2
	rm ~/.bashrc
fi


# Create symbolic links to rc's in version controlled directory
ln -s $(pwd)/.bashrc ~/.bashrc


echo "-- Install the arc theme <- when Linux Mint updates to Ubuntu 16 LTS"
# sudo apt-get install -y gnome-themes-standard gtk2-engines-murrine
# sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
# sudo apt-get update
# sudo apt-get install -y arc-theme


echo "--Finished, sourcing bashrc"
source ~/.bashrc
