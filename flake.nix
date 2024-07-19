{
  description = "algs4 working environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.algs4 = pkgs.callPackage ./default.nix {};

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          openjdk11_headless
          checkstyle
          git
          self.packages.${system}.algs4
        ];

        shellHook = ''
          echo "Welcome to the algs4 development shell"
        '';
      };
    };
}
