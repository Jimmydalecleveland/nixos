{ pkgs, ... }:

{
  home.username = "jimmyc";
  home.homeDirectory = "/home/jimmyc";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  home.packages = [ pkgs.httpie ];
}
