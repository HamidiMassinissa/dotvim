syntax on 

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

set autoindent              "set auto indentation
set background=dark         "set background color
set backupdir=~/.tmp
set mouse=a					"enable the mouse
set colorcolumn=80			"put fences to line codes,
							"yep! we must not go beyond this limit
set textwidth=78			"A longer line will be broken
							"But you have to move to the start of the file
							"then type gqG ('gg' moves you to the begining of
							"file while 'G' to the end
set tabstop=4				"tabulation amount

set smartindent
set laststatus=2 			"show the status line
set number

set rtp+=/usr/local/share/ocamlmerlin/vim		"adding merlin to the rtp
set rtp+=/usr/local/share/ocamlmerlin/vimbufsync
let g:syntastic_ocaml_checkers = ['merlin']		"so that syntastic displays
												"the errors detected by merlin

let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']



"Now I'm learning Vimscript the hard way with Steve Losh
"here http://learnvimscriptthehardway.stevelosh.com/
echo "(>^.^<) *-..-> I am controlling you!"

"Color scheme
" Make the terminal use 256 colors which is not the case by default
" this is done by setting t_Co to 256 colors ...
set t_Co=256
" ... then choose a colorscheme that suits your desires. Here I choosed one
" from those categorized at http://cocopon.me/app/vim-color-gallery/
colorscheme hybrid

"	*-._/^-.->	MODAL MAPINGS

"let move lines downward with one keystroke '-'
nnoremap - ddp

"same thing here but it moves the line up instead of down
nnoremap _ dd2kp

"professional, as we are, let's disable arrow keys
nmap <Up>    <NOP>
" 'n' stands for normal mode ...
imap <Up>    <NOP>
" ... while 'i' stands for insert mode
nmap <Down>  <NOP>
imap <Down>  <NOP>
nmap <Left>  <NOP>
imap <Left>  <NOP>
nmap <Right> <NOP>
imap <Right> <NOP>

"Imagine we have to type this 'long' constant; MAX_CONNECTION_ALLOWED, with
"the folowing mapping, no need to hold shift the entire time, instead, you
"have just to type the constant in lowercase then use <c-u> mapping.
" <esc> get us back to normal mode
" vi	entering visual mode then selecting the curent word with 'w'
" U		set the selection to uppercase
" e		move to the end of selection
" a		ready to append!
inoremap <c-u> <esc>viwUea

"shortcut to open/close tag list window (taglist pluggin for browsing code)
noremap	<c-t>o	:TlistOpen<CR>
noremap <c-t>c	:TlistClose<CR>

"Navigate between window splits
nnoremap	<silent> <c-h>	:wincmd h<CR>
nnoremap	<silent> <c-j>	:wincmd j<CR>
nnoremap	<silent> <c-k>	:wincmd k<CR>
nnoremap	<silent> <c-l>	:wincmd l<CR>
