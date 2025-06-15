if status is-interactive
    set -U fish_greeting ""

    # XDG stuff
    export XDG_DATA_HOME="$HOME"/.local/share
    export XDG_CACHE_HOME="$HOME"/.cache
    export XDG_CONFIG_HOME="$HOME"/.config
    export XDG_STATE_HOME="$HOME"/.local/state

    # xrdb merge .dwm/.Xresources

    # vi bindings
    fish_vi_key_bindings

    # aliases
    source ~/.config/alias.fish

    # env
    source ~/.config/fish/env.fish

    complete -f -c dotnet -a "(dotnet complete (commandline -cp))"

    # GPG
    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
    gpg-connect-agent updatestartuptty /bye >/dev/null

    # fetch
    pfetch

    # starship prompt
    starship init fish | source

    zoxide init fish | source
end

# fish's vi mode and alacritty doesn't go well together :(
set fish_cursor_default block
set fish_cursosr_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

function fish_mode_prompt
    switch $fish_bind_mode
        case default
            echo -en "\e[2 q"
        case insert
            echo -en "\e[6 q"
        case replace_one
            echo -en "\e[4 q"
        case visual
            echo -en "\e[2 q"
        case '*'
            echo -en "\e[2 q"
    end
end
