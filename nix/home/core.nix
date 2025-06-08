{pkgs, config,...}: {
    programs = {
        zsh = {
            enable = true;
            oh-my-zsh = {
                enable = true;
                theme  = "agnoster";
            };
        };
      };
      home.file.".tmux.conf".source = ../../tmux/tmux.conf;

}
