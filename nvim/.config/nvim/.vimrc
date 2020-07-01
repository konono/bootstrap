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

augroup General
 autocmd!
 " 設定の保存と復元
 autocmd BufWinLeave *.* silent mkview 1
 autocmd BufWinEnter *.* silent loadview 1
augroup END

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" 通常のオプション設定
set incsearch
set nobk
set number
set smartcase
set wildmode=list:full
set autoindent
set backspace=indent,eol,start
noremap!  
set hlsearch
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
set hlsearch
set nowrapscan

" 全角文字を可視化
syntax match ZenkakuSpace /　/
highlight ZenkakuSpace term=underline ctermbg=Blue guibg=gray
highlight SpecialKey ctermbg=DarkGray guifg=DarkGray

" 日本語入力ON時のカーソルの色を設定
if has('multi_byte_ime') || has('xim')
        highlight CursorIM guibg=#ff0000
endif

"起動時のメッセージを省く
set shortmess+=I

"IME状態に応じたカーソル色を設定
if has('multi_byte_ime')
  highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
  highlight CursorIM guifg=NONE guibg=#ecbcbc
endif

"Vimを終了してもUndo
set undofile
set undodir=$HOME/.vim/undo

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
set clipboard=unnamedplus

"自動改行off"
set formatoptions=q
set textwidth=0

"画面チカチカ防止
 set novisualbell

 "行頭行末の左右移動で行をまたぐ
set whichwrap=b,s,h,l,<,>,[,]

"以下Python用コード
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）

" }}}

" color config {{{
"カラーテーマ
set background=dark
colorscheme amcolors
"colorscheme phd
:set t_Co=256

" }}}

" encoding config {{{

set fileencodings=ucs-bom,iso-2022-jp,utf-8,cp932,euc-jp,default,latin
set encoding=utf-8

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

" neobundle config{{{

"neobundle設定
set nocompatible
set rtp+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"MRU 履歴管理
NeoBundle 'https://github.com/yegappan/mru'

"予測変換
NeoBundle 'Shougo/neocomplete'

"neosnippet設定
NeoBundle 'Shougo/neosnippet'

"neocomplete-snippets設定
NeoBundle "Shougo/neosnippet-snippets"

"python補助
NeoBundle 'davidhalter/jedi-vim'

"プログラム起動
NeoBundle 'thinca/vim-quickrun'

"非同期処理実装
NeoBundle 'Shougo/vimproc'

"UniteInterface
NeoBundle 'Shougo/unite.vim'

"easy-motion
NeoBundle 'Lokaltog/vim-easymotion'

"インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

"念願のタブ幅調整
NeoBundle "rhysd/clever-split.vim"

"syntax check
NeoBundle 'scrooloose/syntastic'

"show mark
NeoBundle 'jacquesbh/vim-showmarks'

"unite-mark
NeoBundle 'tacroe/unite-mark'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

"outline
NeoBundle 'Shougo/unite-outline'

" window size setting
NeoBundle 'kana/vim-submode'

"go
NeoBundle 'fatih/vim-go'

"teble作成を簡単に
NeoBundle 'dhruvasagar/vim-table-mode'

"codic 利用
NeoBundle 'koron/codic-vim'

"airline
NeoBundle 'itchyny/lightline.vim'

"yaml configuration
NeoBundle 'chase/vim-ansible-yaml'

"FastFold plugin
NeoBundle 'Konfekt/FastFold'

"ag search
NeoBundle 'rking/ag.vim'

"ctrlP
NeoBundle "ctrlpvim/ctrlp.vim"

"ctrlP Filer
NeoBundle "mattn/ctrlp-filer"

"markdown plugin
NeoBundle "kurocode25/mdforvim"

let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

call neobundle#end()

" }}}

" Neocomplete config{{{

"Neocomplete設定
let g:acp_enableAtStartup = 0

" 起動時に有効化
let g:neocomplete#enable_at_startup = 1

" 補完が自動で開始される文字数
let g:neocomplete#auto_completion_start_length = 3

