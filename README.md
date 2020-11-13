![./dotfiles](images/logo.png)  

## Setup
- **Distro**                       : [Arch Linux](https://www.archlinux.org/) :computer: Rolling-release distribution
- **WM**                           : [i3](https://i3wm.org/) Tiling window manager for X11
- **Bar**                          : [i3status-rust](https://github.com/greshake/i3status-rust) :crab: i3status replacement written in Rust!
- **Shell**                        : [Zsh](https://wiki.archlinux.org/index.php/zsh) :shell: with [oh my zsh](https://github.com/ohmyzsh/ohmyzsh) framework!
- **Terminal**                     : [Alacritty](https://github.com/alacritty/alacritty) :crab: GPU-accalerated terminal in Rust!
- **Text Editor**                  : [NeoVim](https://neovim.io/) Hyperextensible Vim-based text editor
- **Music Player**                 : [Spicetify](https://github.com/khanhas/spicetify-cli) :notes: Customizable Spotify Client
- **Notify Daemon**                : [Dunst](https://wiki.archlinux.org/index.php/Dunst) :leaves: minimalism!
- **Application Launcher**         : [Dmenu](https://tools.suckless.org/dmenu/) :rocket: dynamic menu by suckless.org
- **File Manager**                 : [Ranger](https://wiki.archlinux.org/index.php/ranger) :bookmark: text-based file manager in python
- **PDF Reader**                   : [Zathura](https://wiki.archlinux.org/index.php/zathura) :green_book: minimal pdf-reader with vi keybindings
- **Browser**                      : [Firefox](https://wiki.archlinux.org/index.php/firefox) :fox_face: customized css!

## Dependencies
  <details>
  <summary>Arch Linux</summary>

  > Make sure your **AUR Helper** is *yay*.
  
  - ```bash
    yay -S i3 # will follow soon
    ```
  </details>

  <details>
  <summary>Debian/Ubuntu</summary>
  
  - ```bash
    sudo apt-get install firefox # will follow soon
    ```
  </details>


## Installation
### Script
Warning: This will wipe out your current configurations for the programs above.  
**DO NOT** run `install.sh` without knowing what it does! Use at your own risk.

```sh
curl -LO github.com/lepasq/dotfiles/blob/master/install.sh
```

The installation script will:
* Download the dotfiles repository
* Wipeout some directories inside `.config/` and `.local/bin/`
* Create symlinks to my configuration files
* Install Vim Plug
* Install oh-my-zsh
* Configure git config


### Manual Installation
  <details>
  <summary>oh-my-zsh & plugins</summary>
  
  - ```bash
    chsh -s /usr/bin/zsh # Change default shell to zsh for current user
    ```
  - ```bash
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    ```
  - ```bash
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
  - ```bash
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
  </details>

<details>
  <summary><strong>Most of the files</strong></summary>
  
   You can clone or download it as a zip. After that put all files in the **dotfiles** folder to user's home directory or ( **~** ).
   - ```bash
     git clone https://github.com/owl4ce/dotfiles.git
     ```
   - ```bash
     cd dotfiles/ && cp -r {.*,*} ~/
     ```
   - ```bash
     rm -r ~/{README.md,LICENSE,.git} # Delete unnecessary files
     ```
   
  </details>

<details>
  <summary>.gitconfig</summary>

  You can manually edit the email and username field inside `.gitconfig`, or instead you can run the following, replacing `username` and `usermail` with their actual values.
   - ```bash
     git config --global user.name "username"
     ```
   - ```bash
     git config --global user.email "usermail"
     ```
  </details>
  
<details>
  <summary>NeoVim</summary>

  First you have to install the Plugin Manager Vim-Plug.
   - ```bash
     sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
     ```
   Then inside NeoVim, run:
   - ```
     :PlugInstall
     ```
  </details>

