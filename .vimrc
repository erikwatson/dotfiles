set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Setting FZF to be usable by Vim
" Note: You need to install fzf on your system for this to work
set rtp+=~/.fzf

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Put Your Plugins Here
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'beyondwords/vim-twig'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'airblade/vim-gitgutter'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'digitaltoad/vim-pug'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'neoclide/coc.nvim'
Plugin 'edkolev/tmuxline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Standard .vimrc stuff here
syntax enable
set background=dark
set expandtab
set relativenumber
set colorcolumn=80
set nowrap
set autoindent
set shiftwidth=4
set softtabstop=4
set ignorecase
set encoding=utf-8
set incsearch
hi MatchParen cterm=none ctermbg=white ctermfg=white

" Language specific indentation settings
autocmd Filetype ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype typescript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype sass setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype xml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype pug setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype html.handlebars setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype apache setlocal expandtab shiftwidth=2 softtabstop=2
autocmd Filetype markdown setlocal expandtab shiftwidth=2 softtabstop=2

" Faster Split Navigation Shortcuts
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Equalize Width of Splits
nnoremap <C-=> <C-W>=

" FZF Shortcut
nnoremap <C-P> :FZF <CR>

" FZF Display along the bottom instead of floating
let g:fzf_layout = { 'down':  '40%'}

" NERDTree Toggle
nnoremap <C-\> :NERDTreeToggle<CR><C-w>=

" NERDTree Show Hidden files by Default
let NERDTreeShowHidden=1

" Remove Trailing Whitespace on Save
autocmd BufWritePre * :%s/\s\+$//e

" Always use Unix file endings
set ff=unix

" Set the ; to be the new :, because holding shift sucks
:nmap ; :

" This makes sure we can use backspace to delete characters we haven't typed
set backspace=2

" Powerline Stuff
let g:airline_powerline_fonts = 1
let g:airline_#extensions#branch#enables = 1
let g:airline#extensions#tabline#enabled = 1

" NERDTree Stuff
" Don't show us vim's temp files in NERDTree
let NERDTreeIgnore=['\.swp$[[file]]', '\.swo$[[file]]']

set hlsearch

" Removes Search Highlighting the next time you hit Return
nnoremap <CR> :noh<CR><CR>

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

function ToggleTabSpaces()
    if (&sts > 3)
        setlocal ts=2 sts=2 sw=2
        echom "2 Spaces For Tabs"
    else
        setlocal ts=4 sts=4 sw=4
        echom "4 Spaces For Tabs"
    endif
endfunction

nnoremap <F9> :call ToggleTabSpaces() <CR>
inoremap <F9> <ESC> :call ToggleTabSpaces() <CR>i

