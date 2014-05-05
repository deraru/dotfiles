if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'vim-scripts/wombat256.vim'

NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/YankRing.vim'

NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'autoload': {
    \   'insert': 1,
    \ }}

" Ruby
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'vim-ruby/vim-ruby'

" Python
NeoBundle 'nvie/vim-flake8'

filetype plugin indent on " ファイルタイプ自動検出有効、ファイルタイプ変更時のファイルタイププラグイン自動読み込み有効、ファイルタイプ変更時のインデント設定自動読み込み有効

NeoBundleCheck

" カラースキーマ
colorscheme wombat256mod
set background=light
syntax on "カラー強調

" エンコーディング
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

" バックアップ系を無効
set nowritebackup
set nobackup
set noswapfile

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

set wildmenu "コマンドライン補完が拡張モードで行われる
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

" neocompleteキーマップ
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-c> neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplete#smart_close_popup() . "\<C-h>"
inoremap <expr><C-e> neocomplete#cancel_popup()

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

" NERDTreeを自動で起動
autocmd VimEnter * NERDTree

" \nでNERDTreeを開閉
nnoremap <Leader>n :NERDTreeToggle<CR>

" indentguide設定
let g:indent_guides_auto_colors = 0 " デフォルトの色を無効
hi IndentGuidesOdd ctermbg=lightgrey
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_enable_on_vim_startup = 1 " 起動時に有効
let g:indent_guides_start_level = 2 " 2つ目のインデントから有効
let g:indent_guides_guide_size = 1 " 幅

" lightline設定
let g:lightline = {
    \ 'colorscheme' : 'wombat',
    \ 'active' : {
    \   'left' : [ [ 'mode', 'paste' ],
    \           [ 'fugitive', 'filename' ] ]
    \ },
    \ 'component_function' : {
    \   'fugitive' : 'MyFugitive',
    \   'readonly' : 'MyReadonly',
    \   'modified' : 'MyModified',
    \   'filename' : 'MyFilename'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' }
    \ }

function! MyFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! MyReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "x"
    else
        return ""
    endif
endfunction

function! MyModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \   ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \   ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

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

" neocomplete設定
let g:neocomplete#enable_at_startup = 1 " neocompleteを自動起動
let g:neocomplete#force_overwrite_completefunc = 1 " vim-railsのバグによる
let g:neocomplete#enable_smart_case = 1 "大文字を含む検索時に大文字小文字を区別する
let g:neocomplete#sources#syntax#min_keyword_length = 3 " 3文字目から補完
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default': '',
    \ 'vimshell': $HOME.'/.vimshell_hist',
    \ 'scheme': $HOME.'/.gosh_completions'
    \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType coffee setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
