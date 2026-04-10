" turn off Vi compatibility if enabled
if &compatible
  set nocompatible
endif

set number " show line numbers
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=200 " keep 200 lines of command line history
set ruler " show cursor position all the time
set showcmd " display all incomplete commands
set wildmenu " display completion matches
set display=truncate " show @@@ in last line if it is truncated
set scrolloff=1 " show lines of context around cursor
set nrformats-=octal " do not recognise octal numbers for ^a and ^x
set smarttab " tab at beginning of line insert shiftwidth worth of spaces
set shiftwidth=2 " insert 2 spaces with smarttab	
set hls " highlight search results
set laststatus=1 " behaviour of status line of last window. 1 means only if there are two or more windows. 2 means always. the screen looks nicer with a status line if you have several windows, but it takes another screen line. |status-line|
set sidescroll=1 " behaviour when wrap is off
set sidescrolloff=2
set formatoptions+=j " delete comment char when joining commented lines
set autoread " automatically reload modified file
set hidden " allow new files to be opened without closing the first one 

" do incremental searching when it's possible to timeout
if has('reltime')
  set incsearch
endif

filetype plugin indent on " i think this makes new lines inherit indenting or prefixes of previous lines?

" enable syntax highlighting when terminal has colours or when using the gui
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" make escape key more responsive by decreasing the wait time for an escape sequence
if !has('nvim') && &ttimeoutlen == --1
  set ttimeout
  set ttimeoutlen=100
endif

" correctly highlight $() in .sh files
if !exists('g:is_posix') && !exists('g:is_bash') && !exists('g:is_kornshell') && !exists('g:is_dash')
  let g:is_posix=1
endif

runtime! macros/matchit.vim " load matchit plugin for better %
