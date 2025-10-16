set number
set relativenumber
set cursorline
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
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

" Visual mode indentation keeping highlighted
vnoremap > >gv
vnoremap < <gv

" Normal mode buffers commands"
map gn :bnext<cr>
map gp :bprevious<cr>
map gd :bdelete<cr>

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
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Always show the statusline
set laststatus=2
set noshowmode            " We'll show mode ourselves

" --- Get readable mode name ---
function! ModeName()
  let l:m = mode()
  return l:m ==# 'n'  ? 'NORMAL' :
        \ l:m ==# 'i'  ? 'INSERT' :
        \ l:m ==# 'R'  ? 'REPLACE' :
        \ l:m ==# 'v'  ? 'VISUAL' :
        \ l:m ==# 'V'  ? 'V-LINE' :
        \ l:m ==# "\<C-v>" ? 'V-BLOCK' :
        \ l:m ==# 'c'  ? 'COMMAND' :
        \ 'OTHER'
endfunction

" --- Human-readable file size ---
function! FileSize()
  let bytes = getfsize(expand('%'))
  if bytes < 0
    return ''
  elseif bytes < 1024
    return bytes . 'B'
  elseif bytes < 1024*1024
    return printf('%.1fK', bytes / 1024.0)
  elseif bytes < 1024*1024*1024
    return printf('%.1fM', bytes / 1024.0 / 1024.0)
  else
    return printf('%.1fG', bytes / 1024.0 / 1024.0 / 1024.0)
  endif
endfunction

" --- Git branch detection without plugins ---
function! GitBranch()
  if !isdirectory('.git')
    " Try to find .git directory upward
    let l:gitdir = finddir('.git', '.;')
    if empty(l:gitdir)
      return ''
    endif
  endif
  let l:branch = system('git rev-parse --abbrev-ref HEAD 2>/dev/null')
  return v:shell_error ? '' : ' ' . substitute(l:branch, '\n', '', '')
endfunction

" --- Statusline configuration ---
set statusline=
set statusline+=%#PmenuSel#%{ModeName()}%#Normal#\    " Mode
set statusline+=%f\                                    " File name + path
set statusline+=[%{FileSize()}]                        " File size
set statusline+=%=%#StatusLine#                        " Align right
set statusline+=%l:%c\ %p%%                            " Cursor pos + progress

" --- Auto Indentation ---
filetype plugin indent on
