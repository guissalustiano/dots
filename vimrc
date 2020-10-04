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

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'OmniSharp/omnisharp-vim'
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

Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'

" Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
call plug#end()

" theme
" let ayucolor="dark"
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox

" Airlines
let g:airline_powerline_fonts = 1
"let g:airline_theme = "base12_spacemacs"
let g:airline#extensions#tmuxline#enabled = 0

" Detect root dir
if executable('rg')
  let g:rg_derive_root='true'
endif

" OmniSharp
"g:OmniSharp_selector_findusages = 'fzf'


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
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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

" undotree
nnoremap <leader>u :UndotreeToggle<CR>
"if has("persistent_undo")
"  set undodir=$HOME."/.undodir"
"  set undofile
"endif

" Snipped
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" Rename functions
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ps :Rg<SPACE>

" Coc
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)

nmap <leader> k :call <SID>show_documentation()

" Carbon.sh
vnoremap <leader><F5> :CarbonNowSh<CR>

autocmd FileType cs nmap <silent> <buffer> <Leader>rr <Plug>(omnisharp_rename)

" execute files
autocmd FileType python map <buffer> <leader>t :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python setlocal formatprg=autopep8\ -

autocmd FileType cs map <buffer> <leader>t :w<CR>:exec '!dotnet run'<CR>
autocmd FileType haskell map <buffer> <leader>t :w<CR>:exec '!ghc -o out' shellescape(@%, 1) '&& ./out'<CR>
autocmd FileType vhdl map <buffer> <leader>t :w<CR>:exec '!ghdl -a ' shellescape(@%, 1)<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Utils
nmap <leader>s :w<CR>
nmap <leader>w <C-^>

" YES
com! W w
