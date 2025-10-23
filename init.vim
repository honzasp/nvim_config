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
set hlsearch
set gdefault
set inccommand=nosplit
set lazyredraw
set notermguicolors
colorscheme honzasp

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

" Plugins
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neomake/neomake'
Plug 'romainl/vim-cool'
Plug 'gpanders/editorconfig.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" ctrlp
let g:ctrlp_working_path_mode=''
let g:ctrlp_max_files=100000
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(o|so)$',
    \ 'dir': '\v[\/](target|build|node_modules)$',
    \ }

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

" nvim-treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "python", "json", "yaml", "toml" },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    -- Disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = false,
      node_decremental = "<BS>",
    },
  },
}
EOF

" fix Python indenting
let g:python_indent = {
    \ 'disable_parentheses_indenting': v:false,
    \ 'closed_paren_align_last_line': v:false,
    \ 'searchpair_timeout': 150,
    \ 'continue': 'shiftwidth()',
    \ 'open_paren': 'shiftwidth()',
    \ 'nested_paren': 'shiftwidth()'
    \ }
