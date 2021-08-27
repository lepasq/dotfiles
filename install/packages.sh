#!/bin/sh
echo ========= INSTALLING PACKAGES ==========
echo Please enter 'debian' if you are using a debian-based system or enter 'arch' if you are using an arch based system.
read DISTRO


[ "$DISTRO" = "debian" ] && {
    sudo apt-get update -y && sudo apt-get upgrade -y
    sudo apt-get install -y git
    xargs sudo apt-get install <pkglist.txt
}

[ "$DISTRO" = "arch" ] && {
    sudo pacman -Syu
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    sudo pacman -S $(awk '{print $1}'  pkglist.txt)
    exec 9<foreignpkglist.txt
    while read -u9 pkg; do yay -S --needed $pkg; done
}


echo -n "Do you want to install Vim-Plug? (y/n): "
read VIMP
[ "$VIMP" = "y" ] && {
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    nvim :PlugInstall
}



echo -n "Do you want to install oh-my-zsh? (y/n): "
read OMZSH
[ "$OMZSH" = "y" ] && {
    chsh -s /usr/bin/zsh # Change default shell to zsh for current user
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

