set encoding=utf-8
scriptencoding utf-8

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=1
set autoindent
set smartindent
set t_BE=

"""""""""""""
" neobundle "
"""""""""""""
if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------------------
" ここに追加したいVimプラグインを記述する・・・・・・②
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Yggdroot/indentLine'

" カラースキーム
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'ayu-theme/ayu-vim'

" sytax check
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'elzr/vim-json'

" auto paste mode
NeoBundle 'ConradIrwin/vim-bracketed-paste'

" auto close
NeoBundle 'Townk/vim-autoclose'

" jedi
" NeoBundle 'davidhalter/jedi-vim'

"----------------------------------------------------------
call neobundle#end()


" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定・・・・・・③
NeoBundleCheck

"----------------------------------------------------------
" ステータスラインの設定
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

syntax enable
let g:python_highlight_all = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_error_symbol = '❗'
let g:syntastic_style_error_symbol = '❗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_javascript_checkers = ['eslint']
let g:vim_json_syntax_conceal = 0

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ここにpluginの設定を書く
Plugin 'JuliaLang/julia-vim'

call vundle#end()
filetype plugin indent on
