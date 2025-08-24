# exa
alias l='eza -lhF --git --color=always --icons --sort=size --group-directories-first'
alias la='eza -lahF --git --color=always --icons --sort=size --group-directories-first'
alias ls='eza'
alias lst='eza -lahFT --git --color=always --icons --sort=size --group-directories-first'

# if you have doas
#alias sudo='sudo-rs' alias su='su-rs'

# just command things
alias cat='bat'
alias vim='nvim'
alias du='dua i'
alias grep='rg --no-ignore --hidden'
alias wget='wget2 --hsts-file=~/.local/share/wget/.wget-hsts'
alias mbsync='mbsync -c ~/.config/isync/mbsyncrc'
alias ps='procs'
alias df='duf'

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
