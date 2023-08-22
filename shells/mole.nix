{ pkgs ? import <nixpkgs> {}}: pkgs.mkShell {
  buildInputs = with pkgs; [
    pkg-config openssl
  ];

  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.openssl.out}/lib:$LD_LIBRARY_PATH
  '';
}
