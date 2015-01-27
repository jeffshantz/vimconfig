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
