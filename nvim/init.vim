syntax on

set encoding=UTF-8
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


" Neovim lsp Plugin
Plug 'neovim/nvim-lspconfig'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'nvim-lua/completion-nvim'

Plug 'mpickering/hlint-refactor-vim'
Plug 'rust-lang/rust.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'mbbill/undotree'

Plug 'chrisbra/Colorizer' " Color hexcode
Plug 'alvan/vim-closetag'
Plug 'luochen1990/rainbow' " Color () {} []

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

Plug 'vim-utils/vim-man'

Plug 'tpope/vim-dispatch'
Plug 'junegunn/vim-easy-align'
" Plug 'airblade/vim-gitgutter'

Plug 'kristijanhusak/vim-carbon-now-sh'

Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
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

" Raibow
let g:rainbow_active = 1
"
" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

" Maps
let mapleader = " "

" EasyAlign
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" Carbon.sh
vnoremap <leader><F5> :CarbonNowSh<CR>

" git
nmap <leader>gd <Plug>(GitGutterPreviewHunk)

"awensome
vnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

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

" undotree
nnoremap <leader>u :UndotreeToggle<CR>
"if has("persistent_undo")
"  set undodir=$HOME."/.undodir"
"  set undofile
"endif

" Rename functions
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>s  :%s/\<<C-r><C-w>\>/

nnoremap <leader>d :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>i :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>sh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>rr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
"nnoremap <leader>h :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>f :lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>e :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>rs :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set completeopt=menuone,noinsert,noselect

" opt/omnisharp-roslyn/OmniSharp.exe
lua require'lspconfig'.ccls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.dockerls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.hls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.omnisharp.setup{ cmd={'/usr/share/omnisharp/omnisharp/OmniSharp.exe', "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) }, on_attach=require'completion'.on_attach }
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.terraformls.setup{ cmd = { "terraform-lsp", "serve" }, on_attach=require'completion'.on_attach }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.kotlin_language_server.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
