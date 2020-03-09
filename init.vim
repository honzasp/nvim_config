set nocompatible

set vb t_vb=

" User interface

set confirm

syntax on
set nohlsearch

set history=50
set wildmenu
set shortmess+=a

set ruler
set showmode
set showcmd
set showfulltag
set display+=lastline
set number

set nrformats=alpha,hex
set showmatch
set matchpairs+=<:>

set autowrite

" Mouse and keyboard

set backspace=eol,start,indent
set mouse=a

" Text formatting

filetype plugin indent on

set wrap
set linebreak

" no tabs, just two spaces
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set shiftround
set smarttab
set autoindent

set formatoptions=tcqrn
set textwidth=80

set scrolloff=2
set sidescrolloff=20
set previewheight=5

" Searching and replacing
set incsearch
set gdefault

" Splits
set splitbelow
set splitright

" Color scheme
colorscheme default
set background=light

" recognize .md as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Python indenting
autocmd FileType python setlocal softtabstop=4
autocmd FileType python setlocal tabstop=4
autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal textwidth=90

" Enable project-specific .vimrc
set exrc
set secure

" Plugins
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-python/python-syntax'
call plug#end()

" Plugin ctrlp
let g:ctrlp_working_path_mode=''

" Plugin python-syntax
let g:python_highlight_builtin_objs=1
let g:python_highlight_class_vars=1
