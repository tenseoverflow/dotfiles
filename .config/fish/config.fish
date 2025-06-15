if status is-interactive
    # GPG
    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
    gpg-connect-agent updatestartuptty /bye >/dev/null

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

# settings

set fish_greeting
