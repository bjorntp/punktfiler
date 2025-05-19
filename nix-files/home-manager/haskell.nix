# haskell.nix
{ config, pkgs, lib, ... }:

{
  # Haskell development tools
  home.packages = with pkgs; [
    ghc
    cabal-install
    stack
    haskell-language-server
    haskellPackages.fourmolu # Code formatter
    haskellPackages.hlint # Linter
  ];

  # Create a per-project development shell template
  home.file.".config/haskell-templates/flake.nix".text = ''
    {
      description = "Haskell development environment";
    
      inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.11";
        flake-utils.url = "github:numtide/flake-utils";
      };
    
      outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system:
          let
            pkgs = nixpkgs.legacyPackages.''${system};
            haskellPackages = pkgs.haskellPackages;
          in
          {
            devShells.default = pkgs.mkShell {
              buildInputs = with pkgs; [
                haskellPackages.ghc
                haskellPackages.cabal-install
                haskellPackages.stack
                haskellPackages.haskell-language-server
                zlib
              ];
              
              shellHook = '''
                echo "🚀 Haskell development environment loaded"
                alias ghci='stack ghci'
              ''';
            };
          });
    }
  '';

  # Create a convenience script to start new Haskell projects
  home.file.".local/bin/haskell-new-project" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      if [ -z "$1" ]; then
        echo "Usage: haskell-new-project <project-name>"
        exit 1
      fi
      
      mkdir -p "$1"
      cd "$1"
      cp ~/.config/haskell-templates/flake.nix .
      
      echo "Initializing flake..."
      nix flake update
      
      echo "Entering development shell..."
      nix develop
      
      echo "Creating Stack project..."
      stack new . --bare
      echo "nix: { pure: true, enable: true }" >> stack.yaml
      
      echo "✅ Project $1 created successfully!"
    '';
  };
}
