disable r
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
source ~/.zprofile
source ~/.apikeys

export UPDATE_ZSH_DAYS=5
export ZSH="/home/addo/.oh-my-zsh"
ZSH_THEME="gozilla"

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

plugins=(docker git zsh-autosuggestions zsh-syntax-highlighting vi-mode sudo autojump tmux)

#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_AUTOCONNECT=false

source $ZSH/oh-my-zsh.sh

#TERM=xterm-256color
TERM=xterm

# Keybindings
bindkey '^[k' up-history
bindkey '^[j' down-history
bindkey '^f' autosuggest-accept


# ZSH startup
ufetch
