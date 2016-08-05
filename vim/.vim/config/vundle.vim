set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()


Bundle "gmarik/vundle"

Bundle "scrooloose/nerdtree"

Bundle "vim-airline/vim-airline"
Bundle "vim-airline/vim-airline-themes"
" Fix for airline to appear not only in case of window split
set laststatus=2

Bundle "ctrlpvim/ctrlp.vim"

Bundle "scrooloose/syntastic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_perl_checkers = "perl"
"let g:syntastic_enable_perl_checker = 1
