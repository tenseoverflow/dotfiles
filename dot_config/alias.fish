# exa
alias l='exa -lahF --git --color=always --icons --sort=size --group-directories-first'
alias la='exa -lahF --git --color=always --icons --sort=size --group-directories-first'
alias ls='exa -lhF --git --color=always --icons --sort=size --group-directories-first'
alias lst='exa -lahFT --git --color=always --icons --sort=size --group-directories-first'

# if you have doas
alias sudo='sudo-rs'
alias su='su-rs'

# just command things
alias cat='bat'
alias vim='nvim'
alias du='dua i'
alias grep='rg --no-ignore --hidden'
alias wget='wget2 --hsts-file=~/.local/share/wget/.wget-hsts'
alias mbsync='mbsync -c ~/.config/isync/mbsyncrc'
alias sxiv='nsxiv'
alias ps='procs'
alias find='fd --type file --follow --hidden --color=always'
alias br='broot -sdp'
alias ping='gping'
alias df='duf'
alias dig='doggo'

# dotfiles management
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# random (some aren't really needed)
alias matrix='unimatrix -f -l ocCgGkS -s 96'
alias clock='tty-clock -sct -C 4'
alias pipes='pipes -p 5 -R -t 1 -r 0'
alias btrfortune='fortune -a -s | head -n 1 | figlet | lolcat'
alias fortunecow='fortune -a -s | head -n 1 | cowsay | lolcat'
alias dnsinfo='dig +noall +answer +additional $argv[1] @dns.toys'

# GPG yubikey
alias resetgpg='gpg-connect-agent killagent /bye; gpg-connect-agent updatestartuptty /bye -q; gpg-connect-agent /bye'
alias different-yubi='gpg-connect-agent "scd setialno" "learn --force" /bye'
