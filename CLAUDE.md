# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## System Overview

This is a NixOS configuration using flakes with Home Manager for a personal development machine. The setup includes:

- **Dual Desktop Environment**: KDE Plasma 6 (primary) + Hyprland (tiling WM)
- **Theming**: Stylix with Rose Pine colorscheme for unified system theming
- **Key Applications**: Kitty terminal, Neovim, Rofi launcher, Waybar
- **Wallpaper Management**: SWWW for dynamic wallpapers

## Architecture

### Core Configuration Files
- `flake.nix`: Main flake definition with inputs and outputs
- `configuration.nix`: System-level NixOS configuration
- `hardware-configuration.nix`: Hardware-specific settings (auto-generated)
- `home-manager/home.nix`: User-level configuration via Home Manager
- `home-manager/theme.nix`: Stylix theming configuration
- `home-manager/rofi.nix`: Rofi launcher configuration

### Flake Structure
The flake defines a single NixOS configuration named `nixos` that includes:
- NixOS system configuration
- Home Manager as a NixOS module
- Stylix theming applied at the Home Manager level
- SWWW wallpaper daemon integration

## Development Commands

### System Management
```bash
# Rebuild and switch to new configuration
sudo nixos-rebuild switch

# Test configuration without switching
sudo nixos-rebuild test

# Update flake inputs
nix flake update

# Check flake syntax
nix flake check
```

### Development Tools
```bash
# Search for packages
nix search nixpkgs <package_name>

# Enter development shell with specific packages
nix shell nixpkgs#<package_name>

# Show system configuration
nixos-option <option_path>
```

## Key Configuration Patterns

### Adding System Packages
Add to `environment.systemPackages` in `configuration.nix` for system-wide packages:
```nix
environment.systemPackages = with pkgs; [
  package-name
];
```

### Adding User Packages
Add to `home.packages` in `home-manager/home.nix` for user-specific packages:
```nix
home.packages = with pkgs; [
  package-name
];
```

### Theming with Stylix
- Theming is configured in `home-manager/theme.nix`
- Uses Rose Pine colorscheme from base16-schemes
- Applied to kitty and rofi via stylix targets
- Opacity settings configured for terminals, applications, and popups

### Home Manager Backup
The configuration sets `home-manager.backupFileExtension = "backup"` to handle file conflicts when Stylix overwrites existing configurations.

## Important Notes

### Stylix Integration
As noted in README.md, Stylix requires careful coordination between system and Home Manager configurations. Currently enabled only at the Home Manager level to avoid conflicts.

### Kanata Key Remapping
The system includes Kanata service for key remapping (Caps Lock → Escape). Configuration is embedded directly in `configuration.nix`.

### Wayland Ecosystem
The configuration is primarily Wayland-focused with:
- rofi-wayland for application launching
- wl-clipboard for clipboard functionality
- Hyprland as secondary window manager