# Personal configs for macos

# Applications
- tmux
- yazi
- ohmyzsh with plugins and icons installed
- fzf (add entry in zshrc)
- aerospace
- sketchybar
- mac-mouse-fix@2 (to remap mouse buttons to work on mac)
## TMUX
- dependencies
- tmux plugin manager (tpm)
- dracula

## SKETCHYBAR
- enable system setting "Displays have separate Spaces" 
- System Settings -> Desktop & Dock -> Displays have separate Spaces.
- download ical-buddy from brew

# NIX
To load most of the system configs, install nix-darwin by following [https://github.com/nix-darwin/nix-darwin]
, and run
```
sudo darwin-rebuild switch --flake .#zeus
```
