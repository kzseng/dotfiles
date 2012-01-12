" :make でエラーチェック
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" http://www.ac.cyberhome.ne.jp/~yakahaira/vimdoc/syntax.html#php.vim
let php_sql_query=1
let php_baselib=1
let php_htmlInStrings=1
let php_parent_error_close=1
let php_parent_error_open=1

set tabstop=4
set softtabstop=4
set shiftwidth=4



""
" PHP Lint
" @author halt feits <halt.feits at gmail.com>
" ,l で文法チェック
" 
nmap ,l :call PHPLint()<CR>
function PHPLint()
  let result = system( &ft . ' -l ' . bufname(""))
  echo result
endfunction
