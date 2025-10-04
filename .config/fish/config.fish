if status is-interactive
    # GPG
    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent

    abbr -a !! --position anywhere --function last_history_item
    abbr -a !\$ --position anywhere --function last_history_token

    # aliases
    source ~/.config/alias.fish

    complete -f -c dotnet -a "(dotnet complete (commandline -cp))"

    # starship prompt
    starship init fish | source
end

# configs
source "$HOME/.config/fish/conf.d/vim.fish"

# functions
source "$HOME/.config/fish/functions/last_command.fish"
source "$HOME/.config/fish/functions/git_commit_helper.fish"

# settings

set fish_greeting

# uv
fish_add_path "$HOME/.local/bin"

# bun
set --export BUN_INSTALL "$HOME/.local/share/bun"
fish_add_path "$BUN_INSTALL/bin"

# cargo
fish_add_path "$HOME/.local/share/cargo/bin"

# opencode
fish_add_path "$HOME/.opencode/bin"

fish_add_path "/opt/homebrew/opt/ruby/bin"
