# Config files
alias zshconfig="nvim ~/dotfiles/zsh/.config/zsh/"
alias vimconfig="nvim ~/dotfiles/nvim/.config/nvim/"
alias i3config="nvim ~/.config/i3/config"
alias barconfig="nvim ~/.config/polybar/config.ini"


# Misc
alias config='/usr/bin/git --git-dir=$HOME/dotfiles-repo/ --work-tree=$HOME'
alias x="exit"
alias sdn="shutdown -h now"
alias ka="killall"
alias g="git"
alias rm="rm -v"
alias readme="nvim +LivedownPreview README.md"
alias pacman="sudo pacman"
alias i3x="i3-msg exit"
alias .r=". ranger"
alias r="ranger"
alias tmux="tmux -u"
alias mkdir="mkdir -p"
alias df="df -h"

alias ..="cd .."
alias 2.="cd ../../"
alias 3.="cd ../../../"
alias 4.="cd ../../../../"
alias 5.="cd ../../../../../"


# Colored output where possible
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi"


alias vim="nvim"
alias signal="signal --use-tray-icon"
