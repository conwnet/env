syntax on

set number
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set updatetime=100
set noswapfile
set foldmethod=indent
set encoding=utf8
set foldlevelstart=20

" Persistent undo
if !isdirectory(expand('~/.vim/undodir'))
  call mkdir(expand('~/.vim/undodir'), 'p')
endif
set undodir=~/.vim/undodir
set undofile
