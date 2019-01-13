"---------------------
" 文字
"---------------------
" 読み込み時の文字コード
set encoding=utf-8
" Vim Script内でマルチバイトを使う場合
scriptencoding utf-8
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac

"---------------------
" 行
"---------------------
" 行数表示
set number
" 折り返し
set wrap

"---------------------
" インデント（Go向け）
"---------------------
set noexpandtab
set tabstop=4
set shiftwidth=4
set autoindent

"---------------------
" 作らない系
"---------------------
"スワップファイルを作らない
set noswapfile
"バックアップファイルを作らない
set nobackup
"undoファイルを作らない
set noundofile

"---------------------
" その他
"---------------------
" クリップボードの共有
set clipboard=unnamed
" イントロダクション非表示
set shortmess+=I

"####################################
"            deinの設定
"####################################

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.config/nvim/dein')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
