set nocompatible " don't act all vi; must be first

call pathogen#infect()
" no toolbars
if has("gui_running")
  set guioptions=egmrt
  colors vividchalk
else
  colorscheme vividchalk
endif

if has('win32') || has ('win64')
  let $VIMHOME = $VIM."/vimfiles"
else
  let $VIMHOME = $HOME."/.vim"
endif

if (has("win32") || has("win64")) && filereadable($VIMHOME/vimrc_windows_additions)
  so $VIMHOME/vimrc_windows_additions
else
  " tmp files; don't cludder the file dir with ~* files
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif

:set viminfo+=h
" many config tips from: http://items.sjbach.com/319/configuring-vim-right

" general vim stuff
set nu            " show line numbers
set hidden        " don't require writes before switching buffers
set history=1000  " keep a long history
let mapleader= "," " leader for shortcut commands
"set wildmode=list:longest " show completion options

" stop making noise; people hate that
set visualbell

" wildmode tab completion; more useful Ctrl-n completions
set wildmode=longest,list,full
set wildmenu

" See :help shortmess for the breakdown of what this changes.
" 
" flag  meaning when present  ~
"   f  use "(3 of 5)" instead of "(file 3 of 5)"
"   i  use "[noeol]" instead of "[Incomplete last line]"
"   l  use "999L, 888C" instead of "999 lines, 888 characters"
"   m  use "[+]" instead of "[Modified]"
"   n  use "[New]" instead of "[New File]"
"   r  use "[RO]" instead of "[readonly]"
"   w  use "[w]" instead of "written" for file write message and "[a]" instead of "appended" for ':w >> file' command
"   x  use "[dos]" instead of "[dos format]", "[unix]" instead of "[unix format]" and "[mac]" instead of "[mac format]".
"   a  all of the above abbreviations
"
"   [snip]
"   t  truncate file message at the start if it is too long to fit on the command-line, "<" will appear in the left most column.
"   [snip]
"   I  don't give the intro message when starting Vim |:intro|.
"   [snip]
set shortmess=atI

" display and appearance
set bg=dark " dark background
set ruler   " show line and column numbers
" always display the status line
set laststatus=2
" show useful stuff on the status line like full path to the file, its type
" and the line and column number of the cursor
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%] 
" different colors for active pane
hi StatusLine cterm=NONE ctermbg=darkgreen ctermfg=white gui=bold guibg=green guifg=black 
hi StatusLineNC cterm=NONE ctermbg=lightgrey ctermfg=black gui=bold guibg=#060606 guifg=black 

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" coding
syntax on
filetype on 
filetype plugin on
filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab
set showmatch
set autoindent
set smartindent

" show whitespace
" By default whitespace will be hidden, but now it can be toggled with ,s.
if has("win32")
  set listchars=tab:>-
else
  set listchars=tab:>-,trail:·,eol:$
endif

" I don't remember what the next lines do
nmap <silent> <leader>$ :set nolist!<CR>
" navigation
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" searching
set incsearch
set ignorecase
set smartcase
set encoding=utf-8

" Windows
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>h :wincmd h<CR>
map <leader>l :wincmd l<CR>

" spelling on
map <leader>s :setlocal spell! spelllang=en_us<CR>
" spell: add word, skip to next
nmap <leader>zg zg]s
" spell: add word to global list, skip to next
nmap <leader>zG zG]s
" spell: next misspelled word
nmap <leader>zn ]s
" spell: previous misspelled word
nmap <leader>zp [s
" spell: last added word
nmap <leader>zb <C-o>

" NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
map <leader>r :NERDTreeToggle<CR>

" FuzzyFileFinder
map <Leader>t :FuzzyFinderTextMate<Enter>
" Kill current buffer
map <leader>w :Kwbd<CR>

" remap makegreen
map <Leader>g <Plug>MakeGreen 

" my checklist macros
" done
nmap <leader>xd 0rx
" n/a
nmap <leader>xn 0r-
" started, awaiting completion
nmap <leader>xs 0r/
" fix hashes from :sym => val to sym: val
nmap <leader>fh :%s/:\([a-zA-Z_]\+\) =>/\1:/g<CR>
