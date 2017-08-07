set nocompatible " be iMproved, required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'              " let Vundle manage Vundle, required
"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'            " A tree explorer plugin for vim
Plugin 'Shougo/unite.vim'               " Navigation between buffers and files
Plugin 'majutsushi/tagbar'              " Class/module browser
Plugin 'bling/vim-airline'              " lean & mean status/tabline for vim that's light as air

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'            " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'   " Dependencies #1
Plugin 'tomtom/tlib_vim'                " Dependencies #2
Plugin 'honza/vim-snippets'             " Snippets repo

" --- Python ---
Plugin 'davidhalter/jedi-vim'           " Awesome Python autocompletion with VIM
Plugin 'klen/python-mode'               " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
Plugin 'mitsuhiko/vim-jinja'            " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'hynek/vim-python-pep8-indent'   " PEP8 indent
Plugin 'jmcantrell/vim-virtualenv'      " Virtualenv support in VIM

Plugin 'vim-airline/vim-airline-themes'

call vundle#end() " required
"====================================================

"=====================================================
" General settings
"=====================================================
filetype on
filetype plugin on
filetype plugin indent on

set backspace=indent,eol,start
colorscheme Tom
set lines=80 columns=110
set colorcolumn=80
" Don't bell and blink
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell
set enc=utf-8           " utf-8 default encoding
set ls=2                " always show status bar
set incsearch           " incremental search
set hlsearch            " highlighted search results
set nu                  " line numbers
set scrolloff=3         " keep some more lines for scope
set showmatch           " show matching brackets/parenthesis
set matchtime=0         " don't blink when matching

" Swaps and backups
if has("win32") || has("win64")
  set dir=$TMP
  set backupdir=$TMP
else
  set dir=/tmp
  set backupdir=/tmp
endif

" Tab Settings
set smarttab
set tabstop=4

" SnipMate settings
let g:snippets_dir = "~/.vim/vim-snippets/snippets"


" Jedi-vim
let g:jedi#show_call_signatures = 1 " Show call signatures
let g:jedi#popup_on_dot = 1         " Enable autocomplete on dot
let g:jedi#popup_select_first = 0   " Disable first select from auto-complete

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" Better :sign interface symbols
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = 'X'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_style_warning_symbol = 'x'

" Vim-Airline
let g:airline_theme='dark'

"=====================================================
" Python-mode settings
"=====================================================
" Python-mode
" Activate rope
" Keys:
" K Show python docs
" <Ctrl-Space> Rope autocomplete
" <Ctrl-c>g Rope goto definition
" <Ctrl-c>d Rope show documentation
" <Ctrl-c>f Rope find occurrences
" <Leader>b Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[ Jump on previous class or function (normal, visual, operator modes)
" ]] Jump on next class or function (normal, visual, operator modes)
" [M Jump on previous class or method (normal, visual, operator modes)
" ]M Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pylint', 'pep8']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_ignore="E501,W601,C0110,C0111,E302,F0002,E231,E225,E401,E201,E221,E261,E265"
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Get possibility to run Python code
let g:pymode_run = 0

" Other options
let g:pymode_options_colorcolumn = 0
if has("gui_running")
    let g:airline_powerline_fonts = 1
else
    let g:airline_powerline_fonts = 0
endif

"=====================================================
" User hotkeys
"=====================================================
"NERDTree
map <F3> :NERDTreeToggle<CR>    " browse the list of files in the current directory

" Unite settings
nnoremap <F7> :Unite buffer<CR> " browse a list of the currently opened buffers

" TaskList settings
map <F8> :TaskList<CR> " show pending tasks list

" TagBar settings
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " autofocus on Tagbar open

noremap <f2> :w<CR>
inoremap <f2> <C-O>:w<CR>
vnoremap <f2> <C-C>:update<CR>
" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo
noremap <C-z> u
inoremap <C-z> <C-O>u

" CTRL-Y is Redo
noremap <C-y> <C-R>
inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-S is Quicksave command
noremap <C-s> ::update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Settings for buffers
map <C-q> :bd<CR>         " close current buffer
noremap <C-Right> :bn<CR> " move to next buffer
noremap <C-Left> :bp<CR>  " move to previous buffer

" Easier split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Easier change size for splitted windows
nnoremap <M-[> :vertical resize +5<cr>
nnoremap <M-]> :vertical resize -5<cr>

" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" Generate and insert UUID4 into code by <F12> key
nnoremap <F12> :q<CR>

" Python code check on PEP8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

"=====================================================
" Languages support
"=====================================================
" --- C/C++/C# ---
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,cs setlocal commentstring=//\ %s
let c_no_curly_error=1
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_include_dirs = ['include', '../include']
let g:syntastic_c_compiler = 'clang'

" --- Python ---
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721,E302
\ --max-line-length=80'

" --- Vim ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

"=====================================================
" User functions
"=====================================================

autocmd BufNewfile *.py silent! execute '0r! echo "\# -*- coding: utf-8 -*-"'
autocmd BufNewfile *.py silent! execute '0r! echo "\#\!/usr/bin/python3"'
autocmd BufNewfile *.c silent! execute '0r! echo "}"'
autocmd BufNewfile *.c silent! execute '0r! echo "    return 0;"'
autocmd BufNewfile *.c silent! execute '0r! echo ""'
autocmd BufNewfile *.c silent! execute '0r! echo "{"'
autocmd BufNewfile *.c silent! execute '0r! echo "int main(int args, char *argv[])"'
autocmd BufNewfile *.c silent! execute '0r! echo ""'
autocmd BufNewfile *.c silent! execute '0r! echo ""'
autocmd BufNewfile *.c silent! execute '0r! echo "\#include <stdio.h>"'
autocmd BufNewfile *.c silent! execute '0r! echo "\#include <stdlib.h>"'
