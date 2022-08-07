<div align="center">

### :house:

</div>

## Overview

This repository contains my dotfiles (those that can be safely shared).
Dotfiles are managed with [dotref](https://github.com/ovk/dotref) tool,
which is a simple Python tool that I created to help me manage dotfiles for multiple devices.

**Important:** please note, that many dotfiles in this repo require software to be on the most
recent versions. While this is usually not a problem for Arch based distros, it may not work
for distros that contain outdated software by default (like Debian or Ubuntu).

## Included configuration

### Basic tools

The `base` profile includes configurations for the most essential tools:

- [Fish](https://fishshell.com/) - smart and user-friendly command line shell
- [Neovim](https://neovim.io/) - hyperextensible Vim-based text editor
- [Vifm](https://vifm.info/) - file manager with curses interface, which provides Vim-like environment for managing objects within file systems
- [Git](https://git-scm.com/) - distributed version control system
- [Tig](https://jonas.github.io/tig/) - text-mode interface for Git
- [Tmux](https://github.com/tmux/tmux) - terminal multiplexor
- [Htop](https://htop.dev/) - interactive process viewer

### Desktop

The `desktop` profile builds on top of the `base` profile and contains configuration
for the desktop environment based on Sway:

- [Foot](https://codeberg.org/dnkl/foot) - fast, lightweight and minimalistic Wayland terminal emulator
- [Sway](https://swaywm.org/) - tiling Wayland compositor
- [Waybar](https://github.com/Alexays/Waybar) - highly customizable Wayland bar for Sway and Wlroots based compositors
- [Wofi](https://hg.sr.ht/~scoopta/wofi) - launcher/menu program for Wlroots based Wayland compositors such as Sway
- [Swaylock](https://github.com/swaywm/swaylock) - screen locker for Wayland
- [Mako](https://github.com/emersion/mako) - lightweight Wayland notification daemon
- [Imv](https://sr.ht/~exec64/imv/) - command line image viewer intended for use with tiling window managers
- [Newsboat](https://newsboat.org/) - RSS/Atom feed reader for the text console

Please note, that this repository only contains user dotfiles and system config files
(such as, for example, for login manager) are not part of this repo.

#### Fonts and themes

Graphical environment is configured to use [Noto](https://fonts.google.com/noto) fonts,
while terminal uses [Ubuntu](https://design.ubuntu.com/font/) font.
[Nerd Fonts](https://www.nerdfonts.com/) used for icons.

Dotfiles also include configuration for Qt and GTK themes.
Arc is used at the main theme and Papirus as the icon theme.

## XDG

Where possible, dotfiles follow [XDG Base Directory specification](https://wiki.archlinux.org/title/XDG_Base_Directory).
[xdg-ninja](https://github.com/b3nj5m1n/xdg-ninja) is a great tool that can help to detect and move
config files from home directory to appropriate XDG directory.

Dotfiles in this repository assume that all XDG user directories are at their default locations.

## Environment

Making sure that user environment variables are consistent across all login sessions is notoriously
difficult in Linux (see [this](https://mywiki.wooledge.org/DotFiles) great article for a short overview).
Even more so, after `pam_environment` deprecation.

In this repository, all user environment variables are configured in `~/.profile` file.
While this file is read by most login managers (e.g. Greetd, which is what I use) and POSIX shells (such as bash),
fish shell doesn't read it.
As a workaround, `config.fish` runs this file in a bash login session and imports additional
environment. See `import_posix_env ` function in the `fish/functions/import_posix_env .fish` file.
This is only done if environment variables from the `~/.profile` weren't already imported (e.g. by login manager).

## How to use

See [dotref](https://github.com/ovk/dotref) page for the complete documentation on
how to use Dotref for dotfile management.
The easiest way to start is to clone this repository somewhere, select `base` profile and apply it
to the system.

Clone the dotfiles repository:

```
git clone --depth 1 https://github.com/ovk/dotfiles
cd dotfiles
```

Check Dotref profiles list with `dotref profiles` and select `base` profile:

```
dotref init -p base
```

See what will be changed with `dotref status` command, and if it looks sane,
apply the dotfiles:

```
dotref sync
```

Please note, that if there are any conflicts (i.e. you already have a config file which should otherwise
be overwritten by dotref) you have to resolve them manually, for example, by backing up and
removing conflicting config files.

