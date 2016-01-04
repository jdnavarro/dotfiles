call plug#begin('~/.config/nvim/plugged')

Plug 'chriskempson/base16-vim'

Plug 'benekastah/neomake'

Plug 'Shougo/deoplete.nvim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'

Plug 'godlygeek/tabular'

Plug 'simnalamburt/vim-mundo'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'keith/investigate.vim'

Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim' | Plug 'Shougo/vimproc', { 'for': 'haskell' }
Plug 'dan-t/vim-hsimport', { 'for': 'haskell' }

Plug 'bling/vim-airline'

call plug#end()

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autowrite
set undofile
set showmatch
set spelllang=en_US
set list
set listchars=tab:»\ ,trail:·,extends:❯,precedes:❮,eol:¬
set wildmode=longest:full,full
set showbreak=↪
set showcmd
set ignorecase
set smartcase
set splitbelow
set splitright
set lazyredraw
set noswapfile

let mapleader = "\<space>"

let base16colorspace=256
set bg=light
colorscheme base16-tomorrow

let g:UltiSnipsListSnippets = "<S-tab>"

let g:airline_powerline_fonts = 1

let g:haskell_tabular = 1

let g:haskellmode_completion_ghc = 0

let g:deoplete#enable_at_startup = 1

let g:neomake_open_list = 0
let g:neomake_place_signs = 1
let g:neomake_haskell_enabled_makers = ['hlint', 'ghcmod']

let g:investigate_url_for_haskell="http://hayoo.fh-wedel.de/?query=^s"

augroup haskell
  autocmd!
  autocmd FileType haskell
      \ setlocal textwidth=79 tags=/tmp/codex.tags omnifunc=necoghc#omnifunc formatprg=stylish-haskell|
      \ nmap <leader>t :GhcModType<CR>|
      \ nmap <leader>i :GhcModTypeInsert<CR>|
      \ nmap <leader>d :GhcModTypeClear<CR>|
      \ nmap <silent> <leader>m :silent update <bar> HsimportModule<CR>|
      \ nmap <silent> <leader>y :silent update <bar> HsimportSymbol<CR>|
      \ nmap <leader>k :call investigate#Investigate()<CR>
      \ let g:neomake_enabled_makers = ['cabal']
  autocmd BufWritePost *.hs Neomake
augroup END

nmap <leader>s :update<CR>
nmap <silent> <leader>r :source ~/.config/nvim/init.vim<CR>
nmap <leader>dh :lcd %:p:h<CR>
nmap <leader>db :lcd -<CR>
nmap <leader>c :Neomake<CR>:lopen<CR>
nmap <leader>C :Neomake!<CR>:copen<CR>
nmap <leader>h :set cursorline! cursorcolumn!<CR>
nmap <leader>G :!codex update --force<CR><CR>

nmap <silent> <leader>u :GundoToggle<CR>

" Align on equal signs
map <leader>a= :Tab /=<CR>
" Align on commas
map <leader>a, :Tab /,<CR>
" Align on pipes
map <leader>a<bar> :Tab /<bar><CR>
" Prompt for align character
map <leader>ap :Tab /
" Enable some tabular presets for Haskell

" From https://github.com/begriffs/haskell-vim-now
function! Pointfree()
  call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vmap <silent> <leader>. :call Pointfree()<CR>

function! Pointful()
  call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vmap <silent> <leader>> :call Pointful()<CR>

cabbrev vv ~/.config/nvim/init.vim
cabbrev vt ~/.config/termite/config
