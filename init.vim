syntax on
filetype plugin indent on

" manage plugins using vim-plug (https://github.com/junegunn/vim-plug)
call plug#begin()
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'w0ng/vim-hybrid'
Plug 'itchyny/lightline.vim'
Plug 'JuliaLang/julia-vim'
call plug#end()

" sensible settings
set ignorecase
set smartcase
set tags=./tags;/
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«
set number
set relativenumber
set cursorline
set ruler
set background=dark
set hlsearch
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set hidden
set noswapfile
set clipboard=unnamed
if executable("ag")
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
endif

" the best colorscheme
colorscheme hybrid

" use the space key as <leader>
let mapleader=" "

" plugin settings
let g:unite_enable_start_insert = 1
let g:vimfiler_as_default_explorer = 1
let g:deoplete#enable_at_startup = 1
let g:lightline = { 'colorscheme' : 'jellybeans' }
let g:latex_to_unicode_file_types = ".*"

" open quickfix window after :grep
autocmd QuickFixCmdPost *grep* cwindow
" check spell when writing a commit log
autocmd FileType gitcommit setlocal spell spelllang=en_us

" key mappings
" move down/up as I see (normal and visual mode)
noremap j gj
noremap k gk
" edit init.vim
nnoremap <silent> <f1> :e ~/.config/nvim/init.vim<cr>
" stop highlighting
nnoremap <silent> <Esc><Esc> :nohlsearch<cr>
" send file to REPL
nnoremap <silent> <f9> :TREPLSendFile<cr>
" send line(s) to REPL when hitting enter
autocmd FileType julia nnoremap <buffer> <silent> <enter> :TREPLSend<cr><cr>
autocmd FileType julia vnoremap <buffer> <silent> <enter> :TREPLSend<cr>
" open vimfiler on a left side
nnoremap <silent> <leader>f :VimFiler -toggle -status -split -simple -winwidth=35 -no-quit<cr>
" open unite pane (simple)
nnoremap <silent> <leader>u :Unite buffer file_rec/git file -start-insert<cr>
" open unite pane (verbose)
nnoremap <silent> <leader>U :Unite buffer file_rec/git file_rec/neovim -start-insert<cr>
" git commands
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gs :Gstatus<cr>
" bash-like cursor movement
cnoremap <C-f> <right>
cnoremap <C-b> <left>
" escape from the terminal mode
tnoremap <esc> <C-\><C-n>
