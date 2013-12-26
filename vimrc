set nocompatible               " We're running Vim -- not Vi! 
"let $LANG = 'en_US.UTF-8'
set encoding=utf-8

" ##############################################################################
" # Vundle configuration                                                       #
" ##############################################################################

filetype off                   " (required for Vundle)

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

if filereadable(expand("~/.vim/vimrc.bundles"))
  source ~/.vim/vimrc.bundles
endif

" ##############################################################################
" # Syntax highlighting                                                        #
" ##############################################################################

set t_Co=256                        " 256 colours
syntax on                           " syntax highlighing
filetype on                         " try to detect filetypes
filetype plugin indent on           " enable loading indent file for filetype

" ##############################################################################
" # Colour scheme                                                              #
" ##############################################################################

colorscheme bubblegum
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" ##############################################################################
" # Editor                                                                     #
" ##############################################################################

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=0
set number

" ##############################################################################
" # Force yourself to learn hjkl navigation                                    #
" ##############################################################################

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" ##############################################################################
" # Airline configuration                                                      #
" ##############################################################################

set noshowmode                    " Get rid of the default status bar
set laststatus=2                  " Always show the status bar
let g:airline_powerline_fonts = 1 " Use patched Powerline fonts
set ttimeoutlen=50                " Avoid delay switching from insert mode back to normal node
let g:bufferline_echo = 0         " Avoid duplication when using vim-airline with vim-bufferline

let g:airline_symbols = {}

" unicode symbols (can't get the Powerline symbols to show up, even with
" patched fonts)
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

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

" ##############################################################################
" # Custom Commands                                                            #
" ##############################################################################

" Draws an 80-character comment box using the comment character you specify.
" For example, in normal mode, enter:
" 
" ,cb # 
" 
" to insert an 80 character comment box using the pound sign.  It will place
" your cursor inside the box.  You can then press R to enter Replace Mode and 
" begin typing.
" 
:command -nargs=1 CommentBox :normal O<Esc>80i<args><Esc>yy2pl78r ^lllR
:map ,cb :CommentBox<space>

" ##############################################################################
" # Skeleton Files                                                             #
" ##############################################################################

" Skeleton for pom.xml
au BufNewFile pom.xml 0r ~/.vim/skel/skel.pom.xml
