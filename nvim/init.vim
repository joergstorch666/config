call plug#begin('~/.vim/plugged')

" fuzzy file finder
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Proxma/vim-hug-neovim-rpc'
endif

" autocompletion
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"And while installed coc it is possible to add extensions (language servers) into it. Simply use :CocInstall extension-name. Here are my extensions i've installed:
"coc-tsserver        " javascript/typescript server - completion, refactor etc
"coc-tslint-plugin   " javascript/tyescript linting
"coc-snippets        " provides snippets engine as in vscode (see my previous article)
"coc-highlight       " provides basic highlight of words selected
"coc-emmet           " emmet! works as in vscode
"coc-marketplace     " marketplace to simplify search and installation of coc extensions
"coc-html            " html - completion, refactor etc
"coc-json            " json - completion, refactor etc
"coc-vetur           " famous vscode plugin - completion,refactor,linting and much more
"coc-css             " css

" Tests runner (Jest)
Plug 'janko-m/vim-test'
Plug 'herringtondarkholme/yats.vim'                         " Typescript syntax
Plug 'posva/vim-vue'                                        " Vue JS syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'                             " JSX syntax
Plug 'prettier/vim-prettier'                                " Prettier - automatically format file according to rules/editorconfig
Plug 'othree/xml.vim'                                       " to work with HTML/XML tags, see https://www.vim.org/scripts/script.php?script_id=1397
Plug 'othree/html5.vim'                                     " html5
Plug 'cakebaker/scss-syntax.vim'

" airline and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" auto pairs
Plug 'jiangmiao/auto-pairs'

" nerd commenter
Plug 'scrooloose/nerdcommenter'

" nerd tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" highlighted yank
Plug 'machakann/vim-highlightedyank'

" vim surround
Plug 'tpope/vim-surround'

" Git wrapper, execute git commant from vim
Plug 'tpope/vim-fugitive'

" git gutter
Plug 'airblade/vim-gitgutter'

" emmet
Plug 'mattn/emmet-vim'

" easy motion
Plug 'easymotion/vim-easymotion'

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" vue
Plug 'leafoftree/vim-vue-plugin'

" theme
Plug 'iCyMind/NeoSolarized'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'matthewbdaly/vim-filetype-settings'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

"set backspace=indent,eol,start
set number
set relativenumber
syntax on
set noshowmode
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
set clipboard=unnamedplus
set termguicolors
set background=dark
colorscheme NeoSolarized

let mapleader="\<SPACE>"
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:highlightedyank_highlight_duration = 1000
map <Leader> <Plug>(e" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)asymotion-prefix)
let g:EasyMotion_keys='asfghjklöqwertuiop'

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" dont use arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" remap buffer with leader
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" auto normal mode after 5 seconds
autocmd CursorHoldI * stopinsert

" --- Prettier ---
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" --- Deoplete ---
"let g:deoplete#enable_at_startup = 1
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" --- NerdTree ---
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
" Show hidden files/directories
let g:NERDTreeShowHidden = 1
" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1"
" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]','\.idea$[[dir]]', '\.sass-cache$', '^node_modules$']
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" --- Denite settings ---
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git', '!node_modules'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')"

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ ',
\ 'statusline': 0,
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap <leader>o :Denite buffer<CR>
nmap <leader>p :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
        \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
        \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
        \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
        \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
        \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
        \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
        \ denite#do_map('do_action', 'split')
endfunction
