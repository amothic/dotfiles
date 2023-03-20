if &compatible
  set nocompatible
endif

" Vim Plugin
"--------------------------------------------------
let s:dein_dir = expand('~/.vim/bundle')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

let s:dein_toml = '~/.vim/dein.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:dein_toml, {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif

if !has('vim_starting') && dein#check_install()
  call dein#install()
endif

" General Settings
"--------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8

filetype plugin indent on

set hidden
set confirm

" persistent undo
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif

set notimeout ttimeout ttimeoutlen=200

set backspace=indent,eol,start
set nostartofline

" Display
"--------------------------------------------------
syntax enable
colorscheme darcula
set t_Co=256
set ruler
set laststatus=2
set statusline=%F%m%r%h%w
set statusline+=%=[FT:%Y][E:%{(&fenc!=''?&fenc:&enc)}][FF:%{&ff}][L:%l\/%L](%P)

set showcmd

" Ignoring bell
set visualbell
set t_vb=

" for Double-byte symbol
if exists('&ambiwidth')
    set ambiwidth=double
endif

set foldlevel=100

set list
set listchars=tab:»-,trail:-

" Key Mapping
"--------------------------------------------------
nnoremap Y y$
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" emacs keybind in command line mode
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-h> <Backspace>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" Indent
"--------------------------------------------------
set smartindent
set autoindent

set expandtab

set tabstop=8
set shiftwidth=2

" Search
"--------------------------------------------------
set ignorecase
set smartcase

set hlsearch

nnoremap <C-L> :nohlsearch<CR><C-L>

" Complement
"--------------------------------------------------
set nowildmenu
set wildmode=longest,list,full
autocmd FileType * set comments=

" Go
"--------------------------------------------------
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" Makefile
"--------------------------------------------------
autocmd FileType make setlocal noexpandtab

" HTML
"--------------------------------------------------
" Open a file with a relative URL with gf
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

" crontab
"--------------------------------------------------
set backupskip=/tmp/*,/private/tmp/*

" copilot
"--------------------------------------------------
let g:copilot_filetypes = {
    \ 'gitcommit': v:true,
    \ 'markdown': v:true,
    \ 'yaml': v:true
    \ }

autocmd BufReadPre *
    \ let f=getfsize(expand("<afile>"))
    \ | if f > 100000 || f == -2
    \ | let b:copilot_enabled = v:false
    \ | endif
