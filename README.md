[![NixOS 24.11+](https://img.shields.io/badge/NixOS-24.11%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Buy me a coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-☕-fab387?labelColor=45475a)](https://typovrak.tv/coffee)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac?labelColor=45475a)](https://typovrak.tv/nixos)
[![Discord join us](https://img.shields.io/badge/Discord-Join%20us-74c7ec?labelColor=45475a&logo=discord&logoColor=white)](https://typovrak.tv/discord)

# 👻 NixOS Ghostty

> Declarative NixOS module to deploy Ghostty, a terminal, with Catppuccin mocha green theme, custom CSS and secure per-user config.

## 🧩 Part of the Typovrak NixOS ecosystem

This module is part of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 [github.com/typovrak/nixos](https://github.com/typovrak/nixos)*

> [!CAUTION]
> This module is opinionated, it may **override**, **replace**, or **remove** files and settings **without** prompt. To avoid unexpected changes, **back up** your existing files or **fork** this module to take full control. **Follow this documentation** to avoid any of this problem.

## 📦 Features

- 🔒 **Secure config directory :** Creates ```~/.config/ghostty``` with ```700``` permissions and correct ownership.
- 🎨 **Catppuccin mocha green theme :** Applies the Catppuccin mocha palette and custom CSS to Ghostty’s GTK UI.
- ⚙️ **Config deployment :** Installs ```config``` and ```custom.css``` into the user’s Ghostty config folder with ```600``` permissions.
- 📦 **Ghostty package :** Ensures ```ghostty``` is installed via ```environment.systemPackages```.
- 🔄 **Idempotent :** Cleans and recreates config on each rebuild without removing other user data.
- 💾 **Backup guidance :** Documentation details how to back up any existing ```~/.config/ghostty``` before applying changes.

## 📂 Repository structure

```bash
❯ tree -a -I ".git*"
.
├── config            # ghostty main configuration
├── configuration.nix # module configuration
├── custom.css        # catppuccin mocha green theme file
├── LICENSE.md        # MIT license
└── README.md         # this documentation

1 directory, 5 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/ghostty{,.bak}
```

## ⬇️ Installation

### 🚀 Method 1 : Out-of-the-box

Fetch the module directly in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-ghostty = fetchGit {
    url = "https://github.com/typovrak/nixos-ghostty.git";
    ref = "main";
    rev = "843b4debfbe3c0d4b0cb76a4a000a3d2f6fe6836"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-ghostty}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

### 🍴 Method 2 : Fork

Want to **personalize** this module ?

Fork it and add this custom module in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
let
  nixos-ghostty = fetchGit {
    url = "https://github.com/<YOUR_USERNAME>/nixos-ghostty.git";
    ref = "main";
    rev = "<COMMIT>"; # see below
  };
in {
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-ghostty}/configuration.nix")
  ];
}
```

Get the latest commit hash by executing
```bash
git clone https://github.com/<YOUR_USERNAME>/nixos-ghostty.git &&
cd nixos-ghostty &&
git log -1 --pretty=format:"%H"
```

## 🎬 Usage

Start Ghostty with your custom theme and configuration
```bash
ghostty
```

## 📚 Learn more

- 📘 [Ghostty official GitHub](https://github.com/ghostty-org/ghostty) : Terminal emulator written in Rust and C, GPU-accelerated and minimal.
- 🎨 [Catppuccin theme for Ghostty](https://github.com/catppuccin/ghostty) : Official Catppuccin port with multiple flavors.
- 🐛 [Ghostty issues & support](https://github.com/ghostty-org/ghostty/issues) : Report bugs, read current limitations or follow progress.

## 🌐 Discover my NixOS system portal

Dive into [typovrak.tv/nixos](https://typovrak.tv/nixos) Catppuccin mocha green themed **gateway** to my GitHub and NixOS setup.

Browse **every module**, example and config in a sleek with an interactive interface that feels just like your desktop.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://typovrak.tv/coffee)

## 💬 Join the Typovrak community on Discord 🇫🇷

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
