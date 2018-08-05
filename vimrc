" dliu-vimrc

call plug#begin('~/.vim/bundle')

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'ntpeters/vim-better-whitespace'   " Whitespace highlighting      | https://github.com/ntpeters/vim-better-whitespace
Plug 'vim-airline/vim-airline'          " Status/tabline               | https://github.com/vim-airline/vim-airline
Plug 'tpope/vim-surround'               " Quoting/parenthesizing       | https://github.com/tpope/vim-surround
Plug 'ayu-theme/ayu-vim'                " Ayu color theme              | https://github.com/ayu-theme/ayu-vim
Plug 'vim-python/python-syntax'

call plug#end()

let ayucolor='dark'
let g:better_whitespace_enabled=1
let g:python_highlight_all=1

syntax on
colorscheme ayu
" colorscheme desert
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
"set cursorline                   " Highlight current line
"set cursorcolumn                 " Highlight current column
set termguicolors                 " Use 24-bit colors
set colorcolumn=80,100            " Ruler at line numbers
set backspace=indent,eol,start    " Allow backspace everywhere
set splitbelow                    " Split under
set splitright                    " Split right
"set clipboard=unnamed             " Yank to clipboard

highlight ColorColumn guibg=#23282C  " Ruler color
highlight ExtraWhitespace guibg=red  " Trailing whitespace color

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Highlight tabs and trailing whitespace with dots
" set list listchars=tab:»·,trail:·

let mapleader=','

" QoL
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Shorcuts
nmap <leader>o :Ex<CR>

" Window splitting/navigation
nmap <silent> <leader>s :split<CR>
nmap <silent> <leader>v :vsplit<CR>
nmap <silent> <leader>c :close<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" FZF
nmap <leader>t :Files<CR>
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
nmap <silent> <leader>w :StripWhitespace<CR>

