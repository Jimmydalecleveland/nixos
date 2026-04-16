{ pkgs, ... }:

{
  home.username = "jimmyc";
  home.homeDirectory = "/home/jimmyc";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  imports = [
    ./theme.nix
    ./rofi.nix
    ./waybar.nix
  ];

  # Git
  programs.git = {
    enable = true;
    settings.user = {
      name = "Jimmy Cleveland";
      email = "jimmydalecleveland@gmail.com";
    };
  };

  # Setup and install Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      " Currently not working, as :checkhealth shows "Warning no clipboard tool found" even though we have wl-copy/wl-paste present
      set clipboard=unnamedplus
    '';
  };

  # Terminal
  programs.kitty = {
    enable = true;
    settings = {
      window_paddig_width = 10;
    };
  };

  # Topbar
  programs.waybar.enable = true;

  # Hyprland config managed as a raw file for now.
  # See TODO.md for migrating to the proper wayland.windowManager.hyprland HM module.
  # Note: monitor names (HDMI-A-1, DP-2) are hardware-specific — update if on new hardware.
  xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;

  home.packages = with pkgs; [
    httpie 
    wl-clipboard # Wayland specific xclip (needed for nvim use system clipboard)
    kitty
  ];
}
