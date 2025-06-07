{
  description = "Zeus nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
      # Necessary for using flakes on this system.
      username = "zeus";
      system = "aarch64-darwin";
      hostname = "zeus";
      
      specialArgs = 
        inputs
        // {
            inherit username hostname;
        }; 
      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#zeus
    darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        inherit system specialArgs;
        modules = [ 
          ./modules/nix-core.nix
          ./modules/system.nix
          ./modules/apps.nix

          ./modules/host-users.nix 
        ];
    };
    #formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
