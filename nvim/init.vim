call plug#begin("~/.config/nvim/plugged")
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'tpope/vim-endwise'
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
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  " Custom Plugins
  Plug 'tpope/vim-projectionist'
  Plug 'christoomey/vim-tmux-runner'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
  Plug 'joshdick/onedark.vim'

  " Language Autocompletion
  " Plug 'natebosch/vim-lsc'
  "Plug 'natebosch/vim-lsc-dart'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Source custom plugins
  if !empty(glob("$HOME/.my_nvim_plugins"))
    source $HOME/.my_nvim_plugins
  endif
call plug#end()

set t_Co=256
set t_ut=
set termguicolors
colorscheme onedark

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
nmap <silent> <LocalLeader>in :PlugInstall<CR>
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

" Language Server Protocol Config
let g:lsc_auto_map = v:true

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


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

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufWritePost *.dart DartFmt

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


highlight Normal guibg=#21242a
highlight MatchParen guifg=#C678DD guibg=#504066
"highlight LineNr    guifg=#151822
highlight LineNr    guifg=#353e5c
highlight CursorLineNr guifg=#56B6C2
highlight Error guifg=#f57373 guibg=#804040
highlight vimError guifg=#f57373 guibg=#804040

hi IndentGuidesEven guibg=#21242a guifg=#1f1f28
hi IndentGuidesOdd guibg=#262a36 guifg=#1f1f28
hi Comment cterm=italic guifg=#4a5158
"hi String guifg=#98C379 guibg=#2a2e34

""" browns
" function params: numbers and constants
hi Statement guifg=#907161
hi Conditional guifg=#907161
hi Keyword guifg=#56B6C2
hi Function guifg=#56B6C2

" Yellows
hi Number guifg=#E5C07B
hi Special guifg=#E5C07B
hi Boolean guifg=#E5C07B

" purple
hi CtrlPMatch guifg=#ba9ef7
hi Visual guibg=#364652

" medium red: if else operators
hi Preproc guifg=#e86868
hi Type guifg=#e86868



"""""" vim-jsx ONLY
hi Identifier cterm=italic

" Blues
" light blues
hi xmlTagName guifg=#59ACE5
hi xmlTag guifg=#59ACE5

" dark blues
hi xmlEndTag guifg=#2974a1
hi jsxCloseString guifg=#2974a1
hi htmlTag guifg=#2974a1
hi htmlEndTag guifg=#2974a1
hi htmlTagName guifg=#59ACE5
hi jsxAttrib guifg=#1BD1C1

" cyan
hi Constant guifg=#56B6C2
hi typescriptBraces guifg=#56B6C2
hi typescriptEndColons guifg=#56B6C2
hi typescriptRef guifg=#56B6C2
hi typescriptPropietaryMethods guifg=#56B6C2
hi typescriptEventListenerMethods guifg=#56B6C2
hi typescriptFunction guifg=#56B6C2
hi typescriptVars guifg=#56B6C2
hi typescriptParen guifg=#56B6C2
hi typescriptDotNotation guifg=#56B6C2
hi typescriptBracket guifg=#56B6C2
hi typescriptBlock guifg=#56B6C2
hi typescriptJFunctions guifg=#56B6C2
hi typescriptSFunctions guifg=#56B6C2
hi typescriptInterpolationDelimiter guifg=#56B6C2
hi typescriptIdentifier guifg=#907161 cterm=italic

" javascript
hi jsParens guifg=#56B6C2
hi jsObjectBraces guifg=#C678DD
hi jsFuncBraces guifg=#56B6C2
hi jsObjectFuncName guifg=#D19A66
hi jsObjectKey guifg=#56B6C2
