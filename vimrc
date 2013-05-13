"
" ~/.vimrc
"
filetype plugin on

"" j and k move down one screen line, not one actual line
"noremap j gj
"noremap k gk
set autowrite
inoremap jj <Esc>

autocmd FileType tex noremap <F4> <ESC>:w<CR>:exec "!make verbose=0 -s &>/dev/null &"<CR><CR>
autocmd FileType tex inoremap <F4> <ESC>:w<CR>:exec "!make verbose=0 -s &>/dev/null &"<CR><CR>a
autocmd FileType tex,bib setlocal linebreak " Wrap words at spaces
autocmd FileType tex,bib setlocal display=lastline " Don't show @'s if the last line on screen is long
autocmd FileType tex,bib setlocal spell " Spellcheck
autocmd FileType tex,bib source $VIM/vimfiles/plugin/autocorrect.vim
autocmd FileType tex setlocal tabstop=2
autocmd FileType tex setlocal shiftwidth=2
autocmd FileType tex setlocal softtabstop=2

autocmd FileType arduino noremap <F4> <ESC>:w<CR>:exec "!make &>/dev/null &"<CR><CR>
autocmd FileType arduino noremap <F5> <ESC>:w<CR>:exec "!make upload &>/dev/null &"<CR><CR>
autocmd FileType arduino inoremap <F4> <ESC>:w<CR>:exec "!make &>/dev/null &"<CR><CR>a
autocmd FileType arduino inoremap <F5> <ESC>:w<CR>:exec "!make upload &>/dev/null &"<CR><CR>a

"autocmd! BufNewFile,BufRead *.pde setlocal ft=java
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

" Fold when reaching a { { {
set fdm=marker
" Mark lines that wrap around
set showbreak=->
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow

inoremap <F1> <ESC>
noremap <F1> <ESC>

" Map w!! to use sudo to write the file
command Sudo w !sudo tee % >/dev/null


" Complete C++ files
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
