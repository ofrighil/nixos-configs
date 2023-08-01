{
  inputs.nixpkgs.url = github:NixOS/nixpkgs;
  inputs.home-manager.url = github:nix-community/home-manager;

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.serval = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./form
        ./ghosts/serval/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.users.ofrighil = {
            home.stateVersion = "23.11";
            xdg.enable = true;
            imports = [ ./home ];
          };
        }
	#({ pkgs, ... }: {
	#  users.defaultUserShell = pkgs.zsh;
	#  environment.shells = [ pkgs.zsh ];
	#})
      ];
    };
  };
}
