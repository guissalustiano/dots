require("formatter").setup{
    logging = true,
    -- log_level = vim.log.levels.DEBUG,
    filetype = {
         elixir = {
          require("formatter.filetypes.elixir").mixformat
        },
        rust = {
          require("formatter.filetypes.rust").rustfmt
        }
    },
}

vim.keymap.set('n', '<leader>F', ':Format<CR>', {})

-- Format on save
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
