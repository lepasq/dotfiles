#!/bin/sh
git clone https://github.com/lepasq/dotfiles.git
cd dotfiles
path=$(pwd)


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
source $HOME/.config/aliasrc


# Home directory
ln -sf $path/.gitconfig $HOME/.gitconfig
ln -sf $path/.tmux.conf $HOME/.tmux.conf
ln -sf $path/.xprofile $HOME/.xprofile
ln -sf $path/.zprofile $HOME/.zprofile
ln -sf $path/.zshrc $HOME/.zshrc


# Local directory
[ ! -d $HOME/.local ] && mkdir -p $HOME/.local/share

[ -d $HOME/.local/bin ] && rm -r $HOME/.local/bin
ln -sf $path/.local/bin $HOME/.local/bin


# Install Vim-Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install oh-my-zsh and zsh plugins
chsh -s /usr/bin/zsh # Change default shell to zsh for current user
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# Gitconfig
echo "Please enter your GitHub username."
read GIT_USER
echo "Please enter your GitHub email address."
read GIT_MAIL

git config --global user.name "$(GIT_USER)"
git config --global user.email "$(GIT_MAIL)"
