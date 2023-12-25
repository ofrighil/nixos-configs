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
      ./form
      ./ghosts/${hostname}/configuration.nix
      agenix.nixosModules.default
      home-manager.nixosModules.home-manager home
      {
        environment.systemPackages = [ agenix.packages.${system}.default ];
      }
      overlays
    ];
  };
}
