"common config {{{

"encode識別
filetype off
filetype plugin indent off
filetype plugin indent on

"leaderキー変更
:let mapleader="@"
:set expandtab


"起動時に開いていた場所にカーソルが戻る設定
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

"文字化け対策
set ttimeout
set ttimeoutlen=50

" 通常のオプション設定
set incsearch
set nobk
set number
set smartcase
set wildmode=list:full
set autoindent
set backspace=indent,eol,start
noremap!  
set iminsert=0
set imsearch=0
set listchars=tab:\^\ ,eol:.,trail:-
set wrap
set ruler
"(ts)ファイル中のTab文字(キャラクターコード9)を、画面上の見た目で何文字分に展開するかを指定する
set tabstop=4
"(sw)自動的に挿入されるタブの文字数
set shiftwidth=4
"(sts)キーボードから入力される時のタブの文字数
set softtabstop=0
set showcmd
set tabstop=4
set visualbell
set scrolloff=2
set list
set hidden
set inccommand=split
set hlsearch
set nowrapscan
"set nocursorline
"set nocursorcolumn

" 全角文字を可視化
"syntax match ZenkakuSpace /　/
highlight ZenkakuSpace term=underline ctermbg=Blue guibg=gray
highlight SpecialKey ctermbg=DarkGray guifg=DarkGray

" 日本語入力ON時のカーソルの色を設定
if has('multi_byte_ime') || has('xim')
        highlight CursorIM guibg=#ff0000
endif

"起動時のメッセージを省く
set shortmess+=I

"IME状態に応じたカーソル色を設定
"if has('multi_byte_ime')
"  highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
"  highlight CursorIM guifg=NONE guibg=#ecbcbc
"endif

"Vimを終了してもUndo
set undofile
set undodir=$HOME/.config/nvim/undo

"C-vの矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

"行末まで検索したら行頭に戻る
set wrapscan

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"スクロール制御
set scrolloff=10

"コマンドモードでの補完
set wildmode=list,full"

"コマンドモードでのtab補完
set wildmode=list,full
set nocompatible

"windows,ubuntu標準のクリップボードとvimのレジスタを共有
set clipboard=unnamed,unnamedplus

"自動改行off"
set formatoptions=q
set textwidth=0

"画面チカチカ防止
 set novisualbell

 "行頭行末の左右移動で行をまたぐ
"set whichwrap=b,s,h,l,<,>,[,]

"以下Python用コード
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）

" }}}

" color config {{{
"カラーテーマ
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme tender
"colorscheme tender_kai
"colorscheme kalisi
"colorscheme molokai
"colorscheme badwolf
"colorscheme jellybeans
"colorscheme amcolors
"colorscheme phd
:set t_Co=256

" }}}

" encoding config {{{

set fileencodings=ucs-bom,iso-2022-jp,utf-8,cp932,euc-jp,default,latin
set encoding=utf-8
set fenc=utf-8
" }}}

"font config {{{

set guifont=Ubuntu\ Mono\ 15

" }}}

" vim complete config {{{

"http://kannokanno.hatenablog.com/entry/2013/05/08/110557
set completeopt=menu

" }}}

" IME config {{{

"normalモードでのIMEを常にOFF
augroup InsModeAu
    autocmd!
    autocmd InsertEnter,CmdwinEnter * set noimdisable
    autocmd InsertLeave,CmdwinLeave * set imdisable
augroup END

" }}}

" keymap config {{{

"keymap
" 対応する括弧を補完
inoremap (( ()<LEFT>
inoremap {{ {}<LEFT>
inoremap "" ""<LEFT>
inoremap [[ []<LEFT>
inoremap '' ''<LEFT>
inoremap `` ``<LEFT>
inoremap << <><LEFT>
inoremap <C-l> <Right>
inoremap <silent> jj <c-[>

"nmap T :CleverHSplit <CR>
nmap T :new <CR>
"nmap t :CleverVSplit <CR>
nmap t :vnew <CR>
nmap ;q :cclose<CR>
"カーソルを表示行で移動する。
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

"grep時に移動を簡単にするためのショートカット集
nnoremap <S-k> :cN<CR>zz   " 前へ
nnoremap <S-j> :cnext<CR>zz       " 次へ
" c*でカーソル下のキーワードを置換
nnoremap <expr> c* ':%s ;\<' . expand('<cword>') . '\>;'
"タブ作成のショートカット
nnoremap <C-n> :tabnew<cr>
noremap n nzz
noremap N Nzz
"python実行
function! s:Exec()
    exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>Exec()
map <silent> <C-@> :call <SID>Exec()<CR>

"Oで改行できるようにする
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

""スラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" ESCを2回入力で検索時のハイライトを解除
nnoremap <ESC><ESC> :nohlsearch<CR>

" vを二回で行末まで選択
vnoremap v $h

"レジスタの中身をコマンドモードで貼り付けるためのショートカット
vnoremap <C-e> y:%s/<C-r>"//g
" ctrl-gでカーソル下のキーワードをvimgrep
nnoremap <expr> <C-g> ':vimgrep ;\<' . expand('<cword>') . '\>; % \| cw <CR>'
vnoremap <C-g> y:vimgrep <C-r>" % \|cw

"保存ショートカット
nnoremap <C-s> :browse confirm saveas<CR>

nnoremap - $

tnoremap <silent> <ESC><ESC> <C-\><C-n>

" }}}

" dein {{{
" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.config/nvim/dein')
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
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . 'dein.toml'
  let s:lazy_toml = g:rc_dir . 'dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
   call dein#load_toml(s:toml,      {'lazy': 0})
   call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
  call dein#clear_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
" }}}

" magic config{{{

syntax on

function! ProfileCursorMove() abort
  let profile_file = expand('~/log/vim-profile.log')
  if filereadable(profile_file)
    call delete(profile_file)
  endif

  normal! gg
  normal! zR

  execute 'profile start ' . profile_file
  profile func *
  profile file *

  augroup ProfileCursorMove
    autocmd!
    autocmd CursorHold <buffer> profile pause | q
  augroup END

  for i in range(100)
    call feedkeys('j')
  endfor
endfunction

" }}}
