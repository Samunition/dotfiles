syntax on
set smartindent
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set number cursorline
set termguicolors
set guicursor=
set showmatch
set incsearch hlsearch
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set nowrap

map <C-b> :NERDTreeToggle<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

color dracula
hi ColorColumn guibg=#ECECEC

let mapleader = ' '
