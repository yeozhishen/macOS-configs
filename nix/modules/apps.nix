{ pkgs, ...}: {

    environment.systemPackages = with pkgs; [
        git
    ];

    homebrew = {
        enable = true;
        onActivation = {
          autoUpdate = true;
          upgrade = true;
        };
        
        taps = [
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
            "sketchybar"
            "yamllint"
            "uv"
        ];

        casks = [
            "font-symbols-only-nerd-font"
            "aerospace"
            "iterm2"
            "aerospace"
            "mac-mouse-fix@2"
            "font-hack-nerd-font"
            "spotify"
            "microsoft-office"
            "zoom"
            "whatsapp"
            "openvpn-connect"
            "mattermost"
          ];

        masApps = {
          "lastpass" = 6504626762;
        };
    };


}
