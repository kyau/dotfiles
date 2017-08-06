" ~/.vimrc: personal vim initializations
"
" Author:  kyau
" Version: 0.2
" Date:    2013-04-24T16:30:44-0700
"
" Attribution:
" - https://github.com/nvie/vimrc
" - http://amix.dk/vim/vimrc.html


" General {{{
" ------------------------------------------------------------------------------
set nocompatible				    " Use Vim settings, rather than Vi settings
filetype indent on					" Enable filetype-specific indenting
filetype plugin on					" Enable filetype-specific plugins
set autoread						" Auto read when changed from the outside
" }}}


" Colors & Fonts {{{
syntax enable						" Enable syntax highlighting
try									" Load theme if exists
	colorscheme euphrasia
catch
endtry
set background=dark					" Set background to dark color scheme
set encoding=utf8					" Set utf-8 as standard encoding
set termencoding=utf8
set fileformats=unix,dos,mac		" Use Unix as the standard file type
set formatoptions+=qrn1				" When wrapping paragraphs, don't end lines
									" 	with 1-letter words
set t_Co=256						" Always use 256-color mode
" }}}


" Status Line {{{
" ------------------------------------------------------------------------------
set cmdheight=2						" Use a status bar taht is 2 rows high
set laststatus=2					" Always show the status line
hi User1 ctermfg=3 ctermbg=0 
hi User2 ctermfg=1 ctermbg=0
hi User3 ctermfg=14 ctermbg=0
hi User4 ctermfg=10 ctermbg=0
hi User5 ctermfg=1 ctermbg=0 cterm=bold
hi User6 ctermfg=15 ctermbg=0
hi User7 ctermfg=12 ctermbg=0
hi User8 ctermfg=8 ctermbg=0
hi User9 ctermfg=7 ctermbg=0
set statusline=
set statusline+=\ %1*\[%n\]         " Buffernumber
set statusline+=\ %3*■%*\           " Symbol
set statusline+=%4*%<%F%*	  		" Full filename & path
set statusline+=%2*%m%*				" Modified flag
"set statusline+=%6*\ %{GitBranch()}%*
									" Show git branch if applicable
