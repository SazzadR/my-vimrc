"-------------Notes------------"
" - Press 'zz' to instantly center the line where the cursor is located.
" - Press 'G' to instantly go to the last line of the file.
" - Type 'ctags -R[ --exclude=node_modules --exclude=vendor]' to index all file with ctags.
" - Press 'Ctrl+]' while hover a method and quickley go to the method decleration and 'Ctrl+^' to go to previous page.
" - Type ':b*' to close all buffer at once.

set nocompatible


so ~/.vim/plugins.vim


syntax enable


set backspace=indent,eol,start					"Make backspace behave like every other editor.
let mapleader = ','						        "The default leader is \, but a comma is much better.
set number							            "Let's activate line numbers.
autocmd BufWritePre * :%s/\s\+$//e              "Trim trailing white spaces on save


"-------------Visuals------------"
set tabstop=4                                   "Use 4 spaces as tab
set guifont=Operator\ Mono\ 14					"Change font.
colorscheme atom-dark
set t_Co=256
set linespace=15						        "Macvim-specific line-height.
set nowrap                      				"Don't wrap lines.

set guioptions-=m  						        "Remove menu bar
set guioptions-=T  						        "Remove toolbar
set guioptions-=r  						        "Remove right-hand scroll bar
set guioptions-=L  						        "Remove left-hand scroll bar


set smartindent
set tabstop=4
set shiftwidth=4
set expandtab




"-------------Search------------"
set hlsearch
set incsearch



"-------------Split Management------------"
set splitbelow
set splitright


nmap <A-Down> <C-W><C-J>
nmap <A-Up> <C-W><C-K>
nmap <A-Left> <C-W><C-H>
nmap <A-Right> <C-W><C-L>




"-------------Plugins------------"

"/
"/ CtrlP
"/
let g:ctrlp_extensions = ['buffertag']				        "Enable CtrlP file browsing

"Content and method browsing.
nmap <c-R> :CtrlPBufTag<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**,*/node_modules/**
set wildignore+=*/public/forum/**
" Don't ignore .files. eg. '.gitignore'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_match_window='order:ttb,min:1,max:15,result:15'

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"Make NERDTree easier to toggle.
nmap <Leader>k :NERDTreeToggle<cr>

"/
"/ greplace.vim
"/
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'




"-------------Laravel-Specific------------"
nmap <Leader><Leader>c :CtrlP<cr>app/Http/Controllers/
nmap <Leader><Leader>m :CtrlP<cr>app/Models/




"-------------Mappings------------"

"Make it easy to edit Vimrc file.
nmap ,ev :tabedit ~/.vimrc<cr>
imap ,ev :tabedit ~/.vimrc<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Swetch tabs with familier `ctrl+tab` key.
map <c-Tab> gt

"Ctag shortcut.
nmap <Leader>f :tag<space>

"Use familiar copy/paste command for clipboard
imap <c-V> <esc>"+gP
nmap <c-V> <esc>"+gP

imap <c-C> <esc>"+y
nmap <c-C> <esc>"+y

"Use 'Ctrl+A' to select all
nmap <c-A> <esc>gg V G

"Go to tag declaration by pressing ',+Enter'.
nmap <Leader><cr> <c-W>}


"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

