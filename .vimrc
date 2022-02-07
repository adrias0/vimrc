set number
set numberwidth=1
set mouse=a
set clipboard=unnamed
set showcmd
set cursorline
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
syntax on
set nocompatible
set tabstop=2
set autoindent
set laststatus=2
set bg=dark
set termguicolors
" Plugins
call plug#begin('~/.vim/plug')

" Themes
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'joshdick/onedark.vim'
Plug 'HenryNewcomer/vim-theme-papaya'
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'
Plug 'ayu-theme/ayu-vim'

" Busqueda por terminal
Plug 'junegunn/fzf', {'do':{ -> fzf#install()}}
Plug 'junegunn/fzf.vim'

"completa
Plug 'pangloss/vim-javascript' "soporde para javascript
Plug 'leafgarland/typescript-vim'	"syntax scripting

" Autocompletado
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'sirver/ultisnips'
Plug 'valloric/youcompleteme'

" Temux
Plug 'benmills/vimux'
Plug 'vim-airline/vim-airline'

" Auto type
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'yggdroot/indentline'

"satus bar linea de abajo que muestra el estado
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

"resaltado de syntax
Plug 'sheerun/vim-polyglot'


call plug#end()


colorscheme gruvbox
let g:gruvbox_contrast_darck = "hard"
"highlight Normal ctermbg=NONE
"colorscheme solarized8
"let g:solarized_termcolors=256
"colorscheme onedark
"let g:onedark_hide_endofbuffer
"colorscheme papaya
"color seoul256
"colorscheme OceanicNext
"let g:airline_theme='oceanicnext'
"colorscheme ayu
"let g:ayucolor="mirage"
"let ayucolor="dark"

"color de la barra ling
let g:lightline = {
			\'colorscheme': 'wombat',
			\}

let NERDTreeQuitOnOpen=1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"navigator
noremap <Leader>> 10<C-w>>
noremap <Leader>< 10<C-w><
"cambiar de panel
noremap <silent> <Leader><C-h> :TmuxNavigateLeft<cr>
noremap <silent> <Leader><C-j> :TmuxNavigateDown<cr>
noremap <silent> <Leader><C-k> :TmuxNavigateUp<cr>
noremap <silent> <Leader><C-l> :TmuxNavigateRight<cr>

" Mapeos de teclado
let mapleader=" "
noremap <leader>gs :CocSearch
noremap <leader>fs :Files<cr>

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>ob :Buffers<cr>

" abre terminal
set splitright
function! OpenTerminal()
	execute "normal \<C-1>"
	execute "normal \<C-1>"
	execute "normal \<C-1>"
	execute "normal \<C-1>"

	let bufNum = bufnr("%")
	let bufType = getbufvar(bufNum, "&bufType", "not found")

	if bufType == "terminal"
		"cierra terminal
		execute "q"
	else
		" abre terminal
		execute "vsp term://zsh"

		execute "set nonu"
		execute "set nornu"

		"insert enter exit
		silent au BufLeave <buffer> stopinsert!
		silent au BufWinEnter,WinEnter <buffer> startinsert!

		"map inside terminal buffer
		execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"

		execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
		execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

		startinsert!
	endif
endfunction!
nnoremap <C-t> :call OpenTerminal()<CR>
