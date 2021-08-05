-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- intellij
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'rust-lang/rust.vim'
  use 'L3MON4D3/LuaSnip'

  -- Formatter/Prettier
  use 'mhartington/formatter.nvim'

  -- telescope
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  -- use 'puremourning/vimspector'
  use 'mbbill/undotree'
  use {'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'p00f/nvim-ts-rainbow' -- Color () {} []

  -- Git
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- Utils
  use 'andymass/vim-matchup'
  -- use '9mm/vim-closer'
  use 'junegunn/vim-easy-align'
  use 'kristijanhusak/vim-carbon-now-sh'

  -- Aesthetics
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  use 'lukas-reineke/indent-blankline.nvim'
  use 'chrisbra/Colorizer' -- Color hexcode
  -- use 'ayu-theme/ayu-vim'
  use {
    'marko-cerovac/material.nvim',
    config = function() require('material').set() end
  }
  use 'kyazdani42/nvim-web-devicons'
  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
end)
