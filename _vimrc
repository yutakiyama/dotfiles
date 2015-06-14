" neobundle settings {{{
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
NeoBundleFetch 'Shougo/neobundle.vim'
"↓こんな感じが基本の書き方
NeoBundle 'nanotech/jellybeans.vim'
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
"" ウィンドウを分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-J>
"unite#do_action('split')
"vau FileType unite inoremap <silent> <buffer> <expr> <C-J>
"unite#do_action('split')
"" ウィンドウを縦に分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-K>
"unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-K>
"unite#do_action('vsplit')
"" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""""

" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" Emmet ex) ul>li*5>a → <C-Y>
NeoBundle 'mattn/emmet-vim'
" html5のコードをシンタックス表示する
NeoBundle 'taichouchou2/html5.vim'
" css3シンタックス
NeoBundle 'hail2u/vim-css3-syntax'



" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on
" どうせだから jellybeans カラースキーマを使ってみましょう
set t_Co=256
syntax on
colorscheme jellybeans
set cursorline
" カーソルの位置表示を行う
filetype plugin indent on
" エンコーディングを UTF-8 にする
set encoding=utf-8
" 行番号を表示する
set number
" タブをスペースに変換する
set expandtab
" 検索語句のハイライト
set hlsearch
" 括弧の対応関係を一瞬表示する
set showmatch
" 入力中のコマンドを表示する
set showcmd
" 検索時に英大小文字の区別を無視する
set ignorecase
" 検索時に全て英小文字で入力した場合のみ区別を無視する
" set smartcase
" 検索した際に最後の語句の次に最初の語句にループしないようにする
set nowrapscan
" インクリメンタルサーチしない
" set noincsearch
" バックスペース押下時の挙動を変更する
" バックスペースキーを押した時は多くの場面で「手前の文字を消しつつ 1
" 文字分左に移動して欲しい」と思うのだが、 OS X デフォルトの Vim
" などではこういった挙動になっていない。その為以下のように記述する
set backspace=indent,eol,start
" Vim で yank したテキストをクリップボードに格納する
set clipboard=unnamed,autoselect
" 不可視文字を表示する
set list  " 不可視文字を表示する
set listchars=tab:>-,trail:.  " タブを >--- 半スペを . で表示する
" 全角スペースも可視化する(Ricty使っているのでいらないかもしれない。)
"augroup highlightIdegraphicSpace
"	autocmd!
"	autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
"	autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"augroup END
