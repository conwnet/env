set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'oplatek/Conque-Shell'
Plugin 'airblade/vim-gitgutter'
" Plugin 'vim-multiple-cursors'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""" Console
let g:ConsoleStatus = 0 " 0 - close 1 - open 2 - hide
function ToggleConsole(direction)
    if g:ConsoleStatus == 0
        let g:ConsoleStatus = 1
        if a:direction == "h"
            ConqueTermSplit bash
            resize 15
        else
            ConqueTermVSplit bash
        endif
    elseif g:ConsoleStatus == 1
        let g:ConsoleStatus = 0
        quit
    elseif g:ConsoleStatus == 2
        let g:ConsoleStatus = 1
        if a:direction == "h"
            set splitbelow
            sbuffer console
            resize 15
            set nosplitbelow
        else
            set splitright
            vertical sbuffer console
            set nosplitright
        endif
    endif
endfunction
""""""""""""""""""""""""""""""

syntax on
set number
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set updatetime=100
set noswapfile
set foldmethod=indent
set foldlevelstart=20
colorscheme evening
highlight Normal ctermbg=None
highlight Visual cterm=reverse
" highlight NonText ctermfg=NONE

"""""""""""""""""""""""""""""""" key maps
map <C-g> :GitGutterToggle<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <F7> <Esc><C-w>-
map <F8> <Esc><C-w>+
map <F9> <Esc><C-w><
map <F10> <Esc><C-w>>

map <C-m> :NERDTreeFind<CR>
map <C-t> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:javascript_plugin_jsdoc = 1

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

let NERDTreeIgnore = ['\.pyc$', '\.swp$']
let g:NERDTreeShowHidden = 1

let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1

