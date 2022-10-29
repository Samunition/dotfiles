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
set foldmethod=indent
set foldlevelstart=99
set mouse=

let mapleader = ' '
map <C-b> :NERDTreeToggle<CR>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <leader>h :nohlsearch<CR>

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'onsails/lspkind-nvim'
Plug 'rafamadriz/friendly-snippets'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'

Plug 'nvim-lua/plenary.nvim'
Plug '/home/sam/git/snyk.nvim'
call plug#end()

color nord
hi ColorColumn guibg=#ECECEC
