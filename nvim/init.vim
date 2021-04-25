call plug#begin('~/.vim/plugged')
  " Neovim lsp Plugin
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'tjdevries/nlua.nvim'
  Plug 'tjdevries/lsp_extensions.nvim'

  " Some specific languags
  Plug 'rust-lang/rust.vim'

  " Debugger
  Plug 'puremourning/vimspector'

  " Formatter/Prettier
  " Plug 'sbdchd/neoformat'

  " Smart Colorize
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'chrisbra/Colorizer' " Color hexcode
  Plug 'p00f/nvim-ts-rainbow' " Color () {} []

  " Runners
  Plug 'tpope/vim-dispatch'

  " fuzzyfinder
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Utils
    " (Ctrl+Z)³
    Plug 'mbbill/undotree'
  Plug 'vim-utils/vim-man'
  Plug 'junegunn/vim-easy-align'
  Plug 'kristijanhusak/vim-carbon-now-sh'

  " Aesthetics
  Plug 'sheerun/vim-polyglot'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ayu-theme/ayu-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Detect root dir
if executable('rg')
  let g:rg_derive_root='true'
endif

" Maps
let mapleader = " "
