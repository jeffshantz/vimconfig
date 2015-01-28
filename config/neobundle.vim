if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:

" Asynchronous execution library for Vim
NeoBundle 'Shougo/vimproc.vim', {
      \   'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \   }
      \ }

" Solarized colour scheme
NeoBundle 'altercation/vim-colors-solarized'

" Nice status line / buffer list
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'

" Code snippets
NeoBundle 'garbas/vim-snipmate', {'depends' :
    \ [ 'MarcWeber/vim-addon-mw-utils',
    \   'tomtom/tlib_vim',
    \   'honza/vim-snippets'
    \ ]}

" Better syntax highlighting for Dockerfiles
NeoBundle 'ekalinin/Dockerfile.vim'

" Quoting/parenthesizing made simple
NeoBundle 'tpope/vim-surround'

" Comment stuff out
NeoBundle 'tpope/vim-commentary'

" Better editing of XML files
NeoBundle 'sukima/xmledit', {
      \   'build' : {
      \     'mac' : 'ln -sf xml.vim ftplugin/html.vim; ln -sf xml.vim ftplugin/xhtml.vim',
      \     'linux' : 'ln -sf xml.vim ftplugin/html.vim; ln -sf xml.vim ftplugin/xhtml.vim',
      \     'unix' : 'ln -sf xml.vim ftplugin/html.vim; ln -sf xml.vim ftplugin/xhtml.vim'
      \   }
      \ }

" Text filtering and alignment
NeoBundle 'godlygeek/tabular'

" Unite
NeoBundle 'Shougo/unite.vim'

" MRU file source for Unite
NeoBundle 'Shougo/neomru.vim'

" netrw replacement
NeoBundle 'Shougo/vimfiler.vim'

" Custom text object for selecting ruby blocks
NeoBundle 'nelstrom/vim-textobj-rubyblock', {'depends': 'kana/vim-textobj-user' }

" Ruby on Rails
NeoBundle 'tpope/vim-rails', {'depends': 'tpope/vim-bundler' }

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
