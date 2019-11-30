call plug#begin('~/.vim/plugged')

" fuzzy file finder
if has('nvim')
	Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/denite.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" airline and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" auto pairs
Plug 'jiangmiao/auto-pairs'

" nerd commenter
Plug 'scrooloose/nerdcommenter'

" nerd tree
Plug 'scrooloose/nerdtree'

" highlighted yank
Plug 'machakann/vim-highlightedyank'

" vim surround
Plug 'tpope/vim-surround'

" git gutter
Plug 'airblade/vim-gitgutter'

" theme
Plug 'iCyMind/NeoSolarized'

call plug#end()

set number
set relativenumber
"set noshowmode
set gdefault
set cursorline
set smartcase
set ignorecase
set mouse=a
set showmatch
set fileencoding=utf-8
set wrap
set linebreak
set list
set hidden
set splitright
set splitbelow
set inccommand=nosplit
set undofile
set breakindent
set smartindent
set expandtab
set shiftwidth=2
set termguicolors
set background=dark
colorscheme NeoSolarized

" leader key
let mapleader="\<SPACE>"

let g:deoplete#enable_at_startup = 0
let g:airline#extensions#tabline#enabled = 1
let g:highlightedyank_highlight_duration = 1000

" deoplete mapping
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" nerd tree
nnoremap <LEADER>t :NERDTreeToggle<CR>

" dont use arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>


" Denite settings
"call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
"call denite#custom#option('default', 'prompt', 'λ')
"call denite#custom#var('grep', 'command', ['ag'])
"call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'pattern_opt', [])
"call denite#custom#var('grep', 'separator', ['--'])
"call denite#custom#var('grep', 'final_opts', [])
"call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
"call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
"      \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc', 'node_modules/',
"      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png'])

nmap <LEADER>p :Denite -start-filter file/rec<CR>
nmap <LEADER>b :Denite buffer<CR>
nnoremap \ :Denite grep<CR>
