set nocompatible              " be iMproved, required
filetype on                  " required

set shiftwidth=4
set tabstop=4
" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()"
" " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'altercation/vim-colors-solarized'
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'scrooloose/nerdtree'
 Plugin 'scrooloose/syntastic'
 Plugin 'tpope/vim-sleuth'  
 Plugin 'rdnetto/YCM-Generator'
 Plugin 'Yggdroot/indentLine'
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'tpope/vim-surround'
 Plugin 'tpope/vim-fugitive'
 Plugin 'kien/ctrlp.vim'
 Plugin 'easymotion/vim-easymotion'
 Plugin 'pangloss/vim-javascript'
 Plugin 'jelera/vim-javascript-syntax'
 Plugin 'Raimondi/delimitMate'
 Plugin 'marijnh/tern_for_vim'
 " Track the engine.
 Plugin 'SirVer/ultisnips'

 " Snippets are separated from the engine. Add this if you want them:
  Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required

" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on
  
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
"--------VIM CONFIGURATIONS------"

"Leader Key"
let mapleader=" "

"------[Highlight Matches when jumping to next]-----"
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction

"--------------Ctags--------------"
"set tags+= ~/.vim/tags/stl
" build tags of your own project with CTRL+F12      
 "map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>      
 "noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>      
 "inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr> 

"------COMMANDS FROM PLUGINS------" 

"Solarized Color Scheme"
colorscheme solarized
if has('gui_running')
    set background=dark
  else
    set background=dark
 endif
"Change Font"

"OmniComplete"
set omnifunc=youcompleteme#Complete
filetype plugin on
"Open NerdTree on Start"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Show NerdTree Bookmarks"
let NERDTreeShowBookmarks=1

"-------YouCompleteMe------"
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'debug'
"let g:ycm_path_to_python_interpreter = 'python2'"
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview

"------Syntastic Settings--------"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

"-----------STATUSLINE-----------"
" start of default statusline
 set statusline=%f\ %h%w%m%r\ 

 "Syntastic statusline
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

" end of default statusline (with ruler)
 set statusline+=%=%(%l,%c%V\ %=\ %P%)
"-------------Air-line-----------"
 let g:airline_theme='luna' 
 
 "let g:airline_theme_patch_func = 'AirlineThemePatch'
  " function! AirlineThemePatch(palette)
  "       if g:airline_theme == 'luna'
  "               for colors in values(a:palette.inactive)
  "                      let colors[3] = 245
  "               endfor
  "       endif
  "endfunction

 if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
 "let g:airline_symbols.space = "\ua0"
 let g:airline_powerline_fonts = 1
 " unicode symbols
 let g:airline_left_sep = '»'
 let g:airline_left_sep = '▶'
 let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
 let g:airline_symbols.crypt = '🔒'
 let g:airline_symbols.linenr = '␊'
 let g:airline_symbols.linenr = '␤'
 let g:airline_symbols.linenr = '¶'
 let g:airline_symbols.maxlinenr = '☰'
 let g:airline_symbols.maxlinenr = ''
 let g:airline_symbols.branch = '⎇'
 let g:airline_symbols.paste = 'ρ'
 let g:airline_symbols.paste = 'Þ'
 let g:airline_symbols.paste = '∥'
 let g:airline_symbols.spell = 'Ꞩ'
 let g:airline_symbols.notexists = '∄'
 let g:airline_symbols.whitespace = 'Ξ'
 " powerline symbols
 let g:airline_left_sep = ''
 let g:airline_left_alt_sep = ''
 let g:airline_right_sep = ''
 let g:airline_right_alt_sep = ''
 let g:airline_symbols.branch = ''
 let g:airline_symbols.readonly = ''
 let g:airline_symbols.linenr = ''


"--------------------------------"
 let g:tex_conceal = ""
 
 "------------UltiSnips---------------"
let g:UltiSnipsSnippetDirectories=["my-snippets"]

" make vim recognizing snippets dir
set runtimepath+=~/.vim/my-snippets/

" use different snippets dir
let g:UltiSnipsSnippetsDir='~/.vim/my-snippets/'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets = '<c-o>'
" trigger snippet with Ctrl-l
let g:UltiSnipsExpandTrigger='<c-l>'
" go to next snippet with Ctrl-j
let g:UltiSnipsJumpForwardTrigger='<c-j>'
" go to previous snippet with Ctrl-k
let g:UltiSnipsJumpBackwardTrigger='<c-k>' 
let g:ycm_use_ultisnips_completer = 1

"------My own Vim Settings-------"
"Number Toggle"
:set list listchars=tab:\|\ ,extends:»,precedes:«,nbsp:×
:set number
:nmap <C-N><C-N> :set invnumber<CR>
:nmap <C-z> :JavaImportOrganize 
:nmap <C-x> :JavaConstructor
:nmap Ω :NERDTree
"-------Indent Highlight--------"

 let g:indentLine_color_term = 239
 let g:indentLine_color_gui = '#09AA08'
 let g:indentLine_char = '│'
 let g:indentLine_enabled = 1
 let g:indentLine_concealcursor = 'inc'
 let g:indentLine_conceallevel = 2

"--------Vim_Javascript-----------"
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
