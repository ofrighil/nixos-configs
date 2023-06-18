{
  inputs.nixpkgs.url = github:NixOS/nixpkgs;
  inputs.home-manager.url = github:nix-community/home-manager;

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.ofrighil = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./configuration.nix
	home-manager.nixosModules.home-manager {
	  home-manager.users.ofrighil = import ./home.nix;
	}
      ];
    };
  };
}
