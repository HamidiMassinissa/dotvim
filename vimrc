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
set tabstop=4				"tabulation amount

set smartindent
set laststatus=2 			"show the status line
set number

set rtp+=/usr/local/share/ocamlmerlin/vim		"adding merlin to the rtp
set rtp+=/usr/local/share/ocamlmerlin/vimbufsync
let g:syntastic_ocaml_checkers = ['merlin']		"so that syntastic displays
												"the errors detected by merlin

let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
