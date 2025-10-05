set number
set relativenumber
set cursorline
set tabstop=4
set nowrap
syntax on


set termguicolors
colorscheme sorbet

" mouse mode 
set mouse=n
set ttymouse=xterm2

" escape key mappings
inoremap jk <Esc>
vnoremap jk <Esc>

" normal mode mappings

nnoremap <Space> ^
nnoremap Y y$

" move lines up % down
" IT layout
nnoremap ª :m .+1<CR>==
nnoremap º :m .-2<CR>==

inoremap ª <Esc>:m .+1<CR>==gi
inoremap º <Esc>:m .-2<CR>==gi

vnoremap ª :m '>+1<CR>gv=gv
vnoremap º :m '<-2<CR>gv=gv
" US layout
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" LINUX and Windows
nnoremap <Alt-j> :m .+1<CR>==
nnoremap <Alt-k> :m .-2<CR>==

inoremap <Alt-j> <Esc>:m .+1<CR>==gi
inoremap <Alt-k> <Esc>:m .-2<CR>==gi

vnoremap <Alt-j> :m '>+1<CR>gv=gv
vnoremap <Alt-k> :m '<-2<CR>gv=gv


