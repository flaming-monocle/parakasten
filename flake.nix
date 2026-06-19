{
  description = "Flake for parakasten, a python TUI notetaking utility";
  # Perhaps future C support, depending on how Python handles vector math
  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux"; # Adjust if using ARM/Mac
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.python3
        ];
        shellHook = ''
          echo "parakasten dev shell active. Execute with `python main.py`
        '';
      };
    };
}
