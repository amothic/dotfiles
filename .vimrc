" Vi互換モードをオフ（Vimの拡張機能を有効にする）
set nocompatible

" vundle
"--------------------------------------------------

" vundleの設定のために一度filetypeをoffにする
filetype off

" vundleのディレクトリ
set rtp+=~/.vim/vundle.git/

call vundle#rc()

" 使用するプラグイン
Bundle 'gtags.vim'
Bundle 'surround.vim'
Bundle 'quickrun.vim'
Bundle 'sudo.vim'

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

" 行番号を表示
set number

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2

" コマンドラインの高さを2行に
set cmdheight=2

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" そしてビジュアルベルも無効化する
set t_vb=

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

" オートインデントを有効化
set autoindent

" タブ幅の設定
" tabstop		<Tab>文字を、画面上の見た目で何文字分で表示するか
" shiftwidth	自動的に挿入されるインデントの幅
" softtabstop	<Tab>押下時に挿入される文字幅を設定
" 				（0の場合、tabstopで指定された数になる）
set tabstop=4
set shiftwidth=4
set softtabstop=0

" 文字コード
"--------------------------------------------------

" Vimが内部で用いるエンコーディング
set encoding=utf-8


" マッピング
"--------------------------------------------------

" Quick :help
nnoremap <C-h> :<C-u>help<Space>

" :と;を置き換える
noremap ; :
noremap : ;

" 'と`を置き換える
noremap ' `
noremap ` '

" Yの動作をDやCの動作とあわせる
map Y y$

" <C-L>で検索語の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>

" ノーマルモードでEnterを入力するだけで空行を挿入する
noremap <CR> o<ESC>

" インサートモードでの<C-w>と<C-u>のUndoを可能にする
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" Ruby
"--------------------------------------------------

" Rubyの場合タブ幅を2にする（タブの代わりにスペースを利用）
au FileType ruby set tabstop=2 shiftwidth=2 expandtab

" HTML 
"--------------------------------------------------

" HTMLの場合タブ幅を2にする（タブの代わりにスペースを利用）
au FileType html set tabstop=2 shiftwidth=2 expandtab

" Objective-C
"--------------------------------------------------

".mがObjective-Cのファイルとして認識されるように設定する
let g:filetype_m = 'objc'

" その他
"--------------------------------------------------

" ctagsのタグを上の階層まで探索するように設定する
set tags=tags;

" .vimrcをリロードするコマンドを定義
" :ReloadVimrc<Return>でリロード
command! ReloadVimrc source $MYVIMRC


" QuickRun
"--------------------------------------------------

" \rでvim内で実行するが、
" \Rの場合、shellで実行するように設定
nnoremap <Leader>R :QuickRun -runner shell<CR>
