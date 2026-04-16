{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;

    extraConfig = {
      modi = "drun";
      sorting-method = "fzf";
      matching = "fuzzy";
    };
  };
}
