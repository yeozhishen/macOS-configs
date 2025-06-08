{
  description = "Zeus nix-darwin system flake";

  inputs = {
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";
    # homebrew stuff
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    # home-manager stuff
    home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs-darwin, home-manager, nix-homebrew, homebrew-core, homebrew-cask}:
  let
      # Necessary for using flakes on this system.
      username = "zeus";
      system = "aarch64-darwin";
      hostname = "zeus";
      useremail = "yeozhishen@gmail.com";
      gituser = "yeozhishen"; 
      specialArgs = 
        inputs
        // {
            inherit username hostname useremail gituser;
        }; 
      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # The platform the configuration will be used on.
      nixpkgs-darwin.hostPlatform = "aarch64-darwin";
    
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

          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users.${username} = import ./home;
          }

          nix-homebrew.darwinModules.nix-homebrew {
            nix-homebrew = {
                # Install Homebrew under the default prefix
                enable = true;
                # User owning the Homebrew prefix
                user = "${username}";
                # Automatically migrate existing Homebrew installations
                taps = {
                    "homebrew/homebrew-core" = homebrew-core;
                    "homebrew/homebrew-cask" = homebrew-cask;
                };
                autoMigrate = true;
                };
            }
        ];
    };
    #formatter
    formatter.${system} = nixpkgs-darwin.legacyPackages.${system}.alejandra;
  };
}
