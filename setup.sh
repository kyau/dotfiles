#!/bin/bash

# Cleans up current home directory before install
clean_homedir() {
    if [ -f "$HOME/.bash_profile" ]; then
        mv ~/.bash_profile ~/.bash_profile.backup
    fi
    if [ -f "$HOME/.bashrc" ]; then
        mv ~/.bashrc ~/.bashrc.backup
    fi
    if [ -f "$HOME/.ssh/config" ]; then
        mv ~/.ssh/config ~/.ssh/config.backup
    fi
    if [ -f "$HOME/.gitconfig" ]; then
        mv ~/.gitconfig ~/.gitconfig.backup
    fi
    if [ -f "$HOME/.screenrc" ]; then
        mv ~/.screenrc ~/.screenrc.backup
    fi
    if [ -d "$HOME/.vim" ]; then
        mv ~/.vim ~/.vim.backup
    fi
    if [ -f "$HOME/.vimrc" ]; then
        mv ~/.vimrc ~/.vimrc.backup
    fi
    if [ -f "$HOME/.xinitrc" ]; then
        mv ~/.xinitrc ~/.xinitrc.backup
    fi
    if [ -f "$HOME/.Xresources" ]; then
        mv ~/.Xresources ~/.Xresources.backup
    fi
    # Make sure all directories already exist
    if [ ! -d "$HOME/.ssh" ]; then
        mkdir -p $HOME/.ssh/
    fi
    if [ ! -d "$HOME/.ncmpcpp" ]; then
        mkdir -p $HOME/.ncmpcpp/
    fi
    if [ ! -d "$HOME/.config/ckb" ]; then
        mkdir -p ~/.config/ckb/
    fi
    if [ ! -d "$HOME/.config/htop" ]; then
        mkdir -p ~/.config/htop/
    fi
    if [ ! -d "$HOME/.config/i3" ]; then
        mkdir -p ~/.config/i3/
    fi
    if [ ! -d "$HOME/.config/mpv" ]; then
        mkdir -p ~/.config/mpv
    fi
    if [ ! -d "$HOME/.config/neofetch" ]; then
        mkdir -p ~/.config/neofetch/
    fi
    if [ ! -d "$HOME/.config/polybar" ]; then
        mkdir -p ~/.config/polybar/
    fi
    if [ ! -d "$HOME/.config/ranger/colorschemes" ]; then
        mkdir -p ~/.config/ranger/colorschemes
    fi
    if [ ! -d "$HOME/.config/vis/colors" ]; then
        mkdir -p ~/.config/vis/colors
    fi
    if [ ! -d "$HOME/.i3/" ]; then
        mkdir -p ~/.i3
    fi
}

# Setup all the symbolic links properly
setup_symlinks() {
    ln -s $HOME/dotfiles/bash.d $HOME/.bash.d
    ln -s $HOME/dotfiles/bashrc $HOME/.bashrc
    ln -s $HOME/dotfiles/bash_profile $HOME/.bash_profile
    ln -s $HOME/dotfiles/sshconfig $HOME/.ssh/config
    ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
    ln -s $HOME/dotfiles/screenrc $HOME/.screenrc
    ln -s $HOME/dotfiles/vim $HOME/.vim
    ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
    ln -s $HOME/dotfiles/xinitrc $HOME/.xinitrc
    ln -s $HOME/dotfiles/Xresources $HOME/.Xresources
    ln -s $HOME/dotfiles/config/ckb/ckb.conf $HOME/.config/ckb/ckb.conf
    ln -s $HOME/dotfiles/config/compton.conf $HOME/.config/compton.conf
    ln -s $HOME/dotfiles/config/htop/htoprc $HOME/.config/htop/htoprc
    ln -s $HOME/dotfiles/config/i3/config $HOME/.config/i3/config
    ln -s $HOME/dotfiles/config/mpv/input.conf $HOME/.config/mpv/input.conf
    ln -s $HOME/dotfiles/config/mpv/motioninterpolation.py $HOME/.config/mpv/motioninterpolation.py
    ln -s $HOME/dotfiles/config/mpv/mpv.conf $HOME/.config/mpv/mpv.conf
    ln -s $HOME/dotfiles/ncmpcpp/config $HOME/.ncmpcpp/config
    ln -s $HOME/dotfiles/config/neofetch/config $HOME/.config/neofetch/config
    ln -s $HOME/dotfiles/config/neofetch/archlinux.png $HOME/.config/neofetch/archlinux.png
    ln -s $HOME/dotfiles/config/polybar/config $HOME/.config/polybar/config
    ln -s $HOME/dotfiles/config/polybar/launch.sh $HOME/.config/polybar/launch.sh
    ln -s $HOME/dotfiles/config/polybar/cpucores.sh $HOME/.config/polybar/cpucores.sh
    ln -s $HOME/dotfiles/config/polybar/tempcores.sh $HOME/.config/polybar/tempcores.sh
    ln -s $HOME/dotfiles/config/ranger/rc.conf $HOME/.config/ranger/rc.conf
    ln -s $HOME/dotfiles/config/ranger/colorschemes/kyau $HOME/.config/ranger/colorschemes/kyau
    ln -s $HOME/dotfiles/config/vis/config $HOME/.config/vis/config
    ln -s $HOME/dotfiles/config/vis/colors/kyau $HOME/.config/vis/colors/kyau
}

main() {
    cd $HOME
    clean_homedir
    setup_symlinks
}
main
