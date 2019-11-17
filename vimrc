"set runtimepath^=~/.vim/bundle/novim-mod

set nocompatible
nnoremap n nzz
nnoremap } }zz
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
set linebreak
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
set gdefault
set virtualedit=block
set splitbelow
set splitright


set showmode
set nu
set showcmd
set mouse=a
set clipboard=unnamedplus
set undofile
let mapleader = ","

nnoremap <leader>ev :sp ~/.vim/vimrc<cr>
nnoremap <leader>sv :so ~/.vim/vimrc<cr>
nnoremap <leader>9 `>a)<esc>`<i(<esc
nnoremap x "_x
nnoremap m "_d
nnoremap mm "_dd

inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>
inoremap ' ''<left>
autocmd FileType cpp inoremap < <><left>


" Python {{{
augroup python
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python iabbrev fr for i in range()<esc>i

    " For uncommenting and commenting CS1010S lines
    autocmd FileType python nnoremap <leader>b :,+6s/^\zeprint/#<cr>
    autocmd FileType python nnoremap <leader>n :,+6s/^#\s*\zeprint//<cr>
    autocmd FileType python set foldmethod=syntax
augroup END
"}}}

" Vimscript {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" indent {{{
" ---- Minimal configuration:
set smartindent   " Do smart autoindenting when starting a new line
set shiftwidth=4  " Set number of spaces per auto indentation
set expandtab     " When using <Tab>, put spaces instead of a <tab> character

" ---- Good to have for consistency
set tabstop=4   " Number of spaces that a <Tab> in the file counts for
set smarttab    " At <Tab> at beginning line inserts spaces set in shiftwidth
" }}}

" F5/F9 running files {{{
filetype on
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python3' shellescape(@%, 1)<cr>
autocmd Filetype python nnoremap <buffer> <F5> :exec '!clear; python3 -i ' shellescape(@%, 1)<cr>
autocmd Filetype matlab nnoremap <buffer> <F5> :exec '!clear; octave --persist ' shellescape(@%, 1)<cr>
" }}}

" For fun {{{
augroup save
    autocmd!
    autocmd BufNewFile *.txt :write
augroup END

" Markdown {{{
augroup markdown
    autocmd!
    autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd FileType markdown onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
    autocmd FileType markdown setlocal statusline+=:))%%
augroup END
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>
" }}}
" }}}
