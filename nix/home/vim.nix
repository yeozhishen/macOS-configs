{pkgs, ...}: {
  programs.vim = {
    settings = {
      ignorecase = true;
      expandtab = true;
      number = true;
      relativenumber = true;
      tabstop = 4;
    };
    plugins = with pkgs.vimPlugins; [
      ale
      SimpylFold
      python-syntax
    ];
    extraConfig = ''
      syntax on
      set clipboard=unnamed
      " yaml file settings
      let g:indentLine_enabled = 1
      autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
      let g:indentLine_char = '⦙'
      let g:indentLine_color_term = 239
      " Background (Vim, GVim)
      let g:indentLine_bgcolor_term = 146
      let g:indentLine_bgcolor_gui = '#90EE90'
      let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
      let g:ale_sign_error = '✘'
      let g:ale_sign_warning = '⚠'
      let g:ale_lint_on_text_changed = 'never'
      " Folding
      set foldmethod=indent
      set foldlevel=99
      " space to unfold
      nnoremap <space> za 
      " python specific
      let g:SimpylFold_docstring_preview=1
      au BufNewFile, BufRead *.py
        \ set tabstop=4
        \ set softtabstop=4
        \ set shiftwidth=4
        \ set textwidth=79
        \ set expandtab
        \ set autoindent
        \ set fileformat=unix
      au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
      let python_highlight_all=1
    '';
  };
}
