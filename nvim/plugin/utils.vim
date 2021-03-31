" usefull remaps
vnoremap <leader>p "_dP
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nmap <C-s> :w<CR>
"" Ctrl+^ don't work to me
nmap <leader>w <C-^>

" Mov selected
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Rename functions
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>s  :%s/\<<C-r><C-w>\>/

" --------
" Plugins
" --------

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" EasyAlign
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" Carbon.sh
vnoremap <leader><F5> :CarbonNowSh<CR>
