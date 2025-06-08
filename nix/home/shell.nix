{...}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        initContent = ''
        # Editor config
        if [[ -n $SSH_CONNECTION ]]; then
            export EDITOR='vim'
        else
            export EDITOR='nvim'
        # Custom function: yazi wrapper
        function y() {
            local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
            yazi "$@" --cwd-file="$tmp"
            if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
                builtin cd -- "$cwd"
            fi
            rm -f -- "$tmp"
        # Battery percentage function (macOS specific)
        function battery_percentage() {
            pmset -g batt | grep -o "[0-9]*%" | head -n 1
        }
        export GIT_EDITOR=vim
        # fzf keybindings
        source <(fzf --zsh)
        # Starship prompt
        eval "$(starship init zsh)"
        '';
    };
}
