" Plugin management with Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Standard vim defaults
Plugin 'tpope/vim-sensible'
" Git commands from vim
Plugin 'tpope/vim-fugitive'
" Filesystem explorer
Plugin 'scrooloose/nerdtree'
" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'
" Autoread files changed outside the buffer
Plugin 'djoshea/vim-autoread'
" Better JSON for vim
Plugin 'elzr/vim-json'
" Chef navigation
Plugin 't9md/vim-chef'
call vundle#end()
filetype plugin indent on
" END

" Personal configs
" Enable syntax highlighting
syntax on
" Highlight matching searches
set hlsearch
" Well, ignore case...
set ignorecase
" When pasting or opening brackets, try to audoindent
set autoindent
" How many columns text is indented with the reindent operations (<< and >>)
set shiftwidth=2
" How many columns when you hit Tab in insert mode
set softtabstop=2
" Use spaces instead of tabs when hitting Tab
set expandtab
" Enable mouse interaction for all modes
set mouse=a
" Disables things like word wrap and auto-indent
set paste
" When opening new vertical buffers, open them on the right
set splitright
" Same but for horizontal
set splitbelow

" Chef plugin config
map <C-g> :ChefFindAnyVsplit<CR>
map <C-b> :ChefFindAnySplit<CR>


" NERDTree Configuration "
" Open filesystem navigator if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py', 'Magenta', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('rb', 'Magenta', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('sh', 'Red', 'none', 'red', '#151515')

" Shortcuts
" Open filesystem tree navigation with Ctrl + N
map <C-n> :NERDTreeToggle<CR>

