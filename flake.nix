{
  description = "NixOS Dev Machine";

  # Most of the following config defaults come from the docs here:
  # nix-community.github.io/home-manager/index.xhtml#sec-flakes-nixos-module
  # (the Flakes -> NixOS module section)
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    # Home manager config (using property assignment example)
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Stylix for system theming (using object config example)
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, ... }: {
    nixosConfigurations = {
      # Example shows `hostname` but I'm using the default `sudo nix-rebuild switch` command
      # which appears to use the default `nixos` from the install
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  stylix.nixosModules.stylix
          ./configuration.nix
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.jimmyc = import ./home-manager/home.nix;
	    
	    # Optionally, use home-manager.extraSpecialArgs to pass
	    # arguments to home.nix
	  }
        ];
      };
    };
  };
}
