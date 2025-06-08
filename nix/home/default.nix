{ username, ...}: {
    imports = [
        ./core.nix
        ./git.nix
        ./shell.nix
    ];
    home = {
        username = username;
        homeDirectory = "/Users/${username}";
        stateVersion = "25.05";
    };
    programs.home-manager.enable = true;

}
