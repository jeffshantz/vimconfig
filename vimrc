" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " We're running Vim -- not Vi!
   endif
 endif

source ~/.vim/config/neobundle.vim
source ~/.vim/config/colours.vim
source ~/.vim/config/editor.vim
source ~/.vim/config/navigation.vim
source ~/.vim/config/airline.vim
source ~/.vim/config/matchit.vim
source ~/.vim/config/tabularize.vim

" ##############################################################################
" # Custom Commands                                                            #
" ##############################################################################

" Write a file with sudo
cmap w!! w !sudo tee % >/dev/null

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

" Insert a blank line above or below without going into insert mode
nmap <Leader>O :normal O<CR>
nmap <Leader>o :normal o<CR>

" ##############################################################################
" # Skeleton Files                                                             #
" ##############################################################################

" Skeleton for pom.xml
"au BufNewFile pom.xml 0r ~/.vim/skel/skel.pom.xml
