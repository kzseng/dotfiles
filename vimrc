" ------------------------------------------------
"  Indent
" ------------------------------------------------
set autoindent    " 自動に
set smarttab      " 賢く
set expandtab     " tab をスペースに
set tabstop=4     " 既存の <TAB> のスペース数
set softtabstop=4 " <TAB> を入力したときのスペース数
set shiftwidth=4  " 各ステップの幅
set modeline      " ファイル先頭や末尾の設定を有効に

if has("autocmd")
    autocmd FileType html set tabstop=1 softtabstop=1 shiftwidth=1
    autocmd FileType *    set tabstop=4 softtabstop=4 shiftwidth=4
endif

" ------------------------------------------------
"  Search
" ------------------------------------------------
set ignorecase " 大文字小文字を区別なく
set smartcase  " 検索文字列に大文字が含まれている場合は区別
set incsearch  " インクリメンタルサーチ


" ------------------------------------------------
"  View
" ------------------------------------------------
syntax on          " カラフルに
set t_Co=256
set number         " 左に行数を表示
set showmatch      " 対応括弧の強調
set laststatus=2   " StatusLine に下のを常に表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

colorscheme rdark "カラースキーマ

set nowrap         " 折り返さない

highlight WhitespaceEOL ctermbg=red guibg=red " 文末のスペースをハイライト
match WhitespaceEOL /s+$/                     " 同上
set listchars=eol:$,tab:>-                    " 改行文字などのハイライト

" ------------------------------------------------
"  Split
" ------------------------------------------------
set splitbelow "下に分割
set splitright "右に分割


" ------------------------------------------------
"  Complement
" ------------------------------------------------
set wildmenu  " コマンドの自動補完
set tags=tags " ctags の設定


" ------------------------------------------------
"  Omnifunc
" ------------------------------------------------
if has("autocmd") && exists("+omnifunc")
  autocmd FileType php        :set omnifunc=phpcomplete#CompletePHP
  autocmd FileType html       :set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript :set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml        :set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType css        :set omnifunc=csscomplete#CompleteCSS
  autocmd FileType *
        \   if &omnifunc == "" |
        \           setlocal omnifunc=syntaxcomplete#Complete |
        \   endif
endif


" ------------------------------------------------
"  Keyboard Operation
" ------------------------------------------------
set backspace=indent,eol,start " バックスペースとかちょっと賢く
set virtualedit=block


" ------------------------------------------------
"  Mouse Operation
" ------------------------------------------------
""set mouse=a
""set ttymouse=xterm2


" ------------------------------------------------
"  Key Map
" ------------------------------------------------
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk


" ------------------------------------------------
"  Windows Vim
" ------------------------------------------------
set iminsert=0 " IME が勝手に ON になるのを防ぐ
set imsearch=-1


" ------------------------------------------------
"  etc
" ------------------------------------------------
set nocompatible
set hidden
"set paste

" ------------------------------------------------
"  Filetype
" ------------------------------------------------
if has("autocmd")
    " Filetype 別の動作を有効に
    filetype on
    filetype plugin on
    filetype indent on

    " カーソル位置を記憶する
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

    " 改行後のコメントを継続させない
    autocmd FileType * set formatoptions-=ro
endif


" --------------------------------------------------------------------
"  Plugin Section
" --------------------------------------------------------------------
"
" Plugin の設定などなど
" ------------------------------------------------
" pathogen.vim 
" ------------------------------------------------
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" ------------------------------------------------
" neobundle.vim 
" ------------------------------------------------
filetype off

if has('vim_starting')
      set runtimepath+='~/.vim/bundle/neobundle.vim/'
      call neobundle#rc(expand('~/.vim/bundle/'))
endif

"Plugin List
"neobundle: NeoBundle本体
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'

"vimproc:
NeoBundle 'git://github.com/Shougo/vimproc.git'

"vimshell: 
NeoBundle 'git://github.com/Shougo/vimshell.git'

"vim-surround: 
"NeoBundle 'git://tpope/vim-surround.git'

"taglist.vim : ソースコード上のメソッド宣言、変数宣言の一覧を表示
"NeoBundle 'taglist.vim'

"minibufexpl.vim
"NeoBundle 'git://github.com/fholgado/minibufexpl.vim.git'

"SuperTab : タブキーだけで何でも補完
NeoBundle 'supertab.vim'

"srcexpl: 補完
"NeoBundle 'srcexpl.vim'

"neocomplcache.vim
NeoBundle 'git://github.com/Shougo/neocomplcache.git'

"NERD_comments.vim: コメントアウトを楽に
NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'

"zencoding-vim
NeoBundle 'mattn/zencoding-vim'

"YankRing.vim: ヤンクの履歴を管理し、順々に参照、出力できるようにする
"NeoBundle 'YankRing.vim'

