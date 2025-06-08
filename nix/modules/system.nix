{ pkgs, username, ...}:
{
    system = {
        stateVersion = 5;
        primaryUser = username; 
        defaults = {
            menuExtraClock.Show24Hour = true;
            
            dock = {
                autohide = true;
                show-recents = false;
            };

            finder = {
                _FXShowPosixPathInTitle = true; # show full path in finder title
                AppleShowAllExtensions = true; # show all file extensions
                FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
                QuitMenuItem = true; # enable quit menu item
                ShowPathbar = true; # show path bar
                ShowStatusBar = true; # show status bar
            };

            trackpad = {
                Clicking = true;  # enable tap to click
                TrackpadRightClick = true;  # enable two finger right click
                TrackpadThreeFingerDrag = true;  # enable three finger drag
            };

            NSGlobalDomain = {
                "com.apple.swipescrolldirection" = false;  # enable natural scrolling (default to true)
                AppleInterfaceStyle = "Dark";  # dark mode

                InitialKeyRepeat = 15;  # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
                # sets how fast it repeats once it starts.
                KeyRepeat = 3;  # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

                NSAutomaticCapitalizationEnabled = true;  # disable auto capitalization
                NSAutomaticDashSubstitutionEnabled = true;  # disable auto dash substitution
                NSAutomaticPeriodSubstitutionEnabled = false;  # disable auto period substitution
                 NSAutomaticQuoteSubstitutionEnabled = false;  # disable auto quote substitution
                NSAutomaticSpellingCorrectionEnabled = false;  # disable auto spelling correction
                NSNavPanelExpandedStateForSaveMode = true;  # expand save panel by default
                NSNavPanelExpandedStateForSaveMode2 = true;
            };

            CustomUserPreferences = {
                NSGlobalDomain = {
                    # Add a context menu item for showing the Web Inspector in web views
                    WebKitDeveloperExtras = true;
                };
                "com.apple.finder" = {
                    ShowExternalHardDrivesOnDesktop = true;
                    ShowHardDrivesOnDesktop = true;
                    ShowMountedServersOnDesktop = true;
                    ShowRemovableMediaOnDesktop = true;
                    _FXSortFoldersFirst = true;
                    # When performing a search, search the current folder by default
                    FXDefaultSearchScope = "SCcf";
                };
                "com.apple.desktopservices" = {
                    # Avoid creating .DS_Store files on network or USB volumes
                    DSDontWriteNetworkStores = true;
                    DSDontWriteUSBStores = true;
                };
                "com.apple.WindowManager" = {
                    EnableStandardClickToShowDesktop = 0; # Click wallpaper to reveal desktop
                    StandardHideDesktopIcons = 0; # Show items on desktop
                    HideDesktop = 0; # Do not hide items on desktop & stage manager
                    StageManagerHideWidgets = 0;
                    StandardHideWidgets = 0;
                };
                "com.apple.screensaver" = {
                    # Require password immediately after sleep or screen saver begins
                    askForPassword = 1;
                    askForPasswordDelay = 0;
                };
                "com.apple.screencapture" = {
                    location = "~/Pictures";
                    type = "png";
                };
            };
        };
    };
    security.pam.services.sudo_local.touchIdAuth = true; 
    programs.zsh = {
        enable = true;
    };
    time.timeZone = "Asia/Singapore";
    fonts = {
        packages = with pkgs; [
            material-design-icons
            font-awesome
            nerd-fonts.symbols-only
            nerd-fonts.fira-code
            nerd-fonts.jetbrains-mono
            nerd-fonts.iosevka
        ];
    };
}
