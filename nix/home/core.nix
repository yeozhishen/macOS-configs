{pkgs, ...}: {
    programs = {
        zsh = {
            enable = true;
            enableCompletion = true;
            oh-my-zsh = {
                enable = true;
                theme  = "agnoster";
            };
        };
        starship.enable = true;
        fzf.enable = true;

    };
}
