#!/bin/sh
git clone https://github.com/lepasq/dotfiles.git
cd dotfiles
path=$(pwd)


# Home directory
ln -sf $path/.gitconfig $HOME/.gitconfig
ln -sf $path/.tmux.conf $HOME/.tmux.conf
ln -sf $path/.xprofile $HOME/.xprofile
ln -sf $path/.zprofile $HOME/.zprofile
ln -sf $path/.zshrc $HOME/.zshrc


# Config directory
[ ! -d $HOME/.config ] && mkdir $HOME/.config

[ -d $HOME/.config/alacritty ] && rm -rf $HOME/.config/alacritty
ln -sf $path/.config/alacritty $HOME/.config/alacritty

[ -d $HOME/.config/dunst ] && rm -rf $HOME/.config/dunst
ln -sf $path/.config/dunst $HOME/.config/dunst

[ -d $HOME/.config/i3 ] && rm -rf $HOME/.config/i3
ln -sf $path/.config/i3 $HOME/.config/i3

[ -d $HOME/.config/neofetch ] && rm -rf $HOME/.config/neofetch
ln -sf $path/.config/neofetch $HOME/.config/neofetch

[ -d $HOME/.config/nvim ] && rm -rf $HOME/.config/nvim
ln -sf $path/.config/nvim $HOME/.config/nvim

[ -d $HOME/.config/polybar ] && rm -rf $HOME/.config/polybar
ln -sf $path/.config/polybar $HOME/.config/polybar

[ -d $HOME/.config/ranger ] && rm -rf $HOME/.config/ranger
ln -sf $path/.config/ranger $HOME/.config/ranger

[ -d $HOME/.config/spicetify ] && rm -rf $HOME/.config/spicetify
ln -sf $path/.config/spicetify $HOME/.config/spicetify

[ -d $HOME/.config/wallpaper ] && rm -rf $HOME/.config/wallpaper
ln -sf $path/.config/wallpaper $HOME/.config/wallpaper

[ -d $HOME/.config/zathura ] && rm -rf $HOME/.config/zathura
ln -sf $path/.config/zathura/ $HOME/.config/zathura/

ln -sf $path/.config/aliasrc $HOME/.config/aliasrc


# Local directory
[ ! -d $HOME/.local ] && mkdir -p $HOME/.local/share

[ -d $HOME/.local/bin ] && rm -r $HOME/.local/bin
ln -sf $path/.local/bin $HOME/.local/bin
