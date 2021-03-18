set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"SimplyFold para manejar el agrupamiento de codigo
Plugin 'tmhedberg/SimpylFold'

"Identación para Python
Plugin 'vim-scripts/indentpython.vim'

"Autocompletado para python (puede extenderse a mas, revisar) 
Bundle 'Valloric/YouCompleteMe'

"Chequeo de sintaxis en cada guardado
Plugin 'vim-syntastic/syntastic'

"Chequeo de cumplimiento de estandar PEP8
Plugin 'nvie/vim-flake8'

"Tema general chill 
Plugin 'jnurmine/Zenburn'

"Tema para convulsionar
Plugin 'tomasr/molokai'

"Explorador de archivos
Plugin 'scrooloose/nerdtree'

"Tabs
Plugin 'jistr/vim-nerdtree-tabs'

"Super-buscador. Busca archivos y tags
Plugin 'kien/ctrlp.vim'

"Tagbar
Plugin 'majutsushi/tagbar'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"Para que no tarde mucho en cambiar de modo 
set ttimeoutlen=50


"Activar los numeros al costado
set nu


"Para que resalte el codigo y se vea cheto
let python_highlight_all=1
syntax on
"colorscheme zenburn temita chill
colorscheme molokai

"Para decidir como hacer el layout. Los splits horizontales se crean abajo
"y los splits verticales se crean a la derecha
set splitbelow
set splitright


"DEFINO EL LEADER
let mapleader=" "


"Split navigation:
"Para moverme entre los paneles, en modo normal tendria que usar primero
"la combinacion ctrl+w para pasar a seleccion de ventanas, y luego ctrl+j
"para ir a la ventana de la izquierda. Para cambiar esto y poder hacerlo
"con una sola combinacion, agrego la siguientes lineas que hacen un mapeo 
"(valido para el modo normal, eso indica el nnoremap) de este par de 
"combinaciones de teclas a una sola combinacion
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"Code folding
"Refiere a la capacidad de las IDEs de trabajar con bloques de código,
"mostrando por ejemplo solo la definición de una clase en lugar de todo el
"código que contiene. Para colapsar o cerrar los folds se debe usar
"la combianción de teclas za. También se puede hacer un mapeo para usar
"una tecla mas comoda para esto, como la barra espaciadora
"Enable Folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za
"La linea set foldmethod=ident refiere a que se va a fijar en la identacion
"para definir las folds. Esto usualmente genera muchas mas folds de las que
"creemos necesarias. Para eso se instala un plugin que maneje de mejor 
"manera el agrupamiento de código. Por ejemplo, SimplyFold.
"Descomentar la siguiente linea si quiero que al armar un folder se 
"muestre en esa linea la descripción de la folder armada
"let g:SimpylFold_docstring_preview=1


"Evitar espacios en blanco
"La siguiente linea se puede interpretar como una flag para marcar
"espacios en blanco innecesarios de manera de que sea facil 
"identificarlos y corregirlos a la hora de escribir codigo
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


"Set encoding UTF8 
"Pido que por defecto se trabaje en codificación UTF8 (Conveniente
"para python)
set encoding=utf-8


"Configuraciones de YOUCOMPLETEME
"Primero agrego una configuración para que la ventana de autocompletado 
"se cierre una vez que termine de escribir. La segunda linea define un
"shortcut para ir a la definición. 
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>



"Python virtualenv support
"El siguiente bloque de código cumple la función de integrar a vim 
"los elementos necesarios para poder trabajar con los environments
"de python de manera adecuada, de manera de que si por ejemplo se 
"utiliza la función para ir a una definición, el buscador muestre
"el archivo que corresponda al environment actualemente en uso y no 
"otra versión. El codigo determina si estas usando un environment
"y de acuerdo a eso modifica los paths necesarios.
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


"Tagbar configuracion
"Mapeto al toggle display al F4
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
" let g:tagbar_autofocus = 1


"NERDTree configuracion
"Mapeo al toggle display F3
map <F3> :NERDTreeToggle<CR>
"Abrir nerdtree con el archivo actual seleccionado
nmap ,t :NERDTreeFind<CR>
"Ignorar algunos tipos de archivo
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']



