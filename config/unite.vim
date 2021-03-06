" ################################################################################
" # Unite                                                                        #
" ################################################################################

if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt=''
endif

" Start Insert
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
let g:unite_update_time = 300

" set up mru limit
let g:unite_source_file_mru_limit = 100

" highlight like my vim
let g:unite_cursor_line_highlight = 'CursorLine'

" format mru
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

" set up coolguy arrow prompt
let g:unite_prompt = '➠ '

" Save session automatically.
let g:unite_source_session_enable_auto_save = 1

if exists(":Unite")

  " Use the fuzzy matcher for everything
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  
  " Use the rank sorter for everything
  call unite#filters#sorter_default#use(['sorter_rank'])
  
  " Set up some custom ignores
  call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
        \ 'ignore_pattern', join([
        \ '\.git/',
        \ 'git5/.*/review/',
        \ 'google/obj/',
        \ 'tmp/',
        \ 'lib/Cake/',
        \ 'node_modules/',
        \ 'vendor/',
        \ 'Vendor/',
        \ 'app_old/',
        \ 'acf-laravel/',
        \ 'plugins/',
        \ 'bower_components/',
        \ '.sass-cache',
        \ 'web/wp',
        \ ], '\|'))
endif

" Unite Commands ===============================================================

" No prefix for unite -- use the leader commands below
nnoremap [unite] <Nop>

" ,f Fuzzy Find Everything
" files, Buffers, recursive async file search
nnoremap <silent> <leader>f :<C-u>Unite
      \ -buffer-name=files file_rec/async<CR>

" ,g grep files
nnoremap <silent> <leader>g :<C-u>Unite
      \ -buffer-name=grep grep<CR>

" ,y Yank history
" Shows all your yanks, when you accidentally overwrite
nnoremap <silent> <leader>y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" ,m MRU All Vim buffers, not file buffer
nnoremap <silent> <leader>m :<C-u>Unite -buffer-name=mru file_mru<CR>

" ,b view open buffers
nnoremap <silent> <leader>b :<C-u>Unite -buffer-name=buffer buffer<CR>

" ,c Quick commands, lists all available vim commands
nnoremap <silent> <leader>c :<C-u>Unite -buffer-name=commands command<CR>


" Unite motions ================================================================

augroup MyAutoCmd
  autocmd!
augroup END

" Function that only triggers when unite opens
autocmd MyAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()

  " exit with esc
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)

  " Ctrl jk mappings
  imap <buffer> <c-j> <Plug>(unite_insert_leave)
  imap <buffer> <c-k> <Plug>(unite_insert_leave)
  nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)

  " jj and kk to leave insert mode
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> kk <Plug>(unite_insert_leave)

  " qq `` becuase you're lazy, and quit unite
  imap <buffer> qq <Plug>(unite_exit)
  imap <buffer> `` <Plug>(unite_exit)

  " refresh unite
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)

  " split control
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

endfunction

