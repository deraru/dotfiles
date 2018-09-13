" Skip initialization for vim-tiny or vim-small
if 0 | endif

set encoding=utf-8
scriptencoding utf-8

if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim/
endif

if dein#load_state('~/.vim/bundles')
    call dein#begin('~/.vim/bundles')

    call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

    call dein#add('vim-scripts/wombat256.vim') " カラースキーマ
    call dein#add('itchyny/lightline.vim') " Statusline表示
    call dein#add('Yggdroot/indentLine') " インデント可視化
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'}) " コマンドの非同期実行。使われてる
    call dein#add('tpope/vim-fugitive') " :G~ でGitコマンド。使われてる
    call dein#add('tpope/vim-surround') " テキストを選んで S~ で括弧とかつけてくれる。使う
    call dein#add('Raimondi/delimitMate') " 自動で閉じ括弧とかつけてくれる。使う
    call dein#add('tpope/vim-endwise.git') " 自動でendとかつけてくれる。使う
    call dein#add('gabesoft/vim-ags') " :Ags で検索。使う
    call dein#add('LeafCage/yankround.vim') " コピペの履歴たどれる。使う
    call dein#add('ctrlpvim/ctrlp.vim') " ファイル検索。使う
    call dein#add('scrooloose/nerdtree') " エクスプローラ。使う
    call dein#add('vim-scripts/Align') " :Align でテキスト整形。あまり使わない

    " HTML, CSS. JavaScript
    call dein#add('othree/html5.vim')
    call dein#add('mattn/emmet-vim')
    call dein#add('pangloss/vim-javascript')
    call dein#add('jelera/vim-javascript-syntax')
    call dein#add('othree/javascript-libraries-syntax.vim')

    " Ruby, Rails
    call dein#add('vim-ruby/vim-ruby')
    call dein#add('tpope/vim-rails.git')
    call dein#add('slim-template/vim-slim.git')
    call dein#add('vim-scripts/dbext.vim')

    " Elixir
    call dein#add('elixir-lang/vim-elixir')

    " Go
    call dein#add('fatih/vim-go')

    " Terraform
    call dein#add('vim-scripts/vim-terraform')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on " ファイルタイプ自動検出有効、ファイルタイプ変更時のファイルタイププラグイン自動読み込み有効、ファイルタイプ変更時のインデント設定自動読み込み有効
syntax enable "カラー強調

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" 色の設定
colorscheme wombat256mod
set background=dark

" エンコーディング
set fileencoding=utf-8 "保存時の文字コード
set fileencodings=ucs-bom,utf-8 "文字コード自動判別
set fileformats=unix,dos,mac "改行コードの自動判別

" バックアップ系を無効
set nowritebackup
set nobackup
set noswapfile

" Undoファイルの保存先
set undofile
set undodir=~/var/vim/undo

" 検索系
set ignorecase "小文字で検索時に大文字小文字を区別しない
set smartcase "大文字を含む検索時に大文字小文字を区別する
set incsearch "文字入力時点で検索開始
set wrapscan "検索時にファイルの末尾までいったらまた先頭から
set nohlsearch "検索結果をハイライトしない

" タブとインデント
set expandtab "タブ使用時に代わりに空白を使用
set tabstop=4 "タブ文字数
set shiftwidth=4 "インデント文字数
set softtabstop=4 "タブ使用時のタブ文字数
set shiftround "<と>でインデント時に、shiftwidthに合うように自動で調節する
set autoindent "新しい行の時に自動でインデント

" 基本的な画面表示系
set number "行番号を表示
set ruler "カーソル位置を表示
set showtabline=2 "タブラインを常時表示"
set laststatus=2 "ステータス行を常時表示
set showcmd "コマンドを最下行に表示
set list "Listモードを有効
set listchars=tab:»-,extends:»,trail:-,precedes:«,nbsp:%,eol:↲ "Listモードで使われる文字
set cursorline " カーソル行をハイライト
set showmatch "括弧が入力された時に、対応する括弧を強調
set matchtime=3 "括弧の強調時間を3秒にする
set matchpairs& matchpairs+=<:> " 括弧の組み合わせを追加

" 1行の設定
set wrap "右端で折り返して表示
set textwidth=0 "自動改行の挿入を無効

" カーソル系
set scrolloff=5 "カーソル上下の行数

set backspace=indent,eol,start
set wildmenu "コマンドライン補完が拡張モードで行われる
set history=5000 "保存するコマンド履歴数
set hidden "編集中の内容を保ったまま別の画面に切替えられるようにする
set visualbell t_vb= " エラー時にビープ音を出さない

" ウィンドウ移動時のカーソル行のハイライトを切り替え
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" クリップボードをデフォルトのレジスタとして使用
" YankRing判定
if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus, unnamed
else
  set clipboard& clipboard+=unnamed
endif

" F1もESCにする
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" 検索結果の移動時に常に中央に表示
nnoremap n nzz
nnoremap N Nzz

" 折り返した行でもj, kで移動
nnoremap j gj
nnoremap k gk

" Enterで一行挿入
nnoremap <CR> o<ESC>

" split移動を簡単に
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ウィンドウサイズ調整
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-

" ;を:に
nnoremap ; :

" 素早くjjでエスケープ
inoremap <silent> jj <ESC>l

" インサートモードでカーソル移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" yankround.vimキーマップ
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" vvで行末まで選択
vnoremap v $h

" タブページ移動を簡単に
nnoremap [Tag] <Nop>
nmap t [Tag]
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor
map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>

" \nでNERD Treeを開閉
nnoremap <Leader>n :NERDTreeToggle<CR>

" Space sでCtrlPを起動
nnoremap <Space>s :CtrlP<CR>

" lightline設定
let g:lightline = {
    \ 'colorscheme' : 'wombat',
    \ 'active' : {
    \   'left' : [ [ 'mode', 'paste' ],
    \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function' : {
    \   'gitbranch' : 'fugitive#head'
    \ }
    \ }

" 存在しないディレクトリの自動作成
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
      \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

" ctrlp設定
let g:ctrlp_use_caching=0
let g:ctrlp_user_command='ag %s -i --nogroup --nocolor -g ""'
let g:ctrlp_map = '<nop>'
