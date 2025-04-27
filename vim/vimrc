set nocompatible              " required
filetype off                  " required
set number
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'preservim/nerdtree'
Plugin 'sjl/badwolf'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
nnoremap <silent> <F3> :NERDTreeToggle<CR>

let g:NERDTreeNodeDelimiter = "\u00a0"
syntax on
set backspace=indent,eol,start

colorscheme badwolf
set display+=lastline

" f5 to remove trailing blank space
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" relative number
set relativenumber

" delay time
set timeoutlen=1000
set ttimeoutlen=50

" for C code
set autoindent
set cindent
set shiftwidth=4
