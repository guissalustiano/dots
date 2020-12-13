syntax on

set encoding=UTF-8
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set showcmd
set scrolloff=8
set noshowmode
set cmdheight=2
set updatetime=50
set shortmess+=c
set mouse=

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'mpickering/hlint-refactor-vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'chrisbra/Colorizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'alvan/vim-closetag'
"Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'
Plug 'mpickering/hlint-refactor-vim'
Plug 'airblade/vim-gitgutter'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'

Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

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

" Detect root dir
if executable('rg')
  let g:rg_derive_root='true'
endif

set completefunc=emoji#complete

let mapleader = " "

" Raibow
let g:rainbow_active = 1

" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" EasyAlign
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" explore tree
nnoremap <leader>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
let g:netrw_browse_split=2 " remove extra informations
let g:netrw_banner=0
let g:netrw_winsize=25

" Windows
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Mov selected
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Delete selected
vnoremap X "_d

" git
nmap <leader>gd <Plug>(GitGutterPreviewHunk)

" undotree
nnoremap <leader>u :UndotreeToggle<CR>
"if has("persistent_undo")
"  set undodir=$HOME."/.undodir"
"  set undofile
"endif

"lsp
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" lua call nvim_lsp#setup("pyls", {})

nnoremap <leader>d :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>i :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>sh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>rr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
"nnoremap <leader>h :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>f :lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>e :lua vim.lsp.util.show_line_diagnostics()<CR>

" Snipped
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-N>"

" Rename functions
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>s  :%s/\<<C-r><C-w>\>/

" GoTo code navigation.
nmap <leader> k :call <SID>show_documentation()

" Carbon.sh
vnoremap <leader><F5> :CarbonNowSh<CR>

" execute files
autocmd FileType python  map <buffer> <leader>tr :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType cs      map <buffer> <leader>tr :w<CR>:exec '!dotnet run'<CR>
autocmd FileType haskell map <buffer> <leader>tr :w<CR>:exec '!ghc -o out' shellescape(@%, 1) '&& ./out'<CR>
autocmd FileType vhdl    map <buffer> <leader>tr :w<CR>:exec '!ghdl -a ' shellescape(@%, 1)<CR>

autocmd FileType dart    map <buffer> <leader>tt :w<CR>:exec '!flutter test' shellescape(@%, 1)<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Utils
nmap <C-s> :w<CR>
nmap <leader>w <C-^>

" YES
com! W w

lua <<EOF
local lspconfig = require'nvim_lsp'
local configs = require'lspconfig/configs'
configs.vhdl = {
  default_config = {
    cmd = {'/home/guiss/executable/rust_hdl/target/release/vhdl_ls'};
    filetypes = {'vhd', 'vhdl'};
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  };
}
EOF

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set completeopt=menuone,noinsert,noselect

lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.dartls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.hls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.jedi_language_server.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.cssls.setup{ on_attach=require'completion'.on_attach, filetypes={'css','typescript'}}
lua require'lspconfig'.html.setup{ on_attach=require'completion'.on_attach, filetypes={'html','typescriptreact'}}
lua require'lspconfig'.dockerls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.omnisharp.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.vhdl.setup{ on_attach=require'completion'.on_attach }
