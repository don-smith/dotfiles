"set nocompatible " apparently required for Vundle?
"filetype off     " apparently required for Vundle?
filetype plugin indent on

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'rking/ag.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ajh17/Spacegray.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'guns/vim-clojure-static'
Plugin 'flazz/vim-colorschemes'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
call vundle#end()

" Only for OS X
"set t_Co=256
"color distinguished
"colorscheme spacegray

syntax on
let mapleader = ","

set number
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set laststatus=2
set tabstop=2
set wrap
set linebreak
set number
set textwidth=0
set wrapmargin=0
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase
set guifont="Source Code Pro for Powerline":h14

" For moving up/down in paragraphs and in edit mode
nnoremap j gj
nnoremap k gk
inoremap <C-k> <C-o>gk
inoremap <C-j> <C-o>gj

" Make a 3-way toggle between no line numbers, absolute, and relative:
function! NumberToggle()
  if(&rnu == 0 && &nu == 0)
    set nu
  elseif(&nu == 1)
    set nonu
    set rnu
  else
    set nornu
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" An easy escape
:imap jj <Esc>

" Format the entire file
nmap <leader>fef ggVG=

" Quit current file
nmap <leader>q :bd<CR>

" Change the cursor between modes (gnome-terminal)
if has("autocmd")
  au InsertEnter *
    \ if v:insertmode == 'i' |
    \   silent execute "!gnome-terminal-cursor-shape.sh ibeam" |
    \ elseif v:insertmode == 'r' |
    \   silent execute "!gnome-terminal-cursor-shape.sh underline" |
    \ endif
  au InsertLeave * silent execute "!gnome-terminal-cursor-shape.sh block"
  au VimLeave * silent execute "!gnome-terminal-cursor-shape.sh block"
endif

" Unhighlight previous search
nnoremap <ESC> :noh<RETURN><ESC>

" For the powerline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Open new buffers
nmap <leader>v :rightbelow vsp<CR>
nmap <leader>h :rightbelow sp<CR>
nmap <leader>o :only<cr>

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-X> <C-W>q

" Tab between buffers
noremap <tab> <c-w><c-w>

" Switch tabs
nmap <leader>t :tabnew<CR>
nmap <S-l> :tabnext<CR>
nmap <S-h> :tabprevious<CR>

" Yank text to the clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=node_modules
let g:ctrlp_working_path_mode = 2
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 20

" Syntastic
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['babel-eslint', 'standard']
autocmd bufwritepost *.js silent !standard-format -w %
set autoread

