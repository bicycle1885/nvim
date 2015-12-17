syntax on
filetype plugin indent on

call plug#begin()

Plug 'w0ng/vim-hybrid'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'JuliaLang/julia-vim'

call plug#end()

set ignorecase
set smartcase
set tags=./tags;/
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«
set number
set relativenumber
set cursorline
set background=dark
set hlsearch
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set hidden
set noswapfile
set clipboard=unnamed

colorscheme hybrid

" use the space key as <Leader>
let mapleader=" "

let g:unite_enable_start_insert=1
let g:vimfiler_as_default_explorer = 1
let g:deoplete#enable_at_startup = 1

" move down/up as I see (normal and visual mode)
noremap j gj
noremap k gk
" edit init.vim
nnoremap <silent> <f1> :e ~/.config/nvim/init.vim<cr>
" send file to REPL
nnoremap <silent> <f9> :TREPLSendFile<cr>
" send line to REPL (normal mode)
nnoremap <silent> <Enter> :TREPLSend<cr><cr>
" send line to REPL (visual mode)
vnoremap <silent> <Enter> :TREPLSend<cr>
" open vimfiler on a left side
nnoremap <silent> <Leader>f :VimFiler -toggle -status -split -simple -winwidth=35 -no-quit<CR>
" open unite pane (simple)
nnoremap <silent> <Leader>u :Unite buffer file_rec/git file           -start-insert<CR>
" open unite pane (verbose)
nnoremap <silent> <Leader>U :Unite buffer file_rec/git file_rec/neovim -start-insert<CR>
" Git commands
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gv :Gitv<CR>
" escape from the terminal mode
tnoremap <Esc> <C-\><C-n>
