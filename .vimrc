"
"  gelinas260's vimrc (inspired heavily from Criten's)
"
set noswapfile
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

filetype plugin on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd    " Show (partial) command in status line.
set showmatch!    " Show matching brackets. // bug sharp braces...
set ignorecase    " Do case insensitive matching
set smartindent
set incsearch   " Incremental search
set autowrite   " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a   " Enable mouse usage (all modes)

set ruler     " Show ruler displaying line number and col number and progress bottom right
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set number
set hlsearch
set backspace=2
set formatoptions=l
set lbr
set breakindent

au BufNewFile,BufRead *.jbuilder set ft=ruby


" Show trailing whitespace
set listchars=trail:⋅
set list

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
