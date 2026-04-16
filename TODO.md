# TODO

## Waybar: fix left pill spacing
The left pill (workspaces + window) has inconsistent spacing — extra padding on left side when switching workspaces. Right pill (clock, network, audio, mpris, tray) spacing is acceptable. May need to refactor CSS padding strategy or adjust `.modules-left` margins.

## Hyprland: migrate to proper Home Manager module
Currently `hyprland.conf` is managed as a raw file via `xdg.configFile` in `home-manager/home.nix`.
The more idiomatic NixOS approach is to use the `wayland.windowManager.hyprland` Home Manager module,
which lets you write the config in Nix syntax with structured settings and better composability.

- [ ] Replace `xdg.configFile."hypr/hyprland.conf"` with `wayland.windowManager.hyprland.settings` (structured) or `wayland.windowManager.hyprland.extraConfig` (raw string in Nix)
- [ ] Reference: https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.hyprland.enable
