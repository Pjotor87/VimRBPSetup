" Created by: Peter Andersson
" *******************************
" * Pathogen and basic settings *
" *******************************
" ====================================================================
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
" leader + c + l = Clear line
map <leader>cl 0d$i<Del><Esc>
" leader + t + n + t = Toggle NERDTree
map <leader>tnt :NERDTreeToggle<CR>
" leader + b = set ipdb breakpoint
autocmd FileType python nnoremap <silent> <leader>b :t.;<Esc>kiimport ipdb;ipdb.set_trace()<Esc>ld$
" leader + b + b = clear breakpoint
autocmd FileType python nnoremap <silent> <leader>bb 0d$i<Del><Esc>
" leader + b + c = clear all breakpoints
autocmd FileType python nnoremap <silent> <leader>bca :g/import ipdb;ipdb.set_trace()$/d<CR><Esc>
" leader + F5 = Run
autocmd FileType python nnoremap <silent> <F5> <Esc>:w<CR>:!clear;echo "Preparing to run the current python script via Vim.";echo "You will be returned to Vim when the script has finished executing.";python %<CR>
" leader + t + c = Toggle comments
map <leader>tc gcc
" In Visual mode: leader + c + o = Comment out selected lines
vmap <leader>co g>
" In Visual mode: leader + u + c = Uncomment selected lines
vmap <leader>uc g<
" leader + g + d = Goto definition
map <leader>gd <C-c>g<Esc>zo<Esc>llllj
" leader + r + n = Rename
autocmd FileType python map <leader>rn <C-c>rr
" leader + g + n = Global notes
map <leader>gn :sp ~/.vim/GlobalNotes<Esc><C-w>J<Esc>3<C-w>_<Esc>
" *******************************************
" * Settings for plugins loaded by Pathogen *
" *******************************************
" ====================================================================

" NERDTree
" --------
" Start NERDTree whenever starting vim without arguments
autocmd VimEnter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Pylint
" ------
let g:PyLintCWindow = 1
let g:PyLintSigns = 1
" Set this to 0 = The operation takes long enough to get me annoyed.
let g:PyLintOnWrite = 0
" let g:PyLintDissabledMessages = 'C0103,C0111,C0301,W0141,W0142,W0212,W0221,W0223,W0232,W0401,W0613,W0631,E1101,E1120,R0903,R0904,R0913'

" Syntastic
" ---------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" TComment
" --------
runtime bundles/tplugin_vim/macros/tplugin.vim

" SimpylFold
" ----------
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1
