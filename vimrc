" Created by: Peter Andersson
" *******************************
" * Pathogen and basic settings *
" *******************************
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
set incsearch
set hlsearch
set number
" ***************
" * Keymappings *
" ***************
" Map leader to '-'
let mapleader = "-"
" Toggle NERDTree
map <leader>nt :NERDTreeToggle<CR>
" leader + b = set ipdb breakpoint
autocmd FileType python nnoremap <silent> <leader>b :t.;<Esc>kiimport ipdb;ipdb.set_trace()<Esc>ld$
" leader + b + b = clear breakpoint
autocmd FileType python nnoremap <silent> <leader>bb 0d$i<Del><Esc>
" leader + F5 = Run
autocmd FileType python nnoremap <silent> <F5> <Esc>:w<CR>:!clear;echo "Preparing to run the current python script via Vim.";echo "You will be returned to Vim when the script has finished executing.";python %<CR>
" *******************************************
" * Settings for plugins loaded by Pathogen *
" *******************************************
" ////////////////////////////////////////////

" NERDTree
" --------
" Start NERDTree whenever starting vim without arguments
autocmd VimEnter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ////////////////////////////////////////////

" Pylint
" ------
let g:PyLintCWindow = 1
let g:PyLintSigns = 1
" Set this to 0 = The operation takes long enough to get me annoyed.
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
"
" ////////////////////////////////////////////
"
" SimpylFold
" ----------
" No configuration is necessary. However, if you want to enable previewing of your folded classes' and functions' docstrings in the fold text, add the following to your .vimrc:
" let g:SimpylFold_docstring_preview = 1

" And if you don't want to see your docstrings folded, add this:
" let g:SimpylFold_fold_docstring = 0

" And if you don't want to see your imports folded, add this:
" let g:SimpylFold_fold_import = 0

" In order for SimpylFold to be properly loaded in certain cases, you'll have to add lines like the following to your .vimrc (see issue #27):
" autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
" autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" If you have the above options set to different values anywhere (e.g. setting foldmethod=syntax in .vimrc, SimpylFold won't work properly.

" ////////////////////////////////////////////