" 入力文字がこれ以上だと補完しない
let g:neocomplete#MaxTryKeywordLength=10

" smart case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1

" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplete#enable_camel_case_completion = 1

" _(アンダーバー)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1

" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplete#min_syntax_length = 3

" -入力による候補番号の表示
let g:neocomplete#enable_quick_match = 1

"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplete#max_list = 20

let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"変換候補をタブで移動
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"

" C-Kで展開
" Neocomplete-snippets
"let g:neocomplete_snippets_dir='$HOME/.vim/snippets'
"imap <C-k> <Plug> (neocomplete_snippets_expand)
"smap <C-k> <Plug> (neocomplete_snippets_expand)


" 補完をキャンセルしpopupを閉じる
inoremap <expr><C-e> neocomplete#cancel_popup()
inoremap <expr><C-e> pumvisible() ? neocomplete#cancel_popup() :""

"<Ctrl+Space> ：手動補完候補表示
let g:neocomplete#disable_auto_complete = 0
inoremap <expr> <S-SPACE> pumvisible() ? "\<down>" : neocomplete#start_manual_complete()
" メニューの一番目を自動選択
let g:neocomplete#enable_auto_select = 0

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" }}}

" jedi-vim config{{{

au BufNewFile, BufRead  * .py setf python

if ! empty(neobundle#get("jedi-vim"))
    let g:jedi#auto_initialization = 1
    let g:jedi#auto_vim_configuration = 1

    nnoremap [jedi] <Nop>
    xnoremap [jedi] <Nop>
    nmap <Leader>j [jedi]
    xmap <Leader>j [jedi]

    let g:jedi#rename_command = "[jedi]r"
    let g:jedi#usages_command = "[jedi]n"
    let g:jedi#auto_initialization = 1
    let g:jedi#show_call_signatures = 0
    let g:jedi#popup_select_first = 0
    let g:jedi#completions_enabled = 1
    let g:jedi#auto_vim_configuration = 1
    let g:jedi#force_py_version = 3
    let g:jedi#documentation_command = "<C-k>" 

    autocmd FileType python setlocal completeopt-=preview

"  " for w/ neocomplete
    if ! empty(neobundle#get("neocomplete.vim"))
        autocmd FileType python setlocal omnifunc=jedi#completions
        let g:jedi#completions_enabled = 0
        let g:jedi#auto_vim_configuration = 0
        let g:neocomplete#force_omni_input_patterns.python =
                        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    endif
endif

" }}}

"codic config {{{

"codic補完 download codic-complete.vim 
inoremap <silent> <C-x><C-t> <C-R>=<SID>codic_complete()<CR>

function! s:codic_complete()
  let line = getline('.')
  let start = match(line, '\k\+$')
  let cand = s:codic_candidates(line[start :])
  call complete(start +1, cand)
  return ''
endfunction
function! s:codic_candidates(arglead)
  let cand = codic#search(a:arglead, 30)
  " error
  if type(cand) == type(0)
    return []
  endif
  " english -> english terms
  if a:arglead =~# '^\w\+$'
    return map(cand, '{"word": v:val["label"], "menu": join(map(copy(v:val["values"]), "v:val.word"), ",")}')
  endif
  " japanese -> english terms
  return s:reverse_candidates(cand)
endfunction
function! s:reverse_candidates(cand)
  let _ = []
  for c in a:cand
    for v in c.values
      call add(_, {"word": v.word, "menu": !empty(v.desc) ? v.desc : c.label })
    endfor
  endfor
  return _
endfunction

" }}}

" neosnippet config {{{

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-K> <Plug>(neosnippet_expand_or_jump)

" }}}

"QuickRun config {{{

nmap <C-o> :QuickRun python <CR>

" }}}

"easymotion config {{{

let g:EasyMotion_do_mapping = 0 "Disable default mappings
vmap s <Plug>(easymotion-s2)
nmap s <Plug>(easymotion-s2)
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
nmap <c-t> :TableModeEnable<CR>
nmap <c-d> :TableModeDisable<CR>

" }}}

""CtrlPFiler {{{

nmap <C-e> :CtrlPFiler<CR>
let g:ctrlp_user_command = 'ag %s -l'

" }}}

" vim-indent-guides config {{{

" 自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" }}}

" marks config {{{

set viminfo='50,\"1000,:0,n~/.vim/viminfo
set foldmethod=marker
let g:showmarks_marks_notime = 1
let g:unite_source_mark_marks = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLNMOPQRSTUVWXYZ'
let g:showmarks_enable       = 0
if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
en

fu! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    en
    exe 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endf

aug show-marks-sync
        au!
        au BufReadPost * sil! ShowMarksOnce
aug END

"markをつける@m
nn [Mark] <Nop>
nm <Leader>m [Mark]
"markに飛ぶ @mm
nn <silent> [Mark]m :Unite mark<CR>
nn [Mark] :<C-u>call <SID>AutoMarkrement()<CR><CR>:ShowMarksOnce<CR>
com! -bar MarksDelete sil :delm! | :delm 0-9A-Z | :wv! | :ShowMarksOnce
nn <silent>[Mark]d :MarksDelete<CR>

" 次/前のマーク
nnoremap <Leader>n ]`
nnoremap <Leader>p [`

"起動時にマークを削除
autocmd BufReadPost * delmarks!

" }}}

"lightline config {{{
"set statusline=2
set laststatus=2

let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightLineModified',
        \   'readonly': 'LightLineReadonly',
        \   'fugitive': 'LightLineFugitive',
        \   'filename': 'LightLineFilename',
        \   'fileformat': 'LightLineFileformat',
        \   'filetype': 'LightLineFiletype',
        \   'fileencoding': 'LightLineFileencoding',
        \   'mode': 'LightLineMode'
        \ }
        \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" }}}

