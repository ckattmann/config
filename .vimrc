set nocompatible            " no vi compatibility
filetype off
" Set up Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/MatchTagAlways' " => Highlights the active tags
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary' " => gcc to comment out/in lines 
Plugin 'tpope/vim-surround' " => cs[{ to change ticks from [ to { 
Plugin 'mattn/emmet-vim' " => <C>y, for fast html
Plugin 'scrooloose/nerdtree'
Plugin 'digitaltoad/vim-pug'
call vundle#end()

set laststatus=2

filetype indent plugin on   " Activate things

set omnifunc=syntaxcomplete#Complete " Activate autocomplete with ctrl-x ctrl-o
colorscheme desert           " dark colorscheme
let mapleader=","           " Set Mapleader to ,
syntax on                   " Syntax Highlighting on
set number                  " Show line numbers
set ruler                   " Show Statusline
set hlsearch

set tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Change file signature on save
set backupcopy=yes

" Automatically set parent directory of file as cwd
set autochdir

" CTRL-T for Nerdtree
map <C-t> :NERDTreeToggle<CR>

" More logical behaviour for j and k on multiline rows
noremap j gj
noremap k gk

map <C-s> :w<CR>
map <C-x> :x<CR>
map <C-q> :q<CR>

" <F9> to open vsplit
map <F9> :w<CR>:vsplit<CR><C-w><right>:e .<CR>

" Open .vimrc with <F12>
map <F12> :wa<CR><F9>:e ~/.vimrc<CR>

augroup source
autocmd!
autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" <F11> to switch to pwd
map <F11> :w<CR>:e .<CR>

" Ctrl-left and right to move cursor between the two windows
map <C-left> <C-w><left>
map <C-right> <C-w><right>

" Use <F6> to search, <ESC> to switch off highlighting
map <F6> *N
noremap <ESC><ESC> :nohl<CR><ESC>

" Map Space to / for quicker search
map <Space> /

augroup Group1
autocmd!
"------HTML------
" Display HTML-File in Browser
autocmd FileType html nmap <F5> :wa<CR>:!firefox % &<CR>
" Expand Tags with <F2>
autocmd FileType html nmap <F2> yiwI<<ESC>ea><ESC>o</<ESC>pa><ESC>O
" Expand Tags in one line with <F3>
autocmd FileType html nmap <F3> <ESC>yiwI<<ESC>ea><ESC>mna</<ESC>pa><ESC>`na
" Comment out line with <F4>
autocmd FileType html nmap <F4> <ESC>I<!--<SPACE><ESC>A<SPACE>--><ESC>
"
"------PYTHON------
" Execute Script with <F5>
map <leader>p :w<CR> :!~/anaconda3/bin/python %<CR>
autocmd FileType python nmap <F5> :wa<CR>:!~/anaconda3/bin/python %<CR>
" Comment out line with <F4>
autocmd FileType python nmap <F4> I#<ESC>

"------LATEX-------
" Compile Latex and show pdf
autocmd FileType tex nmap <F5> :wa<CR>:!rm -f %:r.aux<CR>:!xelatex %<CR>:!xelatex %<CR>
":!evince %:r.pdf&<CR>
" Expand bla to \bla{} and place cursor inside braces
autocmd FileType tex imap <F6> {}<ESC>bbi\<ESC>wwa
" Expand bla to \begin{bla} ... \end{bla} and places cursor on new line in
" between
autocmd FileType tex imap <F7> <ESC>yiwi\begin{<ESC>ea}<ESC>o\end{<ESC>pa}<ESC>O
autocmd FileType tex nmap <leader>c :w<CR>:!detex % <BAR> wc -w <CR>
" Comment out line with <F4>
autocmd FileType tex nmap <F4> I%<ESC>


"------JSON------
" Pretty print with F5
autocmd Filetype json nmap <F5> :%!python -m json.tool<CR>
augroup END
