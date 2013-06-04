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
colorscheme desert
syntax on

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
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile


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
let g:CommandTMaxHeight=20
let g:CommandTMinHeight=4


"key remaps
"Remap Command Mode
nnoremap ; :
let mapleader ="," "Map <leader> key
map <leader>n :NERDTreeToggle<CR> "Map NERDTree toggle to <leader>

" key mapping for google search
function! Google()
   call inputsave()
   let searchterm = input('Google: ')
   call inputrestore()
   return searchterm
endfunction
map <leader>g <ESC>:! /usr/bin/open -a "/Applications/Google Chrome.app" 'https://google.com/search?q=<C-R>=Google()<CR>'<CR><CR>

