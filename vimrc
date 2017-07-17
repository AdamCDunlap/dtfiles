"
" ~/.vimrc
"

" Required for Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rust-lang/rust.vim'
Plugin 'lervag/vimtex'
Plugin 'digitaltoad/vim-pug'
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on


" Text wrapping settings
se tw=80
se fo=cnrqtj

" The java plugin overrides the settings.. whyy
autocmd FileType java
    \ se fo-=l |
    \ se fo-=o |
    \ se fo+=t

autocmd FileType rust
    \ se fo-=l |
    \ se fo-=o |
    \ se fo+=t |
    \ se tw=80

autocmd FileType tex,bib setlocal linebreak " Wrap words at spaces
autocmd FileType tex,bib setlocal display=lastline " Don't show @'s if the last line on screen is long
autocmd FileType tex,bib,markdown setlocal spell " Spellcheck
autocmd FileType tex setlocal tabstop=2
autocmd FileType tex setlocal shiftwidth=2
autocmd FileType tex setlocal softtabstop=2
" autocmd FileType tex,markdown setlocal fo+=a
autocmd FileType tex inoremap " ``

autocmd FileType rust setlocal tw=100

"" For vim-latexsuite
" filetype plugin indent on
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor="latex"
" let g:Tex_MultipleCompileFormats = "pdf,dvi"
" let g:Tex_DefaultTargetFormat = "pdf"
" let g:Tex_SmartKeyBS = 0
" let g:Tex_SmartDots = 0
" let g:Tex_Folding = 0
" let g:Tex_IgnoredWarnings = 
"     \"Underfull\n".
"     \"Overfull\n".
"     \"specifier changed to\n".
"     \"You have requested\n".
"     \"Missing number, treated as zero.\n".
"     \"There were undefined references\n".
"     \"Citation %.%# undefined\n".
"     \"Font shape"
" let g:Tex_IgnoreLevel = 8
" let g:Tex_UseMakefile = 0

"" For YouCompleteMe
let g:ycm_filetype_blacklist = { 'tex' : 0, 'markdown' : 0 }
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm/cpp_default.py'
nnoremap <leader>jd :YcmCompleter GoTo<CR>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_rust_src_path = '/usr/local/share/rust/rustc-1.9.0/src'

"" Persistent undo across sessions
"set undofile
"" Put all the undo files in here (create first)
"set undodir=~/.vim/undodir

" Write file using sudo
cnoremap w!! w !sudo tee % >/dev/null

