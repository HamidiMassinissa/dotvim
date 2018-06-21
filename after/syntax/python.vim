"
" Highlight python docstrings as comments (vim syntax highlighting)
" take a loot at:
"   https://stackoverflow.com/questions/16041638/highlight-python-docstrings-as-comments-vim-syntax-highlighting
" echo "lalal"
syn region pythonComment  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonComment  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
hi link pythonComment Comment
" syntax region Comment start=/'''/ end=/'''/
" syn region Comment start=+^\s*"""+ end=+"""+ keepend contains=...
" syn region pythonDocString start=+^\s*"""+ end=+"""+ keepend contains=...
" highlight Comment cterm=italic

"
" Take a look at:
"   https://vi.stackexchange.com/questions/10035/how-can-i-make-highlighting-commands-in-vimrc-take-effect-immediately-with-vim
" in order to get a good understanding about custom highlights, etc.
