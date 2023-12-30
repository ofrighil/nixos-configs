inputs: with inputs; {
  mkSystem = { system, username, hostname }: let
    overlays = {
      nixpkgs.overlays = [ rust-overlay.overlays.default ];
    };

    home = {
        home-manager.users.${username} = {
        home.stateVersion = "23.11";
        xdg.enable = true;
        imports = [ ./home ];
      };
    };
  in nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      {
        environment.systemPackages = [ agenix.packages.${system}.default ];
      }
      agenix.nixosModules.default
      (import ./ghosts/base.nix { inherit username hostname; })
      ./ghosts/${hostname}/configuration.nix
      ./modules/form
      ./modules/languages
      ./modules/services
      home-manager.nixosModules.home-manager home
      overlays
    ];
  };
}
