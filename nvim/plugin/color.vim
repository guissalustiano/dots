lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "python",
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true
  }
}
EOF
