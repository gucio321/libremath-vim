let libremath = "~/.vim/mysyntax/ibremath.vim"
au BufRead,BufNewFile *.lm set filetype=libremath
au! Syntax libremath source ~/.vim/mysyntax/ibremath.vim