"yanktmp: 異なるvimプロセス間でyank/paste
NeoBundle 'yanktmp.vim'

"quickrun: 
NeoBundle 'git://github.com/thinca/vim-quickrun.git'

"Perl
"cpan.vim
"NeoBundle 'git://github.com/c9s/cpan.vim.git'
"perlomni
"NeoBundle 'git://github.com/c9s/perlomni.vim.git'
"perldoc
"NeoBundle 'git://github.com/hotchpotch/perldoc-vim.git'
"perl-mauke
"NeoBundle 'perl-mauke.vim'
"lib-perl
"NeoBundle 'git://github.com/c9s/libperl.vim.git'

"Javascript
"javascript.vim: syntax
NeoBundle 'javascript.vim'

"neobundle管理外
NeoBundle 'Align.vim'
NeoBundle 'eregex.vim'


filetype plugin on
filetype indent on



" ------------------------------------------------
"  NERD_comments.vim
" ------------------------------------------------
"map <C-k><C-c> <Leader>c<space>
"map <C-k><C-c> <plug>NERDCommenterToggle
let NERDShutUp=1


" ------------------------------------------------
"  neocomplcache.vim
" ------------------------------------------------
let g:neocomplcache_enable_at_startup              = 1
let g:neocomplcache_auto_completion_start_length   = 3
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_enable_ignore_case             = 1
let g:neocomplcache_enable_smart_case              = 1
let g:neocomplcache_snippets_dir                   = $HOME . '/.vim/snippets'

" dictionary
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default'    : '',
  \ 'perl'       : $HOME . '/.vim/dict/perl.dict',
  \ 'php'        : $HOME . '/.vim/dict/php.dict',
  \ }


" keyword 補完を開始するパターン
let g:neocomplcache_keyword_patterns = {
  \ 'perl' : '\v\<\h\w*\>?|\h\w*(::\h\w*)*|[$@%&*]\h\w*|\h\w*%(\s*\(\)?)?',
  \}

" omni 補完を開始するパターン
let g:neocomplcache_omni_patterns = {
  \ 'php'  :  '[^. \t]->\h\w*\|\$\h\w*\|\%(=\s*new\|extends\)\s\+\|\h\w*::',
  \ 'perl' :  '\%(\h\w*\|)\)->\h\w*\|\h\w*::',
\ }

"  keymap
inoremap <expr><C-o>  pumvisible( ) ? "\<C-n>" : "\<C-x>\<C-o>"
inoremap <expr><C-p>  pumvisible( ) ? "\<C-n>" : "\<C-p>\<C-n>"
"inoremap <expr><Up>   pumvisible( ) ? neocomplcache#close_popup( )."\<Up>"   : "\<Up>"
"inoremap <expr><Down> pumvisible( ) ? neocomplcache#close_popup( )."\<Down>" : "\<Down>"
"inoremap <expr><CR>   pumvisible( ) ? "\<C-y>\<CR>X\<BS>" : "\<CR>X\<BS>"
inoremap <expr><CR>   pumvisible( ) ? "\<C-y>\<CR>X\<BS>" : "\<CR>"


"imap  <silent><expr><TAB>  neocomplcache#plugin#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<C-e>" : "\<TAB>")
imap <silent><expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap  <TAB>  <RIGHT><Plug>(neocomplcache_snippets_jump)
inoremap <expr><C-e>     neocomplcache#complete_common_string()


" snippet 呼び出し
imap <C-l> <Plug>(neocomplcache_snippets_expand)
smap <C-l> <Plug>(neocomplcache_snippets_expand)


" ------------------------------------------------
"  SuperTab
" ------------------------------------------------
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"


" ------------------------------------------------
"  minibufexpl.vim
" ------------------------------------------------
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplSplitBelow = 0
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplSplitToEdge = 1


" ------------------------------------------------
"  YankRing.vim
" ------------------------------------------------
"let g:yankring_history_dir = '$HOME/.vim/history'
"let g:yankring_max_history=10


" ------------------------------------------------
"  Yanktmp.vim
" ------------------------------------------------
map <silent> sy :call YanktmpYank()<CR> 
map <silent> sp :call YanktmpPaste_p()<CR> 
map <silent> sP :call YanktmpPaste_P()<CR> 


" ------------------------------------------------
"  srcexpl.vim
" ------------------------------------------------
"let g:SrcExpl_RefreshTime=1
"let g:SrcExpl_UpdateTags=1


" ------------------------------------------------
"  quickrun.vim
" ------------------------------------------------
let g:quickrun_config={'*': {'split': ''}}


" ------------------------------------------------
"  File encoding
" ------------------------------------------------
set fileencoding=UTF8 
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
