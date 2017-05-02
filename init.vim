filetype plugin indent on

" Plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'jiangmiao/auto-pairs'
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'Quramy/tsuquyomi'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeTabsToggle' }
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
:let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline#extensions#tmuxline#enabled = 0

" Spell checking
set spelllang=en_nz
au BufRead *.md setlocal spell
nmap <silent> <leader>sp :set spell!<CR>

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
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_mode_map = {'mode': 'active'}

" Tsuquyomi (TypeScript plugin)
let g:tsuquyomi_disable_quickfix = 1

" NERDCommenter (use <leader>c<space>)
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" Powerline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" JavaScript formatting
autocmd FileType javascript set formatprg=prettier\ --stdin

" Change the cursor between modes
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" For moving up/down in paragraphs and in edit mode
nnoremap j gj
nnoremap k gk

" Run macros easier (I always record them in the q register)
:nnoremap <Space> @q

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
nnoremap <C-n> :call NumberToggle()<CR>

" Move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Toggle Syntastic
map <leader>st :SyntasticToggleMode<CR>

" An easy escape
:imap jj <Esc>

" NERDTree toggle
" map <C-t> :NERDTreeToggle<CR>
map <C-t> :NERDTreeTabsToggle<CR>

" Ack shortcut
nnoremap <leader>a :Ack!<Space>

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

" Faster test runner
nnoremap ` :!npm test<CR>

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Open and source Neovim config from inside Neovim
command! Config :e ~/.config/nvim/init.vim
command! Source :source ~/.config/nvim/init.vim
