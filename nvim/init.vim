call plug#begin("~/.config/nvim/plugged")
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'pangloss/vim-javascript'
  Plug 'posva/vim-vue'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-rails'
  Plug 'mxw/vim-jsx'
  Plug 'janko-m/vim-test'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'w0rp/ale'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tomasiser/vim-code-dark'
  " Track the engine.
  Plug 'SirVer/ultisnips'

  " Custom Plugins
  Plug 'tpope/vim-projectionist'
  Plug 'christoomey/vim-tmux-runner'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

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
set nospell
set relativenumber
set nowrap

set mouse=a " Mouse on
set modelines=0
set nomodeline

nmap 0 ^
imap <C-L> <SPACE>=><SPACE>

noremap j gj
noremap k gk
nnoremap <CR> :noh<CR>
nmap <silent> <C-s> :w<CR>

" Ripgrep
nnoremap <silent> <LocalLeader>rr :Rg<CR>

nmap <silent> <LocalLeader>so :so $MYVIMRC<CR>
nmap <silent> <LocalLeader>pi :PlugInstall<CR>
nmap <silent> <LocalLeader>nt :NERDTreeToggle<CR>
nmap <silent> <LocalLeader>rb :wa <bar> :TestFile<CR>
nmap <silent> <LocalLeader>rf :wa <bar> :TestNearest<CR>
nmap <silent> <LocalLeader>rl :wa <bar> :TestLast<CR>
nmap <silent> <LocalLeader>p :Files<CR>
nmap <silent> <LocalLeader><LocalLeader> <C-^>
nmap <silent> <LocalLeader>ec :tabnew ~/code/dotfiles/nvim/init.vim<CR>

" FLUTTER LEADER MAPPINGS
" nnoremap <leader>fa :FlutterRun<cr>
" nnoremap <leader>fq :FlutterQuit<cr>
" nnoremap <leader>fr :FlutterHotReload<cr>
" nnoremap <leader>fR :FlutterHotRestart<cr>
" nnoremap <leader>fD :FlutterVisualDebug<cr>

" GIT GUTTER
set updatetime=300
let g:gitgutter_enabled=1

" TESTING
let g:VimuxOrientation="v"
let test#strategy="vtr"

let g:airline_theme = 'codedark'

" UltiSnips configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/code/snippets']


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

autocmd BufNewFile,BufRead *.tsx, *.jsx set filetype=typescript.tsx

" Show Preview of file in FZF
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir GFiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" <C-h><C-h> to use Ripgrep for total line completion
inoremap <expr> <C-h>C-h> fzf#vim#complete(fzf#wrap({
      \ 'prefix': '^.*$',
      \ 'source': 'rg -n ^ --color always',
      \ 'options': '--ansi --delimiter : --nth 3..',
      \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }
      \ }))

