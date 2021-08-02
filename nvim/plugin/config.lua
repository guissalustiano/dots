vim.g.material_style = "deep ocean"
require('lualine').setup {
  options = {
    theme = 'material-nvim'
  }
}

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
    },
    cpp = {
        -- clang-format
       function()
          return {
            exe = "clang-format",
            args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
            stdin = true,
            cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
          }
        end
    }
  }
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = "python",
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
  incremental_selection = { enable = true },
  textobjects = {
    select = { enable = true },
    move = { enable = true },
  },
}
