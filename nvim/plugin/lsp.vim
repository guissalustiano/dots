nnoremap <leader>d :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>i :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>sh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>rr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>h :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>f :lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>e :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>rs :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
local attach = require'completion'.on_attach
local util = require "lspconfig/util"

lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  { on_attach=attach }
)

-- Na proxima versão vai vir incluso
if not lspconfig.tflint then
  configs.tflint = {
    default_config = {
      cmd = {"tflint", "--langserver"},
      filetypes = {"terraform"},
      root_dir = util.root_pattern(".terraform", ".git", ".tflint.hcl")
    },
  }
end

if not lspconfig.ghdl then
  configs.ghdl = {
    default_config = {
      cmd = {"ghdl-ls"},
      filetypes = {"vhdl"},
      root_dir = util.root_pattern("hdl-prj.json", ".git")
    },
  }
end

lspconfig.ccls.setup{}
lspconfig.dockerls.setup{}
lspconfig.hls.setup{}
lspconfig.pyls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.tsserver.setup{}
lspconfig.kotlin_language_server.setup{}
lspconfig.gopls.setup{}
lspconfig.tflint.setup{}
lspconfig.julials.setup{}
lspconfig.ghdl.setup{}

EOF
