# dotfiles

Current dotfiles synced across my systems. Managed by yadm.

Also check out my [infrastructure repo](https://github.com/tenseoverflow/infrastructure) for modest self-hosting goodness.

## Get started

Install the soft.

```
sudo dnf install bat exa dua-cli ripgrep wget2 procs duf sudo-rs neovim fzf
```

Install yadm.

```
curl -fLo /usr/local/bin/yadm https://github.com/yadm-dev/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
```

Clone my dotfiles.

```
yadm clone git@github.com:tenseoverflow/dotfiles.git
```

## What I use

Pretty much the latest Fedora Workstation for my personal computers:

- Desktop (AMD Ryzen 3700x, RTX 2060 Super, ASUS TUF B550, 16gb DDR4), that I dual boot with Windows 11, however I don't use it that much anymore.
- Thinkpad X250 that I've repaired since buying it second-hand.

Also MacOS with ARM chips.

## Soft that I use regularly

I've dumbed down some of my options for the sole reason of not really wanting to constantly maintain stuff.
Pretty happy with the current setup and always refining it for my own liking.

### CLI

- Fish for my shell, does the job. Uses VIM keybindings. Too lazy nowadays to refine ZSH for my own liking.
- Starship for the prompt.
- Neovim with my trying-to-be minimal config.
- GPG, SSH on my yubikey. This includes git signing. Thanks to [ddruh amazing guide](https://github.com/drduh/YubiKey-Guide)!
- bat, exa, dua-cli, ripgrep, wget2, procs, duf, sudo-rs, fzf for cool Rust+ alternatives

### GUI

- VSCode + Cursor for my IDE. With vim emulation.
- Ghostty for my main terminal.
- Firefox with side tabs (and GNOME theme for Linux). Maybe Safari too.
