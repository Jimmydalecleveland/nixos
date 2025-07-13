# NixOS Configuration

## Resources
### NixOS Configurations
[Collection](https://nixos.wiki/wiki/Configuration_Collection)

### Theming
[Rose Pine Kitty](https://github.com/rose-pine/kitty)
[Rose Pine Rofi](https://github.com/rose-pine/rofi)

## Notes
### Stylix
It appears that Stylix needs to be enabled in both `configuration.nix` and `home-manager` (e.g. `home.nix`)
because that comes up often. When I just had it in `home.nix` it failed to build, but having it just in
`configuration.nix` seems to not allow overriding of anything `home-manager` might theme.


