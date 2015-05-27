"
" ~/.vimrc
"
filetype plugin on

autocmd FileType tex,bib setlocal linebreak " Wrap words at spaces
autocmd FileType tex,bib setlocal display=lastline " Don't show @'s if the last line on screen is long
autocmd FileType tex,bib setlocal spell " Spellcheck
autocmd FileType tex setlocal tabstop=2
autocmd FileType tex setlocal shiftwidth=2
autocmd FileType tex setlocal softtabstop=2

"" For vim-latexsuite
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"
let g:Tex_MultipleCompileFormats = "pdf,dvi"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_SmartKeyBS = 0
let g:Tex_SmartDots = 0
let g:Tex_Folding = 0

"" For YouCompleteMe
let g:ycm_filetype_blacklist = { 'tex' : 0 }

"" Persistent undo across sessions
set undofile
"" Put all the undo files in here (create first)
"set undodir=~/.vim/undodir
