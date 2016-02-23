set nocompatible

" NeoBundle
"--------------------------------------------------

filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/neobundle.vim.git/
endif

call neobundle#rc(expand('~/.vim/bundle'))

NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

NeoBundle 'tomasr/molokai'

" 括弧を選択できるようにテキストオブジェクトを拡張
" cs{A}{B} と入力することで囲っている{A}を{B}に変えたりできる
" ys{A}{B} と入力することで{A}を{B}で新たに囲える
NeoBundle 'surround.vim'

" U で、UndoTreeを可視化 
NeoBundle 'Gundo'

" Git wrapper
NeoBundle "tpope/vim-fugitive"

" 矩型選択じゃないvisual mode中にIやAが使えるようにする
NeoBundle "kana/vim-niceblock"

" 基本的な設定
"--------------------------------------------------

" ファイル名と内容によってファイルタイプを判別し、
" ファイルタイププラグインを有効にする
filetype indent plugin on

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" バッファが変更されているとき、エラーを表示せずに
" 保存するかどうかの確認を求める
set confirm

" キーコードはすぐにタイムアウトし、マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" オートコマンドを一度全て破棄
autocmd!

" crontabが上手く働かないので、
" tmpとprivate/tmpではバックアップファイルを作成しない
set backupskip=/tmp/*,/private/tmp/*

" 編集
"--------------------------------------------------

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" ページアップ、ダウンを使ったときに、行頭に移動しない
set nostartofline

" 表示
"--------------------------------------------------

" 色付けを有効化
syntax on

" 黒めの背景色を使用
set background=dark

" カラースキム
colorscheme molokai

" 256色表示
set t_Co=256

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2
set statusline=%F%m%r%h%w
set statusline+=%=[FT:%Y][E:%{(&fenc!=''?&fenc:&enc)}][FF:%{&ff}][L:%l\/%L](%P)

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" そしてビジュアルベルも無効化する
set t_vb=

" 全角記号が、半角幅で表示されるのを防ぐ
if exists('&ambiwidth')
    set ambiwidth=double
endif

" 折り畳みをしない
set foldlevel=100

" 補完
"--------------------------------------------------

" コマンドライン補完の拡張モードを無効化する
set nowildmenu

" ファイル名補完時の挙動を設定
" 1度目の<Tab>で共通部分まで補完
" 2度目の<Tab>で、もしくは1度目の<Tab>で共通部分がなかった場合一覧表示
" 3度目の<Tab>で、順番にマッチしたものを補完
set wildmode=longest,list,full

" コメント行が自動で補完されるのを防ぐ
autocmd FileType * set comments=

" 検索
"--------------------------------------------------

" 検索時に大文字・小文字を区別しない
" ただし、検索語に大文字と小文字が混在しているときは区別する
set ignorecase
set smartcase

" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch

" <C-L>で検索語の強調表示を解除する
nnoremap <C-L> :nohlsearch<CR><C-L>

" インデント
"--------------------------------------------------

" スマートインデントを有効化
set smartindent

" オートインデントを有効化
set autoindent

" タブ幅の設定
" tabstop     <Tab>文字を、画面上の見た目で何文字分で表示するか
" shiftwidth  自動的に挿入されるインデントの幅
" softtabstop  <Tab>押下時に挿入される文字幅を設定
"             ( 0の場合、tabstopで指定された数になる )
set tabstop=8
set shiftwidth=4
set softtabstop=4

" タブ入力をスペースに変換
set expandtab

" 文字コード
"--------------------------------------------------

" Vimが内部で用いるエンコーディング
set encoding=utf-8

" ファイルに保存するときのエンコーディング
set fileencoding=utf-8

" マッピング
"--------------------------------------------------

" Quick :help
nnoremap <C-h> :<C-u>help<Space>

nnoremap ; :
nnoremap : ;

" 表示行単位で移動する
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" gcで最後に変更が行われたテキストを選択を可能にする
" ちなみに最後にビジュアルモードで選択された領域を選択するのはgv
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

" Yの動作をDやCの動作とあわせる
map Y y$

" インサートモードでの<C-w>と<C-u>のUndoを可能にする
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" 縦分割gf
nnoremap gs :vertical wincmd f<CR>

" カーソルを自動的に()の中へ
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>

" コマンドラインモードでemacs keybind
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-h> <Backspace>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" その他
"--------------------------------------------------

" .vimrcをリロードするコマンドを定義
" :ReloadVimrc<Return>でリロード
command! ReloadVimrc source $MYVIMRC

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 無限Undo
" ~/.vim/undo
if has('persistent_undo')
    set undodir=~/.vimundo
    set undofile
endif

" Ruby
"--------------------------------------------------

" Rubyの場合タブ幅を2にする
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType eruby setlocal tabstop=2 shiftwidth=2 expandtab

" HTML
"--------------------------------------------------

" 相対URLのファイルをgfで開く
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType php setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType scss setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab

" Objective-C
"--------------------------------------------------

".mがObjective-Cのファイルとして認識されるように設定する
let g:filetype_m = 'objc'

" Makefile
"--------------------------------------------------

" makeの場合、expandtabを使わない
autocmd FileType make setlocal noexpandtab

" OpenCL
"--------------------------------------------------

" Syntax
autocmd BufRead,BufNewFile *.cl set filetype=opencl
" Indent
autocmd FileType opencl set cindent

" Tex 
"--------------------------------------------------

autocmd FileType tex setlocal tabstop=2 shiftwidth=2 expandtab

" Haskell
"--------------------------------------------------

autocmd FileType haskell setlocal tabstop=2 shiftwidth=2 expandtab

" ChangeLog
"--------------------------------------------------
" \oと入力

" 日付のフォーマットを設定
let g:changelog_dataformat = "%Y-%m-%d"

" 使用する名前を設定
let g:changelog_username = "Daichi TOMA <amothic@gmail.com>"

" Gundo
"--------------------------------------------------

" Uで、Undo Treeを表示するように設定
nnoremap U :<C-u>GundoToggle<CR>

" vimdiff
"--------------------------------------------------

hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7
