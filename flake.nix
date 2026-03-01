{
  description = "An empty flake template that you can adapt to your own environment";

  # Flake inputs
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0"; # Stable Nixpkgs (use 0.1 for unstable)
    systems.url = "github:nix-systems/default";
  };

  # Flake outputs
  outputs =
    { self, ... }@inputs:
    let
      # Helper for providing system-specific attributes
      forEachSystem =
        f:
        inputs.nixpkgs.lib.genAttrs (import inputs.systems) (
          system:
          f {
            inherit system;
            # Provides a system-specific, configured Nixpkgs
            pkgs = import inputs.nixpkgs {
              inherit system;
            };
          }
        );
    in
    {
      # Development environments output by this flake

      # To activate the default environment:
      # nix develop
      # Or if you use direnv:
      # direnv allow
      devShells = forEachSystem (
        { pkgs, system }:
        {
          # Run `nix develop` to activate this environment or `direnv allow` if you have direnv installed
          default = pkgs.mkShellNoCC {
            inputsFrom = [ self.packages.${system}.default ];

            # The Nix packages provided in the environment
            packages = with pkgs; [ ];

            # Set any environment variables for your development environment
            env = { };

            # Add any shell logic you want executed when the environment is activated
            shellHook = "";
          };
        }
      );

      packages = forEachSystem (
        { pkgs, system }:
        {
          default = pkgs.stdenvNoCC.mkDerivation {
            name = "no_creeper_griefing.zip";
            src = builtins.path {
              path = ./.;
              name = "no_creeper_griefing-source";
            };
            nativeBuildInputs = with pkgs; [
              gnumake
              zip
            ];
            buildPhase = ''
              make
            '';
            installPhase = ''
              mv no_creeper_griefing.zip $out
            '';
          };
        }
      );
    };
}
