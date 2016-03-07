"
"  gelinas260's vimrc (inspired heavily from Criten's)
"

" Plugins!
call plug#begin('~/.vim/plugged')

" Themes
Plug 'chriskempson/base16-vim'

" Editing Enhancements
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" Autocompletion / Snippets
Plug 'garbas/vim-snipmate' | Plug 'tomtom/tlib_vim' | Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Raimondi/delimitMate'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-endwise'

" File Utilities
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Interface / Language Support
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'bronson/vim-trailing-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'

" Testing / Syntax Checking
Plug 'scrooloose/syntastic'

call plug#end()

" Colorscheme
colorscheme base16-bespin
set background=dark

let delimitMate_expand_cr = 1

if $TERM == "screen" || $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || 1
  set t_Co=256
endif

" Tab controls
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>

" Clear the search
nmap <F8> :let @/=''<CR>

" Escape a URL's ampersands. vi is used for editing commands inline, so
" this is useful if you are pasting a URL for command line wget
nmap <F7> :%s/&/\\&/g<CR>

" Backspace in normal mode is basically quit, but if this is the last window open
" and we accidentally close the window, we save session so that we can quickload
" all the open buffers if it was a mistake.
" nnoremap <BS> :mksession! ~/.vim_session<CR>:quit<CR>

" Enter in normal mode is save. Pretty boss.
nmap <CR> :write<CR>

" Makes the tab key happy
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Remap ; to : (helpful if you forget SHIFT when attempting to enter command
" mode
nnoremap ; :

" Close if NERDTree is last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

if has('mouse_sgr')
  set ttymouse=sgr
endif

nnoremap <C-n> :call NumberToggle()<cr>

" CTRL-P Settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tmp\|bower_components'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_show_hidden = 1

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/

" Settings
set smartindent
set autoindent
set number
set ruler
set rulerformat=%-14.(%l,%c%V%)\ %P
set modelines=0
syntax enable

"set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list
set backspace=indent,eol,start

set showmode
set showcmd

set listchars=""
set listchars+=tab:\ \
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

set colorcolumn=85

if has("autocmd")
  filetype indent on
endif

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set gdefault
set smartcase
