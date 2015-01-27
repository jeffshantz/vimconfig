" ##############################################################################
" # Tabularize                                                                 #
" # (see http://vimcasts.org/episodes/aligning-text-with-tabular-vim/)         #
" ##############################################################################

" Use ,a= to align by '='
" Use ,a: to align by ':'

let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Call Tabularize every time we type a '|' character.  Great for Cucumber 
" examples.  Note that it requires that you already have a row with spaces
" around the pipes.  So, if you type:
"
" | a | b | c | d |
" |qwe|asd|qwer|asdf|
"
" Then it will automatically resize it as follows:
"
" | a   | b   | c    | d    |
" | qwe | asd | qwer | asdf |

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
 
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
