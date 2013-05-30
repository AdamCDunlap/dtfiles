"
" ~/.vimrc
"
filetype plugin on

"" j and k move down one screen line, not one actual line
"noremap j gj
"noremap k gk
set autowrite
imap jj <Esc>

autocmd FileType tex noremap <F4> <ESC>:w<CR>:exec "!make verbose=0 -s &>/dev/null &"<CR><CR>
autocmd FileType tex inoremap <F4> <ESC>:w<CR>:exec "!make verbose=0 -s &>/dev/null &"<CR><CR>a
autocmd FileType tex,bib setlocal linebreak " Wrap words at spaces
autocmd FileType tex,bib setlocal display=lastline " Don't show @'s if the last line on screen is long
autocmd FileType tex,bib setlocal spell " Spellcheck
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

set relativenumber
set numberwidth=2
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Fold when reaching a { { {
set fdm=marker
" Mark lines that wrap around
set showbreak=->
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow

inoremap <F1> <ESC>
noremap <F1> <ESC>

" Map w!! to use sudo to write the file
command Sudo w !sudo tee % >/dev/null
