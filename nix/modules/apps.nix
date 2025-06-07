{ pkgs, ...}: {

    environment.systemPackages = with pkgs; [
        git
    ];

    homebrew = {
        enable = true;
        onActivation = {
            autoUpdate = false;
        };
        
        taps = [
            "homebrew/services"
        ];

        brews = [
            "minicom"
            "fzf"
            "yazi"
            "yq"
            "jq"
            "htop"
            "ical-buddy"
            "iproute2mac"
            "poppler"
            "sevenzip"
            "fd"
            "ripgrep"
            "zoxide"
            "resvg"
            "imagemagick"
            "taskell"
        ];

        casks = [
            "font-symbols-only-nerd-font"
            "aerospace"
            "iterm2"
            "aerospace"
            "mac-mouse-fix@2"
            "font-hack-nerd-font"
        ];
    };


}
