#!/bin/bash
cd ~
rm -rf ~/.bash_profile ~/.bashrc
ln -s conf/gitconfig .gitconfig
ln -s conf/bash.d .bash.d
ln -s conf/bashrc .bashrc
ln -s conf/bash_profile .bash_profile
ln -s conf/screenrc .screenrc
ln -s conf/vim .vim
ln -s conf/vimrc .vimrc
ln -s conf/sshconfig .ssh/config
