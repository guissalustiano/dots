" please

inoremap <Up>     <C-o>:echom "--> k <-- "<CR>
inoremap <Down>   <C-o>:echom "--> j <-- "<CR>
inoremap <Right>  <C-o>:echom "--> l <-- "<CR>
inoremap <Left>   <C-o>:echom "--> h <-- "<CR>

" best remaps
inoremap <c-c> <esc>
vnoremap <c-c> <esc>

nnoremap <leader>c "_c
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

noremap Y y$
noremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <C-s> :w<CR>

"" Ctrl+^ don't work to me
nnoremap <leader>w <C-^>

" Run the last command
nnoremap <leader>U :<up>

" Remove whitespace
nnoremap <leader>sws :%s/\s\+$//<CR>

" Mov selected
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> :m .+1<CR>==
inoremap <C-k> :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Windows
nnoremap <Leader>= :wincmd =<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"Terminal
if has('nvim')
    " Make esc leave terminal mode
    tnoremap <leader><Esc> <C-\><C-n>
    tnoremap <Esc><Esc> <C-\><C-n>

    " Easy moving between the buffers
    tnoremap <leader>h <C-\><C-n><C-w>h
    tnoremap <leader>j <C-\><C-n><C-w>j
    tnoremap <leader>k <C-\><C-n><C-w>k
    tnoremap <leader>l <C-\><C-n><C-w>l

    " Try and make sure to not mangle space items
    tnoremap <S-Space> <Space>
    tnoremap <C-Space> <Space>
endif
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

" Formater
nnoremap <leader><f> :Format<CR>
