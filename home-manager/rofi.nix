{ pkgs, config, ... }:

{
  # programs.rofi.enable = true; # this won't work unless you only install rofi
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "drun";
      sorting-method = "fzf";
      matching = "fuzzy";
    };
  };
}
