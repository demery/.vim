set nocompatible " don't act all vi; must be first

call pathogen#infect()
" no toolbars
if has("gui_running")
    set guioptions=egmrt
endif

if has("win32")
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin

  set diffexpr=MyDiff()
  function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        let cmd = '""' . $VIMRUNTIME . '\diff"'
        let eq = '"'
      else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  endfunction
  colors ir_black
  set backupdir=c:\tmp,c:\temp
  set directory=c:\tmp,c:\temp
else
  " tmp files
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif

:set viminfo+=h
" many config tips from: http://items.sjbach.com/319/configuring-vim-right

" general vim stuff
" set nu            " show line numbers
set hidden        " don't require writes before switching buffers
set history=1000
let mapleader= "," 
"set wildmode=list:longest " show completion options

" stop making noise; people hate that
set visualbell

" wildmode tab completion
set wildmode=longest,list,full
set wildmenu

" See :help shortmess for the breakdown of what this changes.
set shortmess=atI

" display and appearance
" set title
set bg=dark
set ruler         " show line and column numbers
" always display the staus line
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%] 
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
nmap <silent> <leader>s :set nolist!<CR>

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

" NERDTree
let NERDTreeShowBookmarks=1
map <leader>r :NERDTreeToggle<CR>

" FuzzyFileFinder
map <Leader>t :FuzzyFinderTextMate<Enter>
" Kill current buffer
map <leader>w :Kwbd<CR>

" remap makegreen
map <Leader>g <Plug>MakeGreen 
