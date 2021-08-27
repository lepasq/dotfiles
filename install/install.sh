#!/bin/sh
cat << EOF
=========== START =================
You are about to start the install script to install the dotfiles from github.com/lepasq/dotfiles.git.

For the list of packages that you want to install, please have a look at pkglist.txt and if you are runnig Arch Linux, also foreignpkglist.txt.

Warning: this install script will wipe out most of the directories in ~/.config
and all of the files inside ~/.local/bin.
Please make sure to read and understand the install scripts.


EOF


echo -n "Are you sure you want to proceed? (y/n): "
read INSTALL
[ "$INSTALL" = "y" ] && {
    git clone https://github.com/lepasq/dotfiles.git
    cd dotfiles

    #./packages.sh
    #./gitconfig.sh
    #./symlink.sh

    echo "Done!"
}


[ "$INSTALL" != "y" ] && {
    echo Aborting.
}
