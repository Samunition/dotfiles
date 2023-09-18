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
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'sindrets/diffview.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' }

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mxsdev/nvim-dap-vscode-js'
Plug 'microsoft/vscode-js-debug', { 'tag': 'v1.74.1', 'do': 'npm install --legacy-peer-deps && npm run compile' }

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

" Copilot
" Plug 'github/copilot.vim'
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'

" SourceGraph
Plug 'sourcegraph/sg.nvim', { 'do': 'vim -l build/init.lua' }

Plug 'nvim-lua/plenary.nvim'
Plug '/home/sam/git/snyk.nvim'
call plug#end()

color nord
hi ColorColumn guibg=#ECECEC
