set rtp+=/home/marvis/.vim/pack/tabnine-vim
set relativenumber
set number
set hlsearch

let mapleader = ","

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
"Plug 'dense-analysis/ale'
Plug 'crusoexia/vim-monokai'
Plug 'VundleVim/Vundle.vim'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rafi/awesome-vim-colorschemes'
"Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
"Plug 'sheerun/vim-polyglot' " Syntax Highlighting
"Plug 'Valloric/YouCompleteMe' " Vim Autocompletion

call plug#end()

syntax enable
colorscheme onedark
" colorscheme monokai
set background=dark
" packadd! dracula
" colorscheme dracula

map <C-t> :NERDTreeToggle<CR>
map <C-a> :FZF<CR>
map <C-f> :Ag 

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd ColorScheme * call <sid>update_fzf_colors()
augroup END

nnoremap <silent> <leader>jd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>jr :YcmCompleter GoToReference<CR>
nnoremap <silent> <leader>rr :YcmCompleter RefactorRename<CR>

let g:ale_linters = {
            \'javascript': ['eslint'],
            \'javascriptreact': ['eslint'],
            \'typescript': ['eslint'],
            \'typescriptreact': ['eslint'],
                        \'html': ['eslint'],
                        \'python': ['flake8', 'pylint'],
            \}
let g:ale_fixers = {
            \'javascript': ['prettier'],
            \'javascriptreact': ['prettier'],
            \'typescript': ['prettier'],
            \'typescriptreact': ['prettier'],
                        \'html': ['prettier'],
                        \'python': ['autoimport', 'black', 'isort'],
            \}


filetype plugin on

set nocp
set backspace=indent,eol,start

