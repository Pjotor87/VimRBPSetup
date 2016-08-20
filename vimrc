" Created by: Peter Andersson
" *******************************
" * Pathogen and basic settings *
" *******************************
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
" ***************
" * Keymappings *
" ***************
" Map leader to '-' instead of '\'
let mapleader = "-"

" leader + b = set ipdb breakpoint
nnoremap <leader>b oimport ipdb;ipdb.set_trace()

" leader + ctrl + b clear breakpoint (wipe the whole line clean but keep the \n)
nnoremap <leader><C-b> 0d$

" *******************************************
" * Settings for plugins loaded by Pathogen *
" *******************************************
" ////////////////////////////////////////////

" NERDTree
" --------
" Start NERDTree whenever starting vim without arguments
autocmd VimEnter * if !argc() | NERDTree | endif

" ////////////////////////////////////////////

" Pylint
" ------
let g:PyLintCWindow = 1
let g:PyLintSigns = 1
" Set this to 0 = Do not check when saving. Not set to 1 while using rspberry pi as development environment. 
" I'd like to set this back to 1 in the future, but for now this makes the operation take long enough on each save for me to get annoyed.
let g:PyLintOnWrite = 0
" let g:PyLintDissabledMessages = 'C0103,C0111,C0301,W0141,W0142,W0212,W0221,W0223,W0232,W0401,W0613,W0631,E1101,E1120,R0903,R0904,R0913'

" ////////////////////////////////////////////

" Syntastic
" ---------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ////////////////////////////////////////////

" TComment
" --------
runtime bundles/tplugin_vim/macros/tplugin.vim

" ////////////////////////////////////////////

" Autopep8
" --------
" If you don't want to use the <F8> key for autopep8, simply remap it to another key. It autodetects whether it has been remapped and won't register the <F8> key if so. For example, to remap it to <F3> instead, use:
"autocmd FileType python map <buffer> <F3> :call Autopep8()<CR>
" Do not fix these errors/warnings (default: E226,E24,W6)
"let g:autopep8_ignore="E501,W293"
" Fix only these errors/warnings (e.g. E4,W)
"let g:autopep8_select="E501,W293"
" Maximum number of additional pep8 passes (default: 100)
"let g:autopep8_pep8_passes=100
" Set maximum allowed line length (default: 79)
"let g:autopep8_max_line_length=79
" Enable possibly unsafe changes (E711, E712) (default: non defined)
"let g:autopep8_aggressive=1
" Number of spaces per indent level (default: 4)
"let g:autopep8_indent_size=2
" Disable show diff window
"let g:autopep8_disable_show_diff=1

" ////////////////////////////////////////////
