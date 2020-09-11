[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
source ~/.zprofile

export UPDATE_ZSH_DAYS=5
export ZSH="/home/addo/.oh-my-zsh"

#ZSH_THEME="random"
ZSH_THEME="gozilla"

# Custom command prompt:
#autoload -U colors && colors	# Load colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%b "

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"


plugins=(git zsh-autosuggestions zsh-syntax-highlighting vi-mode sudo)

source $ZSH/oh-my-zsh.sh

TERM=xterm-256color

# Keybindings

bindkey '^[k' up-history
bindkey '^[j' down-history
bindkey '^f' autosuggest-accept

# ZSH startup
ufetch
