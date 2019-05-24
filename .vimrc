" general stuff
syntax on
" syntax enable
:let mapleader = ","

set clipboard=unnamed

set tabstop=4
set shiftwidth=4
set expandtab

set nu! " line numbers
set mouse=a

set nocompatible
filetype off " required
" filetype plugin on

"set cursorline
"set cursorcolumn
set encoding=utf-8
set t_Co=256

set laststatus=2
set noshowmode

set colorcolumn=80

" bells are evil!
set noerrorbells visualbell t_vb=

" tab navigation
map [1;5D <C-Left>
map [1;5C <C-Right>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-Left> <Esc>:tabprevious<CR>i
inoremap <C-Right>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Wrapped line navigation
nnoremap k gk
nnoremap j gj

" GUI
set go-=T
set go-=m
set go-=r
set go-=R
set go-=l
set go-=L


" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Yggdroot/indentLine'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()

filetype plugin indent on     " required!
syntax enable

" vim-colorschemes
colorscheme badwolf
" colorscheme flattown

" syntastic
let g:syntastic_python_python_exec = 'python3'
" let g:syntastic_quiet_messages = { 'type': 'style' }
" let g:syntastic_python_checkers = ['pyflakes']

" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" " nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" indentLine (show indentation)
let g:indentLine_char = '|'
let g:indentLine_color_term = 239
autocmd Filetype json :IndentLinesDisable

" NERDTree
map <C-y> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1

" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" vim-markdown
" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" vim-table-mode
let g:table_mode_corner_corner = '+'
let g:table_mode_header_fillchar = '='

" tmux compatibility
map <Esc>[B <Down>

if &term =~ '256color'
" if &term =~ '^screen'
" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

" do not quote signature in mutt
au BufRead /tmp/mutt* normal :g/^> -- $/,/^$/-1d^M/^$^M^L

nnoremap <leader>p Oimport pdb; pdb.set_trace()<Esc>
vnoremap <leader>y "+y<Esc>
nnoremap <leader>std istd::cout << << std::endl;<Esc>
inoremap <leader>std std::cout << << std::endl;<Esc>i
