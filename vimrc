set nocompatible " don't act all vi; must be first

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

" tmp files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

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
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" navigation
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" searching
set incsearch
set ignorecase
set smartcase
set encoding=utf-8

" keybindings
map <leader>t :NERDTreeToggle<CR>

" NERDTree
let NERDTreeShowBookmarks=1

