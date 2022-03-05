[ -f "$HOME/.config/zsh/.zshenv" ] && source "$HOME/.config/zsh/.zshenv"
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
[ -f "$HOME/.config/zsh/keybindings.zsh" ] && source "$HOME/.config/zsh/keybindings.zsh"
[ -f "$HOME/.config/zsh/plugins.zsh" ] && source "$HOME/.config/zsh/plugins.zsh"
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

[ -f "$HOME/.apikeys" ] && source "$HOME/.apikeys"


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

cat ~/.cache/wal/sequences


#[ -z "$TMUX"  ] && { tmux -f ~/.config/tmux/tmux.conf new -s local || exec tmux -f ~/.config/tmux/tmux.conf new -t local && exit }
