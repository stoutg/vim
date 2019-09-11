set number relativenumber
set cursorline
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu " autocomplete for vim commands
set hlsearch " highlight all search matches
set incsearch " highlight search as you type
set ai " auto indent
set si " smart indent

syntax enable " sytax highlighting

" Enable filetype plugins
filetype plugin on
filetype indent on

nnoremap \nt :NERDTreeToggle<CR>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
