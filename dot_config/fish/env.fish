# Cargo
set -U fish_user_paths $fish_user_paths $HOME/.local/share/cargo/bin
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PATH="~/.local/share/cargo/bin:$PATH"
export PATH="~/.local/bin:$PATH"

# Go
export GOPATH="$XDG_DATA_HOME"/go

# GPG
export GPG_TTY="$(tty)"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# NPM
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# Ruby
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME"/solargraph

# FZF
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Deno
export DENO_INSTALL="$XDG_DATA_HOME"/deno
export DENO_INSTALL_ROOT="$HOME"/.local/bin/deno
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin/deno:$PATH"

# Bun
export BUN_INSTALL="$XDG_DATA_HOME"/bun
export PATH="$BUN_INSTALL/bin:$PATH"

# Ansible
export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"

# Python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"

# Defaults
export editor=nvim
export EDITOR=nvim
