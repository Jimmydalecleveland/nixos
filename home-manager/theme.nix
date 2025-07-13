{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
      hash = "sha256-enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
    };

    opacity = {
      terminal = 0.9;
      applications = 0.9;
      popups = 0.95;
    };
  };

  stylix.targets.kitty.enable = true;
  stylix.targets.rofi.enable = true;
  # This is used if you don't set the base16Scheme and it is using genetic algorithm
  # For the colorscheme, but you want to skew it toward dark or light
  # stylix.polarity = "dark";
}
