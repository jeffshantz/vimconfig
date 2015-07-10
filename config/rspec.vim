" ################################################################################
" # RSpec configuration                                                          #
" ################################################################################

"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>A :call RunAllSpecs()<CR>

let g:rspec_command = "!docker exec bitbybit_app_1 spring rspec --color {spec}"

