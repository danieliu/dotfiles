" dliu-vimrc

call plug#begin('~/.vim/bundle')

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'   " whitespace highlighting
Plug 'vim-airline/vim-airline'          " status/tabline
Plug 'tpope/vim-surround'               " quoting/parenthesizing
Plug 'tpope/vim-fugitive'               " git things
Plug 'tpope/vim-repeat'                 " dot commands for plugins
Plug 'dense-analysis/ale'               " async lint
Plug 'junegunn/vim-easy-align'

" clj
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-fireplace'

" lang/syntax
Plug 'vim-python/python-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'mitsuhiko/vim-jinja'
Plug 'elzr/vim-json'
Plug 'othree/yajs'
Plug 'mxw/vim-jsx'
Plug 'keith/swift.vim'
Plug 'jparise/vim-graphql'

Plug 'psf/black', { 'for': 'python' }

" theme
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'

call plug#end()

let ayucolor='dark'
let g:better_whitespace_enabled=1
let g:python_highlight_all=1
let g:gruvbox_contrast_dark='hard'

let g:airline#extensions#tabline#enabled = 1

" ALE options
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=0
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] (%severity%) %code%: %s'
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" airline
let g:airline#extensions#tabline#enabled=1

" black
let g:black_skip_string_normalization=0

syntax on
colorscheme gruvbox
filetype plugin indent on

set showcmd                       " Display incomplete commands
set hlsearch                      " Highlight search matches
set incsearch                     " Highlight matches while typing
set ignorecase                    " Case insensitive if search is all lowercase
set smartcase                     " Case sensitive if search has uppercase
set laststatus=2                  " Display status line always
set number                        " Show line numbers
set scroll=15                     " Number of lines to scroll on C-d or C-u
set scrolloff=3                   " Show number of lines around cursor at top/bottom of screen
set expandtab                     " Convert tabs to spaces
set tabstop=4                     " Set tab size in spaces (manual indent)
set shiftwidth=4                  " Set tab size in spaces (auto indent)
set termguicolors                 " Use 24-bit colors
set colorcolumn=80,88,100         " Ruler at line numbers
set backspace=indent,eol,start    " Allow backspace everywhere
set splitbelow                    " Split under
set splitright                    " Split right
set list                          " show listchars
set listchars=tab:»·,space:·      " show spaces as .
set tags=tags
set timeoutlen=1000
set ttimeoutlen=10
set directory=$HOME/.vimswap//
set cursorline

highlight ColorColumn guibg=#23282C  " Ruler color
highlight ExtraWhitespace guibg=red  " Trailing whitespace color

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal noexpandtab
autocmd BufNewFile,BufRead *.sls set syntax=yaml
autocmd BufNewFile,BufRead *.arc* set syntax=json
autocmd BufNewFile,BufRead *.coffee set syntax=javascript
autocmd BufNewFile,BufRead Jenkinsfile set syntax=groovy
autocmd BufNewFile,BufRead *.toml set syntax=cfg
autocmd BufNewFile,BufRead .env.local set syntax=sh

" prevent newlines/returns unless super long to remind
" otherwise github commit message when merging ends up with weird line breaks
" 2023-02-07 just set it back to 80 and give control back to vim for newlines
" 2023-08-18 had set this to 88 cuz 80 was too small; github is dumb still and
" no configuration available for textwidths on PRs, so setting to 70 now
autocmd FileType gitcommit setlocal tw=70

let g:vim_json_syntax_conceal=0

" airline
let g:airline#extensions#branch#enabled=0

" vim-markdown
let g:vim_markdown_folding_level=3
let g:vim_markdown_folding_disabled=1

let mapleader=','

" QoL
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap n nzz
nnoremap N Nzz

" Shorcuts
nmap <leader>o :Ex<CR>

" coc
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)

" Window splitting/navigation
nmap <silent> <leader>s :split<CR>
nmap <silent> <leader>v :vsplit<CR>
nmap <silent> <leader>c :close<CR>
nmap <silent> <leader>n :vnew<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Equal window size
nmap <silent> <leader>w= :wincmd =<CR>

" fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Git blame<CR>

" FZF
nmap <leader>t :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>f :Rg<CR>
let g:fzf_layout = { 'down': '~20%' }
" Use ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Esc
inoremap jk <Esc>

" Strip whitespace
nmap <silent> <leader>wt :StripWhitespace<CR>

" ALE
nmap <silent> <leader>b <Plug>(ale_previous_wrap)
nmap <silent> <leader>d <Plug>(ale_next_wrap)
