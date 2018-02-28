syntax on 

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

set autoindent              "set auto indentation
"set background=dark         "set background color
set backupdir=/tmp
set mouse=a					"enable the mouse
"set colorcolumn=80			"put fences to line codes,
							"yep! we must not go beyond this limit
"set textwidth=78			"A longer line will be broken
							"But you have to move to the start of the file
							"then type gqG ('gg' moves you to the begining of
							"file while 'G' to the end
set tabstop=4 shiftwidth=4 expandtab "tabulation amount

set smartindent
set laststatus=2 			"show the status line
set number

"setting up powerline - fency stuff for status line
set rtp+=~/.local/lib/python2.7/dist-packages/powerline/bindings/vim/

"set rtp+=/usr/local/share/ocamlmerlin/vim		"adding merlin to the rtp
"set rtp+=/usr/local/share/ocamlmerlin/vimbufsync
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']		"so that syntastic displays
												"the errors detected by merlin

let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

let g:syntastic_java_javac_classpath= '.:./*/:/usr/share/java/*.jar'

"Now I'm learning Vimscript the hard way with Steve Losh
"here http://learnvimscriptthehardway.stevelosh.com/
"echo "(>^.^<) *-..-> I am controlling you!"
"echo "This beautiful hottie is a true goddess!"

"Color scheme
" Make the terminal use 256 colors which is not the case by default
" this is done by setting t_Co to 256 colors ...
set t_Co=256
" ... then choose a colorscheme that suits your desires. Here I choosed one
" from those categorized at http://cocopon.me/app/vim-color-gallery/
"colorscheme hybrid
"colorscheme summerfruit256
"colorscheme phd
"colorscheme github
let g:solarized_contrast="high"
let g:solarized_termcolors=256
syntax enable
"set background=light
"set background=dark
colorscheme solarized

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

"shortcut to open NERDtree
let mapleader = ","
nmap <leader>ne :NERDTree<cr>

"customizing size of NERDtree window
let g:NERDtreeWinSize=20

"make NERDtree ignore C/C++ object files
let NERDTreeIgnore=['\.o$', '\~$']

"recommended settings for syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" making syntastic work with std c++11 features
let g:syntastic_cpp_compiler_options = ' -std=c++11'

"setting path to libclang.so for clang_complete autocompletion plugin
let g:clang_library_path="/usr/lib/x86_64-linux-gnu"
let g:clang_complete_auto = 1

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

" enable clang_complete to work with std c++11 features
let g:clang_user_options="-std=c++0x"

" Always show statusline
set laststatus=2

au BufEnter *.ml setf ocaml
au BufEnter *.mli setf ocaml
au FileType ocaml call FT_ocaml()
function FT_ocaml()
    "set textwidth=80
    "set colorcolumn=80
    set shiftwidth=2
    set tabstop=2
    " ocp-indent with ocp-indent-vim
    let opamshare=system("opam config var share | tr -d '\n'")
    execute "autocmd FileType ocaml source".opamshare."/ocp-indent/vim/indent/ocaml.vim"
    filetype indent on
    filetype plugin indent on
endfunction

set backspace=indent,eol,start

" disable folding methods in python-mode
set nofoldenable

" disable syntasticCheck for latex
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["tex"] }

" syntastic check for "header file not found"
" the header files are searched inside the current and parent directory by default. So:
" let g:syntastic_c_include_dirs = [ '../include', 'include' ]
" YOU HAVE TO DO IT IN A .lvimrc IN THE CONCERNED LOCAL DIRECTORY

" <F5> now updates the tags file
map <f5> :!ctags -R .<cr>

" ctags additional key mappings
"  [x] Ctrl + \ : Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"  [x] Alt + ] : Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
