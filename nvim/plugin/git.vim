" git
nmap <leader>gd <Plug>(GitGutterPreviewHunk)

" fugitive
nnoremap <leader>gd :Git diff %<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gfa :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>
nnoremap <leader>gb :GBlame<CR>
