{ pkgs, ... }: {
  environment.systemPackages = (import ./lua pkgs)
    ++ (import ./nix pkgs)
    ++ (import ./ocaml pkgs)
    ++ (import ./python pkgs)
    ++ (import ./rust pkgs);
}
