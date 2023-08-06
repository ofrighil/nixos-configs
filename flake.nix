{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    home-manager.url = github:nix-community/home-manager;
    rust-overlay.url = github:oxalica/rust-overlay;
  };

  outputs = { self, nixpkgs, home-manager, rust-overlay, ... }: {
    nixosConfigurations.serval = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./base
        ./form
        ./ghosts/serval/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.users.ofrighil = {
            home.stateVersion = "23.11";
            xdg.enable = true;
            imports = [ ./home ];
          };
        }
	({ pkgs, ... }: {
	  nixpkgs.overlays = [ rust-overlay.overlays.default ];
	  environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
	})
      ];
    };
  };
}
