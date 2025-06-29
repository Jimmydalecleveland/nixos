{ pkgs, ... }:

{
  home.username = "jimmyc";
  home.homeDirectory = "/home/jimmyc";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  # Setup and install Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      " Currently not working, as :checkhealth shows "Warning no clipboard tool found" even though we have wl-copy/wl-paste present
      set clipboard=unnamedplus
    '';
  };

  home.packages = [ pkgs.httpie pkgs.wl-clipboard ];
}
