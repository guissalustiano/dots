" usefull remaps
vnoremap <leader>p "_dP
noremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <C-s> :w<CR>

"" Ctrl+^ don't work to me
nnoremap <leader>w <C-^>

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

" Explore tree
nnoremap <leader>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
let g:netrw_browse_split=2 " remove extra informations
let g:netrw_banner=0
let g:netrw_winsize=25

" Windows
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

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
