# 👻 NixOS Ghostty

> Declarative NixOS module to deploy Ghostty, a terminal, with Catppuccin mocha green theme, custom CSS and secure per-user config.

## 📦 Features

- 🔒 **Secure config directory :** Creates ```~/.config/ghostty``` with ```700``` permissions and correct ownership.

- 🎨 **Catppuccin mocha green theme :** Applies the Catppuccin mocha palette and custom CSS to Ghostty’s GTK UI.

- ⚙️ **Config deployment :** Installs ```config``` and ```custom.css``` into the user’s Ghostty config folder with ```600``` permissions.

- 📦 **Ghostty package :** Ensures ```ghostty``` is installed via ```environment.systemPackages```.

- 🔄 **Idempotent :** Cleans and recreates config on each rebuild without removing other user data.

- 💾 **Backup guidance :** Documentation details how to back up any existing ```~/.config/ghostty``` before applying changes.

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

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
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

## 🎬 Usage

Start Ghostty with your custom theme and configuration
```bash
ghostty
```

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
