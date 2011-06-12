" remap esc in normal mode to cancel search
let mapleader = ","
nnoremap <esc> :noh<return>
vnoremap <esc> :noh<return>
nnoremap z, ^
nnoremap z. $
inoremap ii <esc>`^
nnoremap ZZ :bd<return>
inoremap <tab> <c-n>
 "Basics {
	 set nocompatible " explicitly get out of vi-compatible mode
	 set noexrc " don't use local version of .(g)vimrc, .exrc
	 set cpoptions=aBceFsmq
	 "             |||||||||
	 "             ||||||||+-- When joining lines, leave the cursor 
	 "             |||||||      between joined lines
	 "             |||||||+-- When a new match is created (showmatch) 
	 "             ||||||      pause for .5
	 "             ||||||+-- Set buffer options when entering the 
	 "             |||||      buffer
	 "             |||||+-- :write command updates current file name
	 "             ||||+-- Automatically add <CR> to the last line 
	 "             |||      when using :@r
	 "             |||+-- Searching continues at the end of the match
	 "             ||      at the cursor position
	 "             ||+-- A backslash has no special meaning in mappings
	 "             |+-- :write updates alternative file name
	 "             +-- :read updates alternative file name
	 syntax on " syntax highlighting on
 " }

 " General {
	 filetype plugin indent on " load filetype plugins/indent settings
	 set autochdir " always switch to the current file directory 
	 "set backspace=indent,eol,start " make backspace a more flexible
	 set backup " make backup files
	 set backupdir=$HOME/backup " where to put backup files
	 set clipboard+=unnamed " share windows clipboard
	 set directory=$HOME/tmp " directory to place swap files in
	 set fileformats=unix,dos,mac " support all three, in this order
	 set hidden " you can change buffers without saving
	 " (XXX: #VIM/tpope warns the line below could break things)
	 set iskeyword+=_,$,@,%,# " none of these are word dividers 
	 set mouse=a " use mouse everywhere
	 set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
	 "             | | | | | | | | |
	 "             | | | | | | | | +-- "]" Insert and Replace
	 "             | | | | | | | +-- "[" Insert and Replace
	 "             | | | | | | +-- "~" Normal
	 "             | | | | | +-- <Right> Normal and Visual
	 "             | | | | +-- <Left> Normal and Visual
	 "             | | | +-- "l" Normal and Visual (not recommended)
	 "             | | +-- "h" Normal and Visual (not recommended)
	 "             | +-- <Space> Normal and Visual
	 "             +-- <BS> Normal and Visual
	 set wildmenu " turn on command line completion wild style
	 " ignore these list file extensions
	 set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
	 \*.jpg,*.gif,*.png
	 set wildmode=list:longest " turn on wild mode huge list
 " }

" Text Formatting/Layout {
	set completeopt= " don't use a pop up menu for completions
	set expandtab " no real tabs please!
	set formatoptions=rq " Automatically insert comment leader on return, 
	" and let gq format comments
	set ignorecase " case insensitive by default
	set infercase " case inferred by default
	set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
	set smartcase " if there are caps, go case-sensitive
	set shiftwidth=2 " auto-indent amount when using cindent, 
	" >>, << and stuff like that
	set softtabstop=2 " when hitting tab or backspace, how many spaces 
	"should a tab be (see expandtab)
	set tabstop=4 " real tabs should be 8, and they will show with 
	" set list on
" }

" Folding {
	set foldenable " Turn on folding
	set foldmarker={,} " Fold C style code (only use this as default 
	" if you use a high foldlevel)
	set foldmethod=marker " Fold on the marker
	set foldlevel=100 " Don't autofold anything (but I can still 
	" fold manually)
	set foldopen=block,hor,mark,percent,quickfix,tag " what movements
	" open folds 
	function SimpleFoldText() " {
		return getline(v:foldstart).' '
	endfunction " }
	set foldtext=SimpleFoldText() " Custom fold text function 
	" (cleaner than default)
" }

" Plugin Settings {
	let b:match_ignorecase = 1 " case is stupid
	let perl_extended_vars=1 " highlight advanced perl vars 
	" inside strings
" }

" TagList Settings {
	let Tlist_Auto_Open=0 " let the tag list open automagically
	let Tlist_Compact_Format = 1 " show small menu
	let Tlist_Ctags_Cmd = 'ctags' " location of ctags
	let Tlist_Enable_Fold_Column = 0 " do show folding tree
	let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill 
	" yourself
	let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
	let Tlist_Sort_Type = "name" " order by 
	let Tlist_Use_Right_Window = 1 " split to the right side
	" of the screen
	let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always)
	" read my functions
	" Language Specifics {
	" just functions and classes please
	let tlist_aspjscript_settings = 'asp;f:function;c:class' 
	" just functions and subs please
	let tlist_aspvbs_settings = 'asp;f:function;s:sub' 
	" don't show variables in freaking php
	let tlist_php_settings = 'php;c:class;d:constant;f:function' 
	" just functions and classes please
	let tlist_vb_settings = 'asp;f:function;c:class' 
	" }
" }

" Mappings {
	" space / shift-space scroll in normal mode
	noremap <S-space> <C-b>
	noremap <space> <C-f>
	" Make Arrow Keys Useful Again {
	map <down> <ESC>:bn<RETURN>
	map <left> <ESC>:NERDTreeToggle<RETURN>
	map <right> <ESC>:Tlist<RETURN>
	map <up> <ESC>:bp<RETURN>
" }

au BufNewFile,BufRead *.ahk setf ahk 

" GUI Settings {
	if has("gui_running")
		" Basics {
		set columns=180 " perfect size for me
		set guifont=Consolas:h10 " My favorite font
		set guioptions=ce 
		"              ||
		"              |+-- use simple dialogs rather than pop-ups
		"              +  use GUI tabs, not console style tabs
		set lines=55 " perfect size for me
		set mousehide " hide the mouse cursor when typing
	" }

	endif
" }
" diff ignore white space
set diffopt+=iwhite
" diff ignore case
set diffopt+=icase

"set display=uhex
set helplang=En
set history=999
set hlsearch
set ignorecase
set incsearch
set keymodel=startsel,stopsel
set omnifunc=syntaxcomplete#Complete
set ruler
set selection=exclusive
set selectmode=mouse,key
set smartcase
set visualbell
set autoread
set number

" Font. Very important.
if has('win32') || has('win64')
" set guifont=Monaco:h16
" http://jeffmilner.com/index.php/2005/07/30/windows-vista-fonts-now-available/
set guifont=Consolas:h11:cANSI
elseif has('unix')
let &guifont="Monospace 10"
endif
" vim: set ft=vim :
colorscheme desert
syntax enable
set ruler
set showcmd
set encoding=utf-8
"set scrolloff=999
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Enable syntax highlighting.
syntax on
" Automatically indent when adding a curly bracket, etc.
set smartindent
set guitablabel=%N/\ %t\ %M
" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\ " buffer number
set statusline+=%f\ " filename
set statusline+=%h%m%r%w " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%= " right align remainder
set statusline+=0x%-8B " character value
set statusline+=%-14(%l,%c%V%) " line, character
set statusline+=%<%P " file position
" Size of GVim window
set lines=35 columns=99
" Don't display the menu or toolbar. Just the screen.
"set guioptions-=m
"set guioptions-=T
source $VIMRUNTIME/macros/matchit.vim
" Add recently accessed projects menu (project plugin)
set viminfo^=!
 
" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
 
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
set showmatch
set mat=5
"set list
set laststatus=2
nnoremap j jzz
nnoremap k kzz

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
:let ruby_minlines = 100
:let ruby_operators = 1
:let ruby_space_errors = 1
compiler ruby
nmap <c-k><c-d> mz:%!ruby-code-indenter<cr>`z 
nnoremap t :tabe 
nnoremap <F5> :!ruby %<cr>

let g:proj_flags = "imstg"
