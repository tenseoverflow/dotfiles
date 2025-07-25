# dotfiles

Current dotfiles synced across my systems. Managed by yadm.

## Get started

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

- Desktop (AMD Ryzen 3700x, RTX 2060 Super, ASUS TUF B550, 16gb DDR4), that I dual boot with Windows 11, however I don't use it that much anymore
- Thinkpad X250 that I've repaired since buying it second-hand

## Soft that I use regularly

I've dumbed down some of my options for the sole reason of not really wanting to constantly maintain stuff.
Pretty happy with the current setup and always refining it for my own liking.

- Fish for my shell, does the job. Too lazy nowadays to refine ZSH for my own liking.
- Starship for the prompt. Was my first custom and still using it.
- Neovim, which I've set up with [Lazyvim](https://github.com/LazyVim/LazyVim). \
The name implies why I'm using Folke's great package manager paired with his neovim template. At some point I was using Neovim as my main editor and I needed some of the flashy plugins + LSP support. Honestly I should probably start my own minimalistic config as I now use
- VSCode for my IDE. With vim emulation.
- GNOME's Ptyxis for my terminal. Also testing out Warp.
- Firefox with side tabs. Can't be bothered to use something else honestly.
- GPG, SSH on my yubikey. Thanks to [ddruh amazing guide](https://github.com/drduh/YubiKey-Guide)!

Also check out my [infrastructure repo](https://github.com/tenseoverflow/infrastructure) for modest self-hosting goodness.
