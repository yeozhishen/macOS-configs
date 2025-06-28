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
          "nikitabobko/tap"
	      "felixKratz/formulae"
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
            "lazygit"
            "btop"
        ];

        casks = [
            "font-symbols-only-nerd-font"
            "iterm2"
            "nikitabobko/tap/aerospace"
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
