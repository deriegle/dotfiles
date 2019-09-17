call plug#begin("~/.config/nvim/plugged")
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'pangloss/vim-javascript'
  Plug 'posva/vim-vue'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'mxw/vim-jsx'
  Plug 'airblade/vim-gitgutter'

  " Source custom plugins
  if !empty(glob("$HOME/.my_nvim_plugins"))
    source $HOME/.my_nvim_plugins
  endif
call plug#end()

set dir=/tmp//
set hidden
set ignorecase
set mouse=
set number
set ruler
set showmatch
set smartcase
set textwidth=0
set nosmartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set undofile
set clipboard=unnamed

set modelines=0
set nomodeline

imap <C-L> <SPACE>=><SPACE>

noremap <leader>so :so $MYVIMRC<CR>
