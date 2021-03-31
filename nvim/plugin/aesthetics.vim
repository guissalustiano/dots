" theme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let ayucolor="dark"
colorscheme ayu

" Airlines
let g:airline_powerline_fonts = 1
"let g:airline_theme = "base12_spacemacs"
let g:airline#extensions#tmuxline#enabled = 0


" Raibow
let g:rainbow_active = 1
"
