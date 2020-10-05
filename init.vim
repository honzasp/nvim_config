set nocompatible

set vb t_vb=

" User interface

set confirm

syntax on

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
set nojoinspaces

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

" C/C++ Doxygen-style doc comments
autocmd Filetype c,cpp set comments^=:///

" Enable project-specific .vimrc
set exrc
set secure

set inccommand=nosplit
set lazyredraw

" Plugins
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-python/python-syntax'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
call plug#end()

" ctrlp
let g:ctrlp_working_path_mode=''

" python-syntax
let g:python_highlight_builtin_objs=1
let g:python_highlight_class_vars=1

" incsearch
set hlsearch
let g:incsearch#auto_nohlsearch=1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" deoplete
let g:deoplete#enable_at_startup=1
call deoplete#custom#option('auto_complete', v:false)

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ !<SID>check_back_space() ? deoplete#manual_complete()."\<C-n>" :
    \ "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col-1] =~ '\s'
endfunction"}}}

" neomake
let g:neomake_virtualtext_current_error=0
let g:neomake_highlight_columns=0
let g:neomake_highlight_lines=1
let g:neomake_place_signs=0
call neomake#config#set('maker_defaults.buffer_output', 0)
map <C-B> :wa<CR>:Neomake!<CR>:copen<CR>

" vim-polyglot
let g:polyglot_disabled = ['c++11']

" bindings inspired by unimpaired.vim
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]Q :cnfile<CR>
nnoremap <silent> [Q :cpfile<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [l :lprev<CR>
nnoremap <silent> ]L :lnfile<CR>
nnoremap <silent> [L :lpfile<CR>
