{ pkgs, ... }:

{
  home.username = "jimmyc";
  home.homeDirectory = "/home/jimmyc";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  imports = [
    ./theme.nix
  ];

  # Git
  programs.git = {
    enable = true;
    userName = "Jimmy Cleveland";
    userEmail = "jimmydalecleveland@gmail.com";
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

  home.packages = with pkgs; [
    httpie 
    wl-clipboard # Wayland specific xclip (needed for nvim use system clipboard)
    kitty
    rofi-wayland
  ];
}
