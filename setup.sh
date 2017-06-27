#!/bin/bash

cd ~

# check to see if all directories exist
if [ ! -d "/home/$USER/.ssh" ]; then
	mkdir -p /home/$USER/.ssh/
fi

# backup current files if needed
if [ -f "/home/$USER/.bash_profile" ]; then
	mv ~/.bash_profile ~/.bash_profile.backup
fi
if [ -f "/home/$USER/.bashrc" ]; then
	mv ~/.bashrc ~/.bashrc.backup
fi
if [ -f "/home/$USER/.ssh/config" ]; then
	mv ~/.ssh/config ~/.ssh/config.backup
fi
if [ -f "/home/$USER/.gitconfig" ]; then
	mv ~/.gitconfig ~/.gitconfig.backup
fi
if [ -f "/home/$USER/.screenrc" ]; then
	mv ~/.screenrc ~/.screenrc.backup
fi
if [ -d "/home/$USER/.vim" ]; then
	mv ~/.vim ~/.vim.backup
fi
if [ -f "/home/$USER/.vimrc" ]; then
	mv ~/.vimrc ~/.vimrc.backup
fi
if [ -f "/home/$USER/.xinitrc" ]; then
	mv ~/.xinitrc ~/.xinitrc.backup
fi
if [ -f "/home/$USER/.Xresources" ]; then
	mv ~/.Xresources ~/.Xresources.backup
fi

# bash
ln -s dotfiles/bash.d .bash.d
ln -s dotfiles/bashrc .bashrc
ln -s dotfiles/bash_profile .bash_profile
ln -s dotfiles/sshconfig .ssh/config
# git
ln -s dotfiles/gitconfig .gitconfig
# screen
ln -s dotfiles/screenrc .screenrc
# vim
ln -s dotfiles/vim .vim
ln -s dotfiles/vimrc .vimrc
# xorg
ln -s dotfiles/xinitrc .xinitrc
ln -s dotfiles/Xresources .Xresources
