# Lines configured by zsh-newuser-install
HISTFILE=~/.local/state/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
unsetopt beep
bindkey -v
zstyle :compinstall filename '~/.config/zsh/.zshrc'

# Xorg Keyboard
# setxkbmap -option caps:escape
# setxkbmap ee # Change this

#xrdb merge .dwm/.Xresources

# Aliases
source ~/.config/alias.fish

# GPG Yubikey issues
# source "$HOME"/.local/share/zsh/plugins/gpg.zsh

# Pfetch & Starship
pfetch
eval "$(starship init zsh)"

# Plugins
# source "$HOME"/.local/share/zsh/plugins/zsh-defer/zsh-defer.plugin.zsh
source "$HOME"/.local/share/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
# source "$HOME"/.local/share/zsh/plugins/zsh-more-completions/zsh-more-completions.plugin.zsh
fpath=(~/.local/share/git-completion/zsh $fpath)
fpath=(/home/hen/.config/zsh/completions $fpath)
source "$HOME"/.local/share/zsh/plugins/git-completion/git-prompt.sh

## Compinit in the middle of plugins because of fzf-tab
# compinit -C #-d "$XDG_CACHE_HOME"/zsh/zcompdump # (slow on start if -d set, don't know why)
# zstyle ':completion:\*' matcher-list 'm:{a-z}={A-Za-z}'

source "$HOME"/.local/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
  ## fzf-tab settings
  zstyle ':completion:*:git-checkout:*' sort false
  zstyle ':completion:*:descriptions' format '[%d]'
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
  zstyle ':fzf-tab:*' switch-group ',' '.'
  ### give a preview of commandline arguments when completing `kill`
  #zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
  #zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview [[ $GROUP == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
  #zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
  ### systemd preview
  zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
  ### even more previews!!!
  zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
  export LESSOPEN='|~/.config/lessfilter %s'
  ### env preview
  zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
  ### git preview
  zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
  zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
  zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
  zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
  	'case "$group" in
  	"commit tag") git show --color=always $word ;;
  	*) git show --color=always $word | delta ;;
  	esac'
  zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
  	'case "$group" in
  	"modified file") git diff $word | delta ;;
  	"recent commit object name") git show --color=always $word | delta ;;
  	*) git log --color=always $word ;;
  	esac'
  ### tldr preview
  zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'
  ### man preview
  zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
  zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'

source "$HOME"/.local/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source "$HOME"/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$HOME"/.local/share/zsh/plugins/zsh-autoenv/autoenv.zsh
source "$HOME"/.local/share/zsh/plugins/zsh-autopair/autopair.zsh
autopair-init
# zsh-abbr
source "$HOME"/.local/share/zsh/plugins/zsh-abbr/zsh-abbr.zsh
source "$HOME"/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source "$HOME"/.config/zsh/_deno
#source "$HOME"/.config/zsh/completions/_zsh
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/hen/.config/zsh/.zshrc'


eval "$(zoxide init zsh)"

autoload -Uz compinit
compinit -C
# End of lines added by compinstall

# bun completions
[ -s "/home/hen/.bun/_bun" ] && source "/home/hen/.bun/_bun"
