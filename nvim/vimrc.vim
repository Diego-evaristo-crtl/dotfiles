set showmatch
set hlsearch
set incsearch
set autoindent
set relativenumber
set number
syntax on
set cursorline
set ttyfast
autocmd BufRead,BufNewFile *.h setlocal filetype=c

call plug#begin()
" Pugins :
Plug 'morhetz/gruvbox'
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim' " telescope dependency
Plug 'BurntSushi/ripgrep'    " telescope dependency
Plug 'sharkdp/fd'	     " telescope dependency
Plug 'ThePrimeagen/vim-be-good'
call plug#end()

colorscheme nightfox
