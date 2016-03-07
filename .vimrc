"
"  gelinas260's vimrc (inspired heavily from Criten's)
"
set noswapfile

" Plugins!
call plug#begin('~/.vim/plugged')

" Themes
Plug 'altercation/vim-colors-solarized'

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

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent off
endif

filetype indent on
filetype plugin on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

" Show (partial) command in status line.
"set showcm
"
" Show matching brackets. // bug sharp braces
set showmatch!

" Do case insensitive matching
set ignorecase

" Incremental search
set incsearch

" Automatically save before commands like :next and :make
set autowrite

" Hide buffers when they are abandoned
set hidden

" Enable mouse usage (all modes)
set mouse=a

" Show ruler displaying line number and col number and progress bottom right
set ruler

set shiftround
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set number
set hlsearch
set backspace=2
set formatoptions+=l

au BufNewFile,BufRead *.jbuilder set ft=ruby
au FileType html setl sw=2 sts=2 et


" Show trailing whitespace
set listchars=trail:⋅
set list

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

" Load baller theme
"source ~/.vim/colors/base16-bespin.vim

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
