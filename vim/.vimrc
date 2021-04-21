set rtp+=~/.vim/pack/tabnine-vim
set rtp+=~/.vim/bundle/Vundle.vim
set background=dark

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'rafi/awesome-vim-colorschemes'
call vundle#end()

colorscheme gruvbox

map <F5> :NERDTreeToggle<CR>
