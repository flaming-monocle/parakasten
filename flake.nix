{
  description = "Flake for parakasten, a python TUI notetaking utility";
  # Perhaps future C support, depending on how Python handles vector math

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:nix-community/stylix";
  };

  outputs =
    {
      nixpkgs,
      # lib,
      # config,
      ...
    }:
    let
      system = "x86_64-linux";
      langPython = " Python";
      # TODO Flakes don't recognize config as a valid inclusion,
      # so this breaks and therefore Starship does too
      # inherit (config.lib.stylix) colors;
      # langPython = " (fg:#${colors.base0C})python(fg:#${colors.base09})";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          python3
        ];

        # programs.starship = {
        #   enable = true;
        #   settings = {
        #     add_newline = true;
        #     format = lib.strings.concatStrings [
        #       "(fg:#${colors.base06})" # leader
        #       "${config.home.username}(fg:#${colors.base0B})" # username
        #       "@(fg:#${colors.base06})" # @
        # TODO Flakes don't recognize config as a valid inclusion,
        # so this breaks and therefore Starship does too
        # inherit (config.lib.stylix) colors;
        #       "$hostname(fg:#${colors.base0D})" # hostname
        #       ": (fg:#${colors.base06})" # :
        #       "$directory  (fg:${colors.base0A})" # git directory
        #       "$git_branch (fg:#${colors.base0F})" # git branch
        #       "(| fg:#${colors.base06})"
        #       "(${langPython}fg:#${colors.base0})" # :
        #     ];
        #     directory = {
        #       truncation_length = 1;
        #       truncation_symbol = " ";
        #     };
        #   };
        # };

        shellHook = ''
          echo -e "\nParakasten dev shell\n"
        '';
      };
    };
}
