{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    agenix.url = github:ryantm/agenix;
    home-manager.url = github:nix-community/home-manager;
    rust-overlay.url = github:oxalica/rust-overlay;
  };

  outputs = { self, nixpkgs, agenix, home-manager, rust-overlay, ... }: {
    nixosConfigurations.serval = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./form
        ./ghosts/serval/configuration.nix
        agenix.nixosModules.default
        home-manager.nixosModules.home-manager {
          home-manager.users.ofrighil = {
            home.stateVersion = "23.11";
            xdg.enable = true;
            imports = [ ./home ];
          };
        }
        {
           environment.systemPackages = [ agenix.packages."x86_64-linux".default ];
        }
	    ({ pkgs, ... }: {
	      nixpkgs.overlays = [ rust-overlay.overlays.default ];
	      environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
	    })
      ];
    };
  };
}
