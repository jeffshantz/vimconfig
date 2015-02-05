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

if empty($COLORFGBG)
  set background=dark
endif

" silent! prevents error on first run, before NeoBundle has a chance to install
" the solarized colour scheme.
silent! colorscheme solarized
