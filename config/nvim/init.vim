filetype plugin indent on

" Plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/tmuxline.vim'
Plug 'elmcast/elm-vim'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'Quramy/tsuquyomi'
Plug 'sbdchd/neoformat'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
call plug#end()

syntax on

set number
set expandtab
set modelines=0
set backspace=2
set shiftwidth=2
set clipboard+=unnamedplus
set scrolloff=5
set laststatus=2
set tabstop=2
set wrap
set linebreak
set number
set hidden
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

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

colorscheme Tomorrow-Night
let g:airline_theme='tomorrow'
:let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline#extensions#tmuxline#enabled = 0
" make background transparent
autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE

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

" Language Protocol Servers
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" Async Lint Engine (ALE)
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['tslint']}
let g:ale_fixers = {'javascript': ['eslint', 'prettier'], 'jsx': ['eslint', 'prettier'],  'markdown': ['prettier'], 'typescript': ['prettier']}
let g:ale_fix_on_save = 1

" For Elm, use elm-vim instead of vim-polyglot
let g:polyglot_disabled = ['elm', 'graphql']
" adding graphql is a workaround for https://github.com/sheerun/vim-polyglot/issues/303

" Tsuquyomi (TypeScript plugin)
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_disable_default_mappings = 1
nmap <C-]> <Plug>(TsuquyomiDefinition)
nmap <C-&> <Plug>(TsuquyomiGoBack)
nmap <C-^> <Plug>(TsuquyomiReferences)

" NERDCommenter (use <leader>c<space> or <leader>ci)
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

" Exit terminal mode quicker/easier
:tnoremap <C-[> <C-\><C-n>

" A faster save file
"map <C-[><C-[> :w<CR>

" A faster escape
:imap jj <Esc>

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
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" NERDTree
let g:NERDTreeWinSize = 44
let g:NERDTreeShowHidden = 1
map <C-t> :NERDTreeToggle<CR>

" Ack shortcut
nnoremap <leader>a :Ack!<Space>

" Fugitive (Git) shortcuts
" :Gstatus => -: stage/reset | p: patch | cc: Commit
nmap <leader>gb :Gbrowse<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>du :diffupdate<CR>
nmap <leader>dg :diffget 
nmap <leader>dp :diffput 
nmap <leader>ge :Gedit 

" SuperCollider (SCNvim)
" Note: to start the SC language interpreter, run :SCNvimStart
let g:scnvim_eval_flash_duration = 256
let g:scnvim_eval_flash_repeats = 1
let g:scnvim_postwin_size = 64
let g:scnvim_no_mappings = 1
nmap <leader>l :call scnvim#send_line(0, 0)<CR>
nmap <leader>b :call scnvim#send_block()<CR>
vmap <leader>b :call scnvim#send_selection()<CR>
nmap <leader>ss :call scnvim#hard_stop()<CR>
nmap <CR> :call scnvim#postwindow#toggle()<CR>
highlight SCNvimEval guifg=black guibg=pink ctermfg=black ctermbg=white

" Splits
nmap <leader>h :sp<CR>
nmap <leader>v :vsp<CR>

" Format the entire file
nmap <leader>fef :Neoformat<CR>

" Unhighlight previous search
nnoremap <ESC> :noh<RETURN><ESC>

" Tab between buffers
noremap <tab> :bn<CR><C-t>

" Quit current file
nmap <leader>q <C-t>:bd!<CR><C-t><C-l>

" Create a new buffer/file
nmap <leader>t :new<CR><C-w>o<C-t><C-l>

" Switch buffers
nmap <S-l> :bn<CR>
nmap <S-h> :bp<CR>

" Open the current markdown file in vmd
nmap <leader>md :!vmd % &<CR>

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Open and source Neovim config from inside Neovim
command! Config :e ~/.config/nvim/init.vim
command! Source :source ~/.config/nvim/init.vim
