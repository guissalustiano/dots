" usefull remaps
vnoremap <leader>p "_dP
noremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <C-s> :w<CR>

"Opent terminal
nmap <leader>t <cmd>term<CR>i
tnoremap <Esc> <C-\><C-n>

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
