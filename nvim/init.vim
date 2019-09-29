call plug#begin("~/.config/nvim/plugged")
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'pangloss/vim-javascript'
  Plug 'posva/vim-vue'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'mxw/vim-jsx'
  Plug 'janko-m/vim-test'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'w0rp/ale'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tomasiser/vim-code-dark'

  " Source custom plugins
  if !empty(glob("$HOME/.my_nvim_plugins"))
    source $HOME/.my_nvim_plugins
  endif
call plug#end()

set t_Co=256
set t_ut=
colorscheme codedark

set dir=/tmp//
set hidden
set ignorecase
set mouse=
set number
set ruler
set nowrap
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

nmap <silent> <LocalLeader>nt :NERDTreeToggle<CR>
nmap <silent> <LocalLeader>rb :wa <bar> :TestFile<CR>
nmap <silent> <LocalLeader>rf :wa <bar> :TestNearest<CR>
nmap <silent> <LocalLeader>rl :wa <bar> :TestLast<CR>
nmap <silent> <LocalLeader>p :Files<CR>

nmap <silent> <LocalLeader><LocalLeader> <C-^>

let g:airline_theme = 'codedark'

"""""" ALE Configuration
  " when to lint
  let g:ale_lint_on_text_changed = 0
  let g:ale_lint_on_enter = 1
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_filetype_changed = 1

  " how to lint
  let g:ale_linters = {'ruby': ['rubocop']}

  " add sign column emoticons
  let g:ale_sign_error = 'e'
  let g:ale_sign_warning = 'w'

  " message format
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

  " always show the sign column
  let g:ale_sign_column_always = 1
  let g:ale_set_higlights = 1

  " what to fix and how
  let g:ale_fixers = {
  \  'javascript': ['eslint'],
  \  'ruby': ['rubocop']
  \}

  " fix on file save
  let g:ale_fix_on_save = 1
  " use bundler to allow rubocop to access project gems for linting
  let g:ale_ruby_rubocop_executable = 'bundle'

  " reset sign column background colors
  highlight link ALEError SignColumn
  highlight link ALEWarning SignColumn
  highlight link ALEErrorSign SignColumn
  highlight link ALEWarningSign SignColumn

" faster fzf fuzzy find respecting gitignore
let $FZF_DEFAULT_COMMAND = '((git ls-tree -r --name-only HEAD; git ls-files -o --exclude-standard) || find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//) 2> /dev/null'
