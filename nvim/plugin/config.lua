vim.g.material_style = "deep ocean"
require('lualine').setup {
  options = {
    theme = 'material-nvim'
  }
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "python",
  highlight = { enable = true },
  indent = { enable = true },
}
