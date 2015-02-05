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
source ~/.vim/config/custom.vim
source ~/.vim/config/skel.vim
source ~/.vim/config/vimfiler.vim
source ~/.vim/config/unite.vim
source ~/.vim/config/rails.vim
source ~/.vim/config/rspec.vim
