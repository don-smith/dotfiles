filetype plugin indent on

" Deoplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
call plug#end()

syntax on

set number
set expandtab
set modelines=0
set backspace=2
set shiftwidth=2
set clipboard+=unnamedplus
set synmaxcol=128
set scrolloff=5
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
set termguicolors
set guifont="Source Code Pro for Powerline":h14

let mapleader = ','

colorscheme Tomorrow-Night
let g:airline_theme='tomorrow'

" Deoplete movement within 'ins-completion-menu'
imap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=node_modules
let g:ctrlp_working_path_mode = 2
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 20

" Syntastic
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['babel-eslint', 'standard']
let g:syntastic_mode_map = {'mode': 'active'}
autocmd BufWritePost *.js
  \ if g:syntastic_mode_map['mode'] == 'active' |
  \   silent execute "!standard-format -w %" |
  \   set autoread |
  \ endif

" Powerline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Change the cursor between modes
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" For moving the cursor up/down in paragraphs and in edit mode
nnoremap j gj
nnoremap k gk

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

" Toggle Syntastic
map <leader>st :SyntasticToggleMode<cr>

" An easy escape
:imap jj <Esc>

" NERDTree toggle
map <C-t> :NERDTreeToggle<CR>

" Format the entire file
nmap <leader>fef ggVG=

" Quit current file
nmap <leader>q :bd<CR>

" Unhighlight previous search
nnoremap <ESC> :noh<RETURN><ESC>

" Tab between buffers
noremap <tab> :bn<CR>

" Switch tabs
nmap <leader>t :tabnew<CR>
nmap <S-l> :tabnext<CR>
nmap <S-h> :tabprevious<CR>

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Open and source Neovim config from inside Neovim
command! Config :e ~/.config/nvim/init.vim
command! Source :source ~/.config/nvim/init.vim

