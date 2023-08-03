set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set nu                      " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
"
map <F1> <Esc>
imap <F1> <Esc>


call plug#begin("~/.vim/plugged")
" Plugin Section
" Color Theme
Plug 'hardhackerlabs/theme-vim', { 'as': 'hardhacker' }
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'neovim/nvim-lspconfig'
Plug 'karb94/neoscroll.nvim'
Plug 'lewis6991/spellsitter.nvim'
Plug 'simrat39/symbols-outline.nvim'
" Auto Format
Plug 'vim-autoformat/vim-autoformat'
" Auto brace pairing
Plug 'jiangmiao/auto-pairs'
" Auto completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.0.0', 'do': 'make install_jsregexp'} " Replace <CurrentMajor> by the latest released major (first number of latest release)
" Git Line Signs.
Plug 'lewis6991/gitsigns.nvim'
" Better Tab support
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
Plug 'romgrk/barbar.nvim'

" Better Fuzzy Search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

call plug#end()

set mouse+=a

" Color Theme setting related
syntax      enable
syntax      on
set         t_Co=256
" let g:hardhacker_darker = 1
colorscheme hardhacker

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-t> :NERDTreeToggle<CR>

" Easy Motion Setup
nmap ss <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1


" My own shortcut settings.
set splitright
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :vsplit <C-R>=expand("%:p:h") . "/" <CR>

" Create a command alias 'name' -> get current name to the clipboard
command GetFileName let@+=expand('%')

" For fixing weird behaviors inside screen or tmux.
set ttimeoutlen=100

lua require('init')

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
"set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" For Smooth Scrolling
lua require('neoscroll').setup()

" Spell Checkers
lua require('spellsitter').setup()

set autoindent expandtab tabstop=2 shiftwidth=2

cnoreabbrev sout SymbolsOutline

let g:python3_host_prog="/usr/bin/python3"
au BufWrite * :Autoformat

let g:autoformat_autoindent=0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1
let g:autoformat_verbosemode=0

