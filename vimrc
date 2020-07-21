syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set number
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=utf-8
set fileencoding=utf-8
set updatetime=50
set cmdheight=2
set mouse=a

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

colorscheme dracula

if executable('rg')
      let g:rg_derive_root='true'
endif

map <C-b> :NERDTreeToggle<CR>
