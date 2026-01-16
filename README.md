<div align="center">

### :house:

</div>

## Overview

This repository contains my personal dotfiles for Linux.

Dotfiles are managed with [Chezmoi](https://www.chezmoi.io/) tool.
During `init`, there will be prompt for a few variables:

- `email` - Email address used for Git config.
- `gitname` - User name for Git.
- `gitsignkey` - ID of the signing key for Git.
- `desktop` - boolean flag, `true` if this is a desktop machine (so Hyprland and other desktop-related tools will be installed), and `false` for terminal-only.

> **Note**
>
> Many dotfiles in this repo require software to be on the most recent versions.
> While this is usually not a problem for distros like Arch, it may not work
> for distros that contain outdated software by default (like Debian or Ubuntu).

### Screenshots

<img width="1920" height="1080" alt="20260115_19h05m44s_grim" src="https://github.com/user-attachments/assets/72559ae0-e76a-4c87-a29b-83f5c894ca0d" />

<img width="1920" height="1080" alt="nvim" src="https://github.com/user-attachments/assets/7a7994ce-6469-4f7a-8157-dc49736a6f90" />

<img width="1920" height="1080" alt="vifm" src="https://github.com/user-attachments/assets/7a4409b3-9f3e-4f9a-8c31-98a66390326e" />

## Included configuration

### Colors

Overall, the goal was to keep the system pleasant looking but not visually distracting.
So the colors were chosen to be somewhat muted and low-contrast.
In most places, [Catppuccin](https://catppuccin.com/) color theme, or some variation of it, was used (Frappe variant),
while there are a few places that use [Nord-like](https://www.nordtheme.com/) theme.
The exception is GUI applications (GTK, Qt) which deliberately use light color theme (see below).

### Terminal-only tools

Dotfiles for the following tools are installed if the system is not desktop:

- [Fish](https://fishshell.com/) - smart and user-friendly command line shell
- [Neovim](https://neovim.io/) - hyperextensible Vim-based text editor
- [Vifm](https://vifm.info/) - file manager with curses interface, which provides Vim-like environment for managing objects within file systems
- [Git](https://git-scm.com/) - distributed version control system
- [Tig](https://jonas.github.io/tig/) - text-mode interface for Git
- [Tmux](https://github.com/tmux/tmux) - terminal multiplexor
- [Btop](https://github.com/aristocratos/btop) - interactive process viewer
- [GPG](https://www.gnupg.org/) - complete and free implementation of the OpenPGP standard

### Desktop

For desktop, dotfiles for the following tools are additionally installed:

- [Foot](https://codeberg.org/dnkl/foot) - fast, lightweight and minimalistic Wayland terminal emulator
- [Hyprland](https://hypr.land/) - modern compositor with the looks
- [Hyprlock](https://github.com/hyprwm/hyprlock) - simple, yet fast, multi-threaded and GPU-accelerated screen lock for Hyprland
- [Hypridle](https://github.com/hyprwm/hypridle) - Hyprland's idle management daemon
- [Hyprpaper](https://github.com/hyprwm/hyprpaper) - fast, IPC-controlled wallpaper utility for Hyprland
- [Waybar](https://github.com/Alexays/Waybar) - highly customizable Wayland bar for Sway and Wlroots based compositors
- [Fuzzel](https://codeberg.org/dnkl/fuzzel) - app launcher and fuzzy finder for Wayland
- [Satty](https://github.com/Satty-org/Satty) - screenshot annotation tool
- [Swayosd](https://github.com/ErikReider/SwayOSD) - on screen display for keyboard shortcuts like caps-lock and volume
- [UWSM](https://github.com/Vladimir-csp/uwsm) - Universal Wayland Session Manager
- [Wlogout](https://github.com/ArtsyMacaw/wlogout) - a wayland based logout menu
- [Mako](https://github.com/emersion/mako) - lightweight Wayland notification daemon
- [Imv](https://sr.ht/~exec64/imv/) - command line image viewer intended for use with tiling window managers
- [Newsboat](https://newsboat.org/) - RSS/Atom feed reader for the text console

And the following config files are installed:

- Fontconfig
- GTK config and styles
- Kvantum styles
- Qt styles

#### Fonts and themes

Graphical environment is configured to use [Noto](https://fonts.google.com/noto) fonts,
while terminal uses [Ubuntu](https://design.ubuntu.com/font/) font.
[Nerd Fonts](https://www.nerdfonts.com/) used for icons.

For GUI applications, Arc is used at the main theme and Papirus as the icon theme.

#### Login and startup

This setup doesn't use any display manager, and Hyprland is started directly from TTY1 by UWSM.

## XDG

Where possible, dotfiles follow [XDG Base Directory specification](https://wiki.archlinux.org/title/XDG_Base_Directory).
[xdg-ninja](https://github.com/b3nj5m1n/xdg-ninja) is a great tool that can help to detect and move
config files from home directory to appropriate XDG directory.

Dotfiles in this repository assume that all XDG user directories are at their default locations.

## Environment

Making sure that user environment variables are consistent across all login sessions is notoriously
difficult in Linux (see [this](https://mywiki.wooledge.org/DotFiles) great article for a short overview).
Even more so, after `pam_environment` deprecation.

In this repository, all terminal-only (i.e. non-desktop) user environment variables are configured in `~/.profile` file.
While this file is read by most login managers and POSIX shells (such as bash), fish shell doesn't read it.
As a workaround, `config.fish` runs this file in a bash login session and imports additional
environment. See `import_posix_env ` function in the `fish/functions/import_posix_env .fish` file.
This is only done if environment variables from the `~/.profile` weren't already imported (e.g. by login manager).

As for desktop-specific environment variables, they are set by UWSM and configured in `~/.config/uwsm/env` file.

## How to use

Dotfiles can be easily installed with Chezmoi using the following command:

```
chezmoi init --apply https://github.com/ovk/dotfiles.git
```

