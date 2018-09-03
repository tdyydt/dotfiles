set encoding=utf-8
scriptencoding utf-8

" Case insensitive
set ignorecase
set infercase
" ignore case in wildmenu
set wildignorecase

""" From video:

" Basic setup
syntax on
filetype plugin on

set t_Co=256
" via: https://github.com/vim-scripts/wombat256.vim
colorscheme wombat256mod
" colorscheme desert

" Find files
set path+=**
" Show completion list
set wildmenu
set wildmode=longest:full,full
