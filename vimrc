set nocompatible          " We're running Vim, not Vi!

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on                           " syntax highlighing
filetype on                         " try to detect filetypes
filetype plugin indent on           " enable loading indent file for filetype

" Code folding -- use 'za' to open/close a fold
set foldmethod=indent
set foldlevel=99

" Show TODO list with \td
map <leader>td <Plug>TaskList

map <leader>q :TlistToggle<CR>

" Python-specifi: jump to each Pep8 violation in the quickfix window
let g:pep8_map='<leader>8'

" Tab completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
let g:pydoc_cmd = "/usr/local/bin/pydoc3" 
let g:pydoc_highlight=0 

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Syntax highlighting and indentation
syntax on               
filetype plugin indent on

"call pathogen#infect()

set autoindent
set expandtab
set tabstop=8
set shiftwidth=8
set textwidth=0
set number




" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!

  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

" I believe this sets the copy buffer to 4096 lines
set viminfo='100,<4096,s10,h

" Highlight text after column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/      

" Status line

 "set statusline+=[%b,0x%B]\                   " current char
 "set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

"statusline setup
set statusline=%f       "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=[asc=\%03.3b]
set statusline+=\ [hex=\%02.2B]
set statusline+=\ [%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P]    "percent through file
set laststatus=2

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
