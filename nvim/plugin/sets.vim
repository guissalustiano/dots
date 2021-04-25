syntax on

" Basic please
set encoding=UTF-8
set termguicolors
set hidden
set noerrorbells
set nowrap

" centralize cursor
set scrolloff=8

" search
set nohlsearch
set smartcase
set incsearch

" left colum
set number
set relativenumber
set signcolumn=yes

" spaces please
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
filetype plugin indent on

" etern history
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" displaying messages.
set showcmd
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey
