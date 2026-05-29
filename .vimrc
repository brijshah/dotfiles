" Use Vim behavior, not old vi compatibility
set nocompatible

" Filetype detection, indentation, and plugins
filetype plugin indent on

" Syntax highlighting
syntax on

" Line numbers: absolute current line + relative nearby lines
set number
set relativenumber

" Better searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Better indentation
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Show useful UI hints
set ruler
set showcmd
set wildmenu
set laststatus=2

" Safer editing
set hidden
set confirm
set undofile

" Better wrapping behavior
set linebreak
set breakindent

" Highlight current line
set cursorline

" Use the system clipboard when available
set clipboard=unnamed

" Easier escape from insert mode
inoremap jj <Esc>

" Clear search highlight with leader + space
let mapleader = " "
nnoremap <leader><space> :nohlsearch<CR>