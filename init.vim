set nocompatible

" user interface
set confirm
syntax on
set display+=uhex
set number
set showmatch
set matchpairs+=<:>
set autowrite
set mouse=a
set linebreak
set background=light
set splitbelow
set splitright
set incsearch
set gdefault
set inccommand=nosplit
set lazyredraw

" text formatting
set nojoinspaces
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set smarttab
set autoindent
set formatoptions=tcqrnj
set textwidth=110
set scrolloff=3
set sidescrolloff=20
set textwidth=110

" C indentation
set cinoptions+=l1

" vim-polyglot
let g:polyglot_disabled = ['c++11']

" ale
let g:ale_enabled = 0
let g:ale_completion_enabled = 0

" Plugins
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-python/python-syntax'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'dense-analysis/ale'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'gpanders/editorconfig.nvim'
call plug#end()

" ctrlp
let g:ctrlp_working_path_mode=''
let g:ctrlp_max_files=100000
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(o|so)$',
    \ 'dir': '\v[\/](target|build|node_modules)$',
    \ }

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

" ale
let g:ale_linters = {
    \ 'rust': ['analyzer'],
    \ 'typescript': ['tsserver', 'eslint'],
    \ 'typescriptreact': ['tsserver', 'eslint'],
    \ }
let g:ale_linters_explicit = 1
let g:ale_set_quickfix = 1
let g:ale_floating_preview = 1
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gD :ALEGoToTypeDefinition<CR>
nnoremap gf :ALEFindReferences<CR>
nnoremap ga :ALEHover<CR>
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab>
    \ pumvisible() ? "\<C-p>" : "\<S-Tab>"
set omnifunc=ale#completion#OmniFunc

" neomake
let g:neomake_virtualtext_current_error=0
let g:neomake_highlight_columns=0
let g:neomake_highlight_lines=1
let g:neomake_place_signs=0
call neomake#config#set('maker_defaults.buffer_output', 0)
map <C-b> :wa<CR>:Neomake!<CR>:copen<CR>

" bindings inspired by unimpaired.vim
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]Q :cnfile<CR>
nnoremap <silent> [Q :cpfile<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [l :lprev<CR>
nnoremap <silent> ]L :lnfile<CR>
nnoremap <silent> [L :lpfile<CR>
