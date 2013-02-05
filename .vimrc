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

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'

" 使用するプラグイン
" GNU Globalのためのプラグイン
" :Gtags 関数名			定義へジャンプ
" :Gtags -r 関数名		参照へジャンプ
" :Gtags -f ファイル名  関数一覧を表示
" :Gtags -g 文字列		ソースコード内のgrep
" :GtagsCursor			カーソル位置の関数の定義、もしくは参照へジャンプ
NeoBundle 'gtags.vim'

" 括弧を選択できるようにテキストオブジェクトを拡張
" cs{A}{B} と入力することで囲っている{A}を{B}に変えたりできる。
NeoBundle 'surround.vim'

" プログラムをvim上から\rと入力することで即座に実行
NeoBundle 'thinca/quickrun.vim'

" 自動で補完する
" NeoBundle 'AutoComplPop'

" 現在開いているファイルを
" :e sudo:%
" と入力することでsudo権限で開きなおす
" :w |sudo tee >/dev/null %
" :w |sudo tee %
" と同じ
" NeoBundle 'sudo.vim'

" U で、UndoTreeを可視化 
NeoBundle 'Gundo'

" Alternate Files quickly (.c --> .h etc)
" :A or :AS or :AV etc
NeoBundle 'a.vim'

" OpenCL
" NeoBundle 'opencl.vim--Wierzowiecki'

" Scratch buffer
NeoBundle 'scratch.vim'

" Haskell
NeoBundle 'dag/vim2hs.git'

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

" 白めの背景色を使用
" set background=light

" カラースキム
colorscheme desert

" 256色表示
set t_Co=256

" 16色表示
" set t_Co=16

" 行番号を表示
" set number

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2
set statusline=%F%m%r%h%w%=\ %{'[E:'.(&fenc!=''?&fenc:&enc).'][F:'.&ff.']'}[L:%04l\/%04L]

" コマンドラインの高さを2行に
set cmdheight=2

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

" インデント
"--------------------------------------------------

" スマートインデントを有効化
set smartindent

" オートインデントを有効化
set autoindent

" タブ幅の設定
" tabstop		<Tab>文字を、画面上の見た目で何文字分で表示するか
" shiftwidth	自動的に挿入されるインデントの幅
" softtabstop	<Tab>押下時に挿入される文字幅を設定
" 				（0の場合、tabstopで指定された数になる）
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

" 文字エンコーディングを指定して、ファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8

command! Jis Iso2022jp
command! Sjis Cp932


" マッピング
"--------------------------------------------------

" Quick :help
nnoremap <C-h> :<C-u>help<Space>

" :と;を置き換える
" noremap ; :
" noremap : ;

" 'と`を置き換える
" noremap ' `
" noremap ` '

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

" <C-L>で検索語の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>

" ノーマルモードでEnterを入力するだけで空行を挿入する
noremap <CR> o<ESC>

" インサートモードでの<C-w>と<C-u>のUndoを可能にする
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" カーソルを自動的に()の中へ
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

" 矩形選択
"--------------------------------------------------

vnoremap <expr> I  <SID>force_blockwise_visual('I')
vnoremap <expr> A  <SID>force_blockwise_visual('A')

function! s:force_blockwise_visual(next_key)
    if mode() ==# 'v'
        return "\<C-v>" . a:next_key
    elseif mode() ==# 'V'
        return "\<C-v>0o$" . a:next_key
    else  " mode() ==# "\<C-v>"
        return a:next_key
    endif
endfunction

" Ruby
"--------------------------------------------------

" Rubyの場合タブ幅を2にする（タブの代わりにスペースを利用）
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


" その他
"--------------------------------------------------

" ctagsのタグを上の階層まで探索するように設定する
set tags=tags;

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

" Gnu Global (Gtags)
"--------------------------------------------------
nnoremap <C-j> :<C-u>cn<CR>
nnoremap <C-k> :<C-u>cp<CR>
nnoremap <C-t> :<C-u>GtagsCursor<CR>

" ChangeLog
"--------------------------------------------------
" \oと入力

" 日付のフォーマットを設定
let g:changelog_dataformat = "%Y-%m-%d"

" 使用する名前を設定
let g:changelog_username = "Daichi TOMA <toma@cr.ie.u-ryukyu.ac.jp>"

" エントリを作成するときの書式
" let g:changelog_new_date_format = "%d %u\n\n\t%c\n\n"

" 新しいアイテムを作成するときの書式
" let g:changelog_new_entry_format = "\t%c"

" surround
"--------------------------------------------------

" デフォルトの設定で新たに囲むのはysだが、sで囲めるようにする。
" s{motion}{A}で、{motion}を{A}で囲む
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround

" QuickRun
"--------------------------------------------------

" \rでvim内で実行するが、
" \Rの場合、shellで実行するように設定
nnoremap <Leader>R :QuickRun -runner shell<CR>

" Gundo
"--------------------------------------------------

" Uで、Undo Treeを表示するように設定
nnoremap U :<C-u>GundoToggle<CR>

" AutoComplPop
"--------------------------------------------------

" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 0
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 0
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3

" Define file-type dependent dictionaries.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : ',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"    \ }'

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()


" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
