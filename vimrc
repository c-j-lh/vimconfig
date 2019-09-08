set nocompatible
set showmode
set nu
set showcmd

" ---- Minimal configuration:
set smartindent   " Do smart autoindenting when starting a new line
set shiftwidth=4  " Set number of spaces per auto indentation
set expandtab     " When using <Tab>, put spaces instead of a <tab> character

" ---- Good to have for consistency
set tabstop=4   " Number of spaces that a <Tab> in the file counts for
set smarttab    " At <Tab> at beginning line inserts spaces set in shiftwidth

filetype on
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python' shellescape(@%, 1)<cr>
autocmd Filetype python nnoremap <buffer> <F5> :exec '!clear; python -i ' shellescape(@%, 1)<cr>
autocmd Filetype matlab nnoremap <buffer> <F5> :exec '!clear; octave --persist ' shellescape(@%, 1)<cr>
