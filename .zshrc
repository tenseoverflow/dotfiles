# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hen/.zshrc'

setxkbmap ee
setxkbmap -option caps:escape

#xrdb merge .dwm/.Xresources

alias btrfortune='fortune -a -s | head -n 1 | figlet | lolcat'
alias fortunecow='fortune -a -s | head -n 1 | cowsay | lolcat'

alias la='exa -lahF --color=always --icons --sort=size --group-directories-first --git'
alias ls='exa -lhF --color=always --icons --sort=size --group-directories-first --git'
alias lst='exa -lahFT --color=always --icons --sort=size --group-directories-first --git'

alias cat='bat'
alias sudo='doas'
alias vim='nvim'
alias du='dust'
alias grep='rg --no-ignore --hidden'
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

autoload -Uz compinit
compinit -C
# End of lines added by compinstall

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

pfetch 
eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh
source /usr/share/zsh/plugins/zsh-more-completions/zsh-more-completions.plugin.zsh