set statusline+=%=%8*				" Separation point between aligned items
set statusline+=%9*%{&ff}%*         " File format (dos/unix/mac)
set statusline+=%7*/%*%9*%{''.(&fenc!=''?&fenc:&enc).''}
set statusline+=%{(&bomb?\",BOM\":\"\")}
									" File encoding
set statusline+=\ %*%3*%y%*         " Filetype
set statusline+=%1*\ \ %l%*			" Current line
set statusline+=%2*,%1*%c%*         " Column number
set statusline+=%2*\ 0x%04B%*\      " Character under cursor
" }}}


" Vim User Interface {{{
" ------------------------------------------------------------------------------
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set clipboard=unnamed               " normal OS clipboard interaction
set colorcolumn=81					" Highlight the column after the 80th
set cursorline						" Highlight the current line in all windows 
									" 	and update on cursor movement
set hidden							" Hide buffers when they are abandoned
set hlsearch						" Highlight search results
set incsearch                       " show search matches as you type
set ignorecase						" Case-insensitive search
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
									" Characters to display as invisible chars 
									" 	when :list is enabled
set lazyredraw						" Don't redraw while executing macros
set magic							" For regular expressions, turn magic on
set matchtime=2 					" x/10 seconds to show the matching brackets
set number							" Turn on line numbering
set ruler							" Always show current position
set scrolloff=4	                    " Keep cursor line at center screen
set showcmd                         " Show keypresses on right of command line
set showmatch						" Show matching bracket when highlighting one
set showmode						" Always show current editing mode
set smartcase						" When searching be smart about cases
set noerrorbells					" Do not ring the bell for error messages
set novisualbell					" Do not use visual bells
set nowrap                          " don't wrap lines
set formatoptions-=t                " don't wrap text when typing
set pastetoggle=<F2>                " when in insert mode, press <F2> to go to
                                    "    paste mode, where you can paste mass data
                                    "    that won't be autoindented
set t_vb=							" Null the bell
set timeoutlen=500					" Mapped key sequences timeout after (ms)
"set virtualedit=all                 " allow the cursor to go in to "invalid" places
set whichwrap+=<,>,h,l,[,]			" Allow horizontal directional keys to wrap
set wildmenu						" Turn on the WiLd menu
set wildignore=*.o,*~,*.pyc,*.class,*.bak,*.swp
									" Ignore compiled and revision control stuff
									" when using WiLd menu
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif
" }}}


" Folding Rules {{{
" ------------------------------------------------------------------------------
set foldenable                      " enable folding
set foldcolumn=1                    " add a fold column
set foldmethod=marker               " detect triple-{ style fold markers
set foldlevelstart=99               " start out with everything folded
"set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                    " which commands trigger auto-unfold
" }}}


" Backups, History & Undo {{{
" ------------------------------------------------------------------------------
set nobackup						" Turn off file backup
set nowritebackup					" Turn off backup on overwrite
set history=1000					" Keep 1000 lines of command/search history
set noswapfile						" Do not use a swapfile for buffers
set undolevels=1000					" Keep 1000 levels of undo
if v:version > 730
	set undofile					" Keep a persistent undo backup file
	set undodir=~/.vim/.undo,~/tmp,/tmp
endif
" }}}


" Text, Tab & Indent Related {{{
" ------------------------------------------------------------------------------
set autoindent						" Auto indent
set copyindent                      " copy the previous indentation on autoindenting
set expandtab						" Use spaces instead of tabs
au FileType Makefile set noexpandtab
au FileType asm set noexpandtab
au FileType crontab set noexpandtab
au FileType bindzone set noexpandtab
au FileType named set noexpandtab
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
set smarttab						" Be smart when using tabs
set shiftwidth=4					" Number of spaces to use for auto indenting
set softtabstop=4					" Hitting <bs> removes spaces as if tabs
set tabstop=4						" One tab is equal to four spaces
set linebreak						" Wrap long lines
set textwidth=79 					" Maximum width of text being inserted
set smartindent						" Smart indenting when starting a newline
set wrap							" Wrap lines
" }}}

" Switch to a more POSIX-compatible shell for vim {{{
if &shell =~# 'fish$'
    set shell=bash
endif
" }}}

" Common abbreviations / misspellings {{{
source ~/.vim/autocorrect.vim
" }}}

" Keybindings {{{
" ------------------------------------------------------------------------------
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <space> to / (search) and Ctrl+<space> to ? (backwards search)
map <space> /\v
map <c-space> ?\v

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Make the tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Move a line of text using (ALT/Command)+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<cr>
vnoremap <silent> # :call VisualSelection('b', '')<cr>
" }}}


" Leader Keybindings {{{
" ------------------------------------------------------------------------------
let mapleader = ","					" Map <leader> key to ,
let g:mapleader = ","				" Allow functions to access <leader> key

" Fast saving
map <leader>w :w!<cr>

" Fast quit
map <leader>q :q!<cr>

" Fast save and quit
map <leader>wq :wq!<cr>

" Reselect the text that was just pasted
map <leader>v V`]

" Toggles paste mode
map <leader>p :setlocal paste!<cr>

" Quickly open a buffer for scribble
map <leader>e :e ~/buffer<cr>

" Insert timestamp
map <leader>dt :r !date +"\%Y-\%m-\%dT\%H:\%M:\%S\%z"<cr>i<bs><esc>

" Remove the Windows ^M (for when encodings get messed up)
map <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle show/hide invisible chars
map <leader>i :set list!<cr>

" Toggle line numbers
map <leader>n :setlocal number!<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Toggle spell checking with ,ss
map <leader>ss :setlocal spell!<cr>

" Move to next misspelled word after cursor
map <leader>sn ]s

" Move to previous misspelled word before the cursor
map <leader>sp [s

" Add word under cursor as a good word to spelling file
map <leader>sa zg
map <leader>s? z=

" Useful mappings for managing tabs
map <leader>= :tabnew<cr>
map <leader>- :tabclose<cr>
map <leader>\ :tabonly<cr>
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 10gt

" Opens the error console
map <leader>cc :botright cope<cr>

" Move to the next error
map <leader>] :cn<cr>

" Move to the previous error
map <leader>[ :cp<cr>

"
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

" Replace the current word in all open buffers
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<cr>

" Vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<cr>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
" }}}


" Buffers & Tabs {{{
" ------------------------------------------------------------------------------
" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" Remember info about open buffers on close
set viminfo^=%

" Delete trailing whitespace on save (Python/CoffeeScript)
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Fish Syntax Highlighting
autocmd BufNewFile,BufRead *.fish set filetype=fish
autocmd BufNewFile,BufRead,StdinReadPost *
    \ if getline(1) =~ '^#!.*\Wfish\s*$' |
    \   set ft=fish |
    \ endif
au FileType fish setl ts=2 sw=2 noet

" Functions {{{
" ------------------------------------------------------------------------------
func! CmdLine(str)
  	exe "menu Foo.Bar :" . a:str
  	emenu Foo.Bar
  	unmenu Foo
endfunc

func! VisualSelection(direction, extra_filter) range
	let l:saved_reg = @"
	exe "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		exe "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
	elseif a:direction == 'replace'
		call CmdLine("%s" . '/'. l:pattern . '/')
	elseif a:direction == 'f'
		exe "normal /" . l:pattern . "^M"
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endf

" Don't close window, when deleting a buffer
command! Bclose call <sid>BufcloseCloseIt()
func! <sid>BufcloseCloseIt()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")

	if buflisted(l:alternateBufNum)
		buffer #
	else
		bnext
	endif

	if bufnr("%") == l:currentBufNum
		new
	endif

	if buflisted(l:currentBufNum)
		exe("bdelete! ".l:currentBufNum)
	endif
endfunc

" Git branch on status line
func! GitBranch()
	let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
	if branch != ''
		return '[git:' . substitute(branch, '\n', '', 'g') . ']'
	endif
	return ''
endfunc
" }}}
