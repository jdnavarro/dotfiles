" Danny Navarro vim configuration file

" General configuration
filetype on
filetype plugin on
filetype plugin indent on
syn on
set nocompatible
set et " expandedtab (inserts spaces instead of tab, Ctrl-V TAB)
set ai " autoindent
set sw=4 " shiftwidth (number of spaces for autoindent)
set ts=4 " tabstop (number of spaces for a tab)
set sts=4 "softtab (number of spaces in insert mode)
set smartindent
set incsearch
set ignorecase
set showmatch " (shows closing bracket)
set smarttab " (inserts blanks according to shiftwidth)
set popt=number:y " printoptions (prints line numbers)
set backspace=indent,eol,start " backspace behavior
set hlsearch " highlight search
set mousehide
set number
set ruler
set laststatus=2 " Saves windows status after closing
set display=lastline
set directory=/tmp " Where to store swp files
set backupdir=~/.vim/backups " tilde files
set showcmd
set wildmenu
set wildmode=longest,list
set bg=dark
let python_highlight_all = 1

" Persistent Undo
set undofile
set undodir=~/vim/undo

" Yankring
nnoremap <silent> <F9> :YRShow<CR>
let g:yankring_window_use_horiz=0
let g:yankring_history_dir='~/.vim/yankring_history'

" xmledit
let xml_use_xhtml = 1

" Taglist
nnoremap <silent> <F8> :TlistToggle<CR>

" Special handling for some file formats.
hi Folded guibg=gray15 guifg=gray50
au FileType python set nowrap list textwidth=74
au BufNewFile,BufRead *.pt set ft=html
au BufNewFile,BufRead *.zcml set ft=xml
au BufNewFile,BufRead *.txt set textwidth=74
au FileType html,xml,pt,zcml set sw=2
au FileType rst set textwidth=74 spell

au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType html set omnifunc=htmlcomplete#CompleteTags

" GUI specific configuration
if has("gui_running")
    set go-=m
    set go-=T
    set list
    set lcs=tab:»·,trail:·,extends:»,precedes:«,eol:$
    set nu
    set guifont=Anonymous\ Pro\ 10
    behave mswin
endif

" Zenburn color scheme
:colorscheme zenburn
" Alternative bg for bright env.
"let g:zenburn_high_Contrast = 1