" UniteOutline config {{{

let g:unite_split_rule = 'topleft'
noremap ,u <ESC>:Unite -vertical -winwidth=40 outline<Return>

" }}}

" vim-submode setting {{{

call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')

" }}}

"golang setting {{{

autocmd FileType go autocmd BufWritePre <buffer> Fmt

exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
let g:neocomplete#sources#omni#function = {'go': 'go#complete#Complete'}

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" }}}

" grep config {{{

" grep検索
"nnoremap <silent> @g  :<C-u>Unite grep:. window -buffer-name=search <CR>
"nnoremap <silent> @g  :<C-u>Ag 

" カーソル位置の単語をgrep検索
"nnoremap <silent> @cg :<C-u>Unite grep:. <CR><C-R><C-W><CR>
"nnoremap <expr> @g ':Ag '. expand('<cword>') '<CR>'
nnoremap <expr> <C-h> ':Ag '. expand('<cword>')

" grep検索結果の再呼出
"nnoremap <silent> @r  :<C-u>UniteResume search<CR>

" unite grep に ag(The Silver Searcher) を使う
"if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
"endif

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
inoremap <silent> jj <ESC>.
inoremap <silent> <C-@> <ESC>
vnoremap <silent> <C-@> <ESC>

"nmap T :CleverHSplit <CR>
nmap T :new <CR>
"nmap t :CleverVSplit <CR>
nmap t :vnew <CR>
nmap ;q :cclose<CR>
nmap <C-f> :/<C-r>*
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

" ESCを2回入力で検索時のハイライトを解除
nnoremap <c-b> :CtrlPBuffer<CR>

" vを二回で行末まで選択
vnoremap v $h

"レジスタの中身をコマンドモードで貼り付けるためのショートカット
vnoremap <C-e> y:%s/<C-r>"//g
" ctrl-gでカーソル下のキーワードをvimgrep
nnoremap <expr> <C-g> ':vimgrep ;\<' . expand('<cword>') . '\>; % \| cw <CR>'
vnoremap <C-g> y:vimgrep <C-r>" % \|cw

"保存ショートカット
nnoremap <C-s> :browse confirm saveas<CR>

"tcomment
nnoremap <C-c> :TComment<CR>
vnoremap <C-c> :TComment<CR>

nnoremap - $

" }}}

" magic config{{{

syntax on

" }}}
