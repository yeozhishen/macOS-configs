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
    };
}
