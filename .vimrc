" Devanand Reddy
" My custom configuration
"

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
filetype plugin indent on


set ruler

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
colorscheme wombat256mod

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

let g:EclimLocateFileDefaultAction="split"
let g:EclimLocateFileCaseInsensitive="never"
let g:EclimLocateFileScope="workspace"


" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
set hidden
set encoding=utf-8 
set nowrap        " don't wrap lines
set laststatus=2
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=4000         " remember more commands and search history
set undolevels=4000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.a,*.jpeg,*.gif,*.png
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
set cursorline
set noshowmode
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null

let g:locateopen_ignorecase = 1


" let &titlestring = expand("%:p")
" if &term == "screen"
"   set t_ts=^[k
"   set t_fs=^[\
" endif
" if &term == "screen" || &term == "xterm"
"   set title
"  endif
"
" python from powerline.bindings.vim import source_plugin; source_plugin()
source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
let g:Powerline_symbols = 'fancy' 
set term=xterm-256color

let g:CommandTMaxFiles=1000
let g:CommandTMaxHeight=25
let g:CommandTMinHeight=4


"key remaps
"Remap Command Mode
nnoremap ; :
let mapleader ="," "Map <leader> key
"Map NERDTree toggle to <leader>n
map <leader>n :NERDTreeToggle<CR> 
"Map Go Fmt to <leader>f
map <leader>f :Fmt<CR> 

" key mapping for google search
function! Google()
   call inputsave()
   let searchterm = input('Google: ')
   call inputrestore()
   return searchterm
endfunction
map <leader>g <ESC>:! /usr/bin/open -a "/Applications/Google Chrome.app" 'https://google.com/search?q=<C-R>=Google()<CR>'<CR><CR>
"
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"Function key bindings
"Compiler navigation bindings
:map	<F2>	:cnext<CR> 
:map	<S-F2>	:cprev<CR>
nnoremap <F3> :nohl<CR>
nnoremap <F4> :NERDTreeFind<CR>
map <F5> :silent execute " grep -srnw --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow<CR>

nnoremap <silent><F9> :MaximizerToggle<CR> 
vnoremap <silent><F9> :MaximizerToggle<CR>gv 
inoremap <silent><F9> <C-o>:MaximizerToggle<CR> 

nnoremap <silent> <F10> :bn<CR>
nnoremap <silent> <S-F10> :bp<CR>
" inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
" \ "\<lt>C-n>" :
" \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
" \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
" \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" 
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" imap <C-@> <C-Space>
autocmd FileType go compiler golang
let g:golang_goroot=$GOROOT
"Maximizer key bindings

