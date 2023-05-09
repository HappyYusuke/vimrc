"-------------------------------
" 基本設定
"-------------------------------

" あれやこれや
set number " 行番号を表示
set encoding=utf-8 " ファイル読み込み時の文字コードの設定
scriptencoding utf-8 " Vim script内でマルチバイト文字を使う場合の設定
set noswapfile " スワップファイルを作らない
set clipboard=unnamedplus " vimのヤンクで外部にコピペできるように

" 文字コード
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

" タブ・インデント
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅

" 文字列検索
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" カーソル
set cursorline " カーソルラインをハイライト
set whichwrap=b,s,h,l,<,>,[,] " 行頭行末の左右移動で行をまたぐ
set virtualedit=onemore " 行末の1文字先までカーソルを移動できるように
" 行が折返し表示されていた場合、行単位ではなく表示業単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
" 行頭、行末移動
nnoremap <C-h> 0
nnoremap <C-l> $
" ページ移動
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>
" ファイル移動
nnoremap <C-n> <C-^>

" カッコ・タグジャンプ
set showmatch " 括弧の対応関係を一覧表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

" ペースト設定
" クリップボードから普通にペーストすると自動インデントが効いて下に行くほど右にずれていきますが、以下の設定をすることで、クリップぼーどからペーストするときだけインデントしないようにしてくれます.
if $term =~ "xterm"
    let $t_SI .= "\e[?2004h"
    let $t_EI .= "\e[?2004l"
    let $pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"------------------------
" カラースキーム
"------------------------
"syntax enable 
" 構文に色をつける
set t_Co=256

" gruvbox
"set background=dark
"colorscheme gruvbox
"-------
" solarized
"set t_Co=256
"set background=dark
"colorscheme solarized
"-------
" hybrid
"set background=dark
"colorscheme hybrid
"-------
" atom-dark
"colorscheme atom-dark
"colorscheme atom-dark-256
"-------
" tender
"colorscheme tender
"-------
" lucario
"colorscheme lucario
"-------
" lucius
"colorscheme lucius
"set background=dark
"-------
" material-theme
"set background=dark
"colorscheme material-theme
"-------
" flatland
"colorscheme flatland
"--------
" jellybeans
colorscheme jellybeans
"--------
" PaperColor
"set background=dark
"colorscheme PaperColor
"--------
" iceberg
"colorscheme iceberg


"------------------------
" プラグイン
"------------------------
" インストール----------------------
call plug#begin()
    " JEDI-VIM
    Plug 'davidhalter/jedi-vim'
    " Tabキーで補完するプラグイン
    Plug 'ervandew/supertab'
    " インデントを可視化するプラグイン
    Plug 'Yggdroot/indentLine'
    " ddc.vim本体
    Plug 'Shougo/ddc.vim'
    " DenoでVimプラグインを開発するためのプラグイン
    Plug 'vim-denops/denops.vim'
    " カーソル周辺の既出単語を補完するsource
    Plug 'Shougo/ddc-around'
    " 入力中の単語を補完の対象にするfilter
    Plug 'Shougo/ddc-matcher_head'
    " 補完候補を適切にソートするfilter
    Plug 'Shougo/ddc-sorter_rank'
    " 補完候補の重複を防ぐためのfilter
    Plug 'Shougo/ddc-converter_remove_overlap'
    " ポップアップウィンドウを表示するプラグイン
    Plug 'Shougo/pum.vim'
    " UIオプション
    Plug 'Shougo/ddc-ui-native'
    " pythonの構文チェック用のプラグイン
    Plug 'nvie/vim-flake8'
    " 括弧とクォーテーションを補完するプラグイン
    "Plug 'higashi000/dps-kakkonan'
    " LaTeX
    Plug 'lervag/vimtex'
    " ディレクトリのツリー表示
    Plug 'lambdalisue/fern.vim'
call plug#end()

" ddc.vimの設定----------------------
" 使いたいsourceを指定する
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('uiOptions', 'pum.vim')
call ddc#custom#patch_global('sources', ['around'])

" sourceのOptionのmatchersにfilter指定することで、候補の一覧を制御できる
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \    'matchers': ['matcher_head'],
    \    'sorters': ['sorter_rank'],
    \    'converters': ['converter_remove_overlap'],
    \ },
    \ 'around': {'mark': 'Around'
    \ }
    \ })

" ddc.vimの機能を有効にする
"call ddc#enable()

" pum.vimの設定-----------------------
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>

" jedi-vimの設定----------------------
" ポップアップウィンドウ（構文のヒント）を表示しない
autocmd FileType python setlocal completeopt-=preview
let g:SuperTabContextDefaultCompletionType = 'context'
let g:SuperTabDefaultCompletionType = '<c-n>'

" indentLineの設定--------------------
let g:indentLine_color_term=239
let g:indentLine_color_gui='#708090'
let g:indentLine_char='¦'

" vim-flake8の設定--------------------
" ファイル保存時に構文チェック
"autocmd BufWritePost *.py call Flake8()
" ファイル内にマークを表示
" キーバインドの変更
autocmd FileType python map <C-f> :call Flake8()<CR>
let g:flake8_show_in_file=1
" 左端にシンボルを表示
let g:flake8_show_in_gutter=1
" Quickfixの位置
let g:flake8_quickfix_location="topleft"
" Quickfixの高さ
let g:flake8_quickfix_height=7

" vimtexの設定
let g:latex_latexmk_options = "-pdf"
