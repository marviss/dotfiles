set tabstop=4
syntax on

"colorscheme monokai
set number

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
call vundle#end()

map <F5> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>

map <C-a> :FZF<CR>

"let g:fzf_preview_window = 'right:50%'
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

set paste

set background=dark
colorscheme gruvbox

set smartindent   " Do smart autoindenting when starting a new line
set shiftwidth=4  " Set number of spaces per auto indentation
set expandtab     " When using <Tab>, put spaces instead of a <tab> character

set listchars=tab:>-,trail:-,nbsp:_
set list

filetype plugin indent on

