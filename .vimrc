" based on https://dougblack.io/words/a-good-vimrc.html
" <leader> is \

set number relativenumber	" show relative line numbers from the cursor, show the current line number for the cursor
set cursorline			" underline the current line the cursor is on
set wildmenu			" visual autocomplete for command menu
set showmatch			" highlight matching [{()}]
set incsearch			" search as characters are entered
set hlsearch			" highlighting matches
set autoindent			" turns on auto indenting
set smartindent			" I don't know what it does but 'does the right thing (mostly) in programs'
set so=7			" Always maintain a 7 line buffer between the cursor and the top and bottom of the screen

" quickfix settings http://vimdoc.sourceforge.net/htmldoc/quickfix.html#quickfix-window
" open quickfix window
map <F5> <ESC>:copen<CR>
" close quickfix window
map <F6> <ESC>:cclose<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

syntax enable	" syntax highlighting

" allows cursor change in tmux mode
"if exists('$TMUX')
"	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif

" create language-specific settings for certain filetypes/file extensions
augroup configgroup
	autocmd!
	autocmd BufEnter *.yml setlocal softtabstop=4
	autocmd BufEnter *.yml setlocal expandtab
	autocmd BufEnter *.md setlocal softtabstop=4
	autocmd BufEnter *.md setlocal expandtab
	autocmd BufEnter *.tcl setlocal softtabstop=4
	autocmd BufEnter *.tcl setlocal expandtab
	autocmd BufEnter *.groovy setlocal tabstop=4
	autocmd BufEnter *.groovy setlocal noexpandtab
	autocmd BufEnter *.groovy setlocal shiftwidth=4
	autocmd BufEnter *.java setlocal tabstop=4
	autocmd BufEnter *.java setlocal noexpandtab
	autocmd BufEnter *.java setlocal shiftwidth=4
augroup END
" ~/.vim/after/ftplugin
" filetype plugin indent on

execute pathogen#infect()

" NERDTree mappings
map <F2> <Esc>:NERDTreeToggle<CR> " Toggle the file browser
map <A-F1> <Esc>:NERDTreeFind<CR> " Find the current file in the browser
" map <C-l> :tabn<CR> " move to the tab to the right
" map <C-h> :tabp<CR> " move to the tab to the left

" Bufer Explorer
map <F3> <Esc>\be

" EasyGrep
let g:EasyGrepMode=2
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=1
let g:EasyGrepIgnoreCase=1

" TagList (& ctags) mappings
nnoremap <silent> <F4> <ESC>:TlistToggle<CR>

" Show status line.  File name, modified (+), and line number
:set laststatus=2

" Return to the last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
