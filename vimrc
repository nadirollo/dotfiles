" Plugin management with Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()
filetype plugin indent on
" END

" Personal configs
syntax on
set hlsearch
set ignorecase
set autoindent
set shiftwidth=2
set softtabstop=2
set expandtab
set mouse=a
set paste
" Shortcuts
map <C-n> :NERDTreeToggle<CR>
