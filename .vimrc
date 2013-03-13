"
" /home/leafy/.vimrc - leafy vimrc
" 

execute pathogen#infect()

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

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch!		" Show matching brackets. // bug sharp braces...
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set smartindent
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

set ruler			" Show ruler displaying line number and col number and progress bottom right
set noexpandtab
set shiftwidth=4	
set tabstop=4
set softtabstop=4
set number
set hlsearch
"set wildmode=longest,list,full
"set wildmenu
set backspace=2

if $TERM == "screen" || $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || 1
  set t_Co=256
endif
 
let mapleader = "\<space>"						

" Quicksave
map <F2> !mksession! :~/.vim_session<CR>

" Quickload
map <F3> :source ~/.vim_session<CR>

" Tab controls
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>

" Clear the search
nmap <F8> :let @/=''<CR>

" Escape a URL's ampersands. vi is used for editing commands inline, so 
" this is useful if you are pasting a URL for command line wget
nmap <F7> :%s/&/\\&/g<CR>

" <C-O> is Ctrl-P in file mode. <C-P> is Ctrl-P in buffer mode. Reversed
" because <C-O> maps conceptually to 'open' and the plugin name is less useful.
let g:ctrlp_map = '<C-O>'
nmap <C-P> :CtrlPBuffer<CR>

" Backspace in normal mode is basically quit, but if this is the last window open 
" and we accidentally close the window, we save session so that we can quickload 
" all the open buffers if it was a mistake. 
nnoremap <BS> :mksession! ~/.vim_session<CR>:quit<CR>

" Enter in normal mode is save. Pretty boss.
nmap <CR> :write<CR>

" Unmap mouse buttons so when I click to focus PuTTY I don't move my cursor. Mouse
" functions still enabled so scrolling works as intended, and other mouse buttons may
" be bound in the future.
noremap! <LeftMouse> <nop>
noremap! <2-LeftMouse> <nop>
noremap! <RightMouse> <nop>

" Highlight characters over 80 columns
match DiffText '\%>80v.\+'

" Load baller theme
source ~/.vim/colors/zenburn.vim
