"===================================
""    Vundle基本配置start
"===================================
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
call vundle#end()            " required
filetype plugin indent on    " required
"===================================
""    Vundle基本配置end
"===================================


"===================================
""    Vim基本配置start
"===================================
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$" 
        set encoding=utf-8 
endif
" 不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
set nocompatible
" 检测文件的类型
filetype on
filetype plugin on
filetype plugin indent on
set completeopt=longest,menu
syntax on
" 去掉烦人的交换文件
set noswf
" 自动缩进 
set autoindent
"智能对齐方式 
set smartindent
" 一个tab是4个字符 
set tabstop=4
" 按一次tab前进4个字符 
set softtabstop=4
" 设置自动缩进 
set ai!
" 缩进的字符个数 
set cindent shiftwidth=4 
set autoindent shiftwidth=4
" 显示行号 
set number
" 打开光标的行列位置显示功能 
set ruler
" 行高亮 
set cursorline
" 高亮搜索的关键字 
set hlsearch
" 搜索忽略大小写 
set ignorecase
" 设置命令历史行数
set history=100
" 不要闪烁 
set novisualbell
" 显示TAB健 
"set list 
"set listchars=tab:>-,trail:-
" 去掉有关vi一致性模式，避免以前版本的一些bug和局限 
set nocp  
" 增强模式中的命令行自动完成操作 
set wildmenu

"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn

au FileType php call AddPHPFuncList()
function AddPHPFuncList()
	set dictionary-=~/.vim/php_funclist.txt dictionary+=~/.vim/php_funclist.txt
	set complete-=k complete+=k
endfunction


"===================================
""    Vim基本配置end
"===================================


"===================================
""    airline setting start
"===================================
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" color
set laststatus=2
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '▶'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#buffline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
" 启用/禁用标签模式显示标签数
let g:airline#extensions#tabline#show_tab_nr = 0
" rename label for buffers (default: 'buffers')
let g:airline#extensions#tabline#buffers_label = 'buffers'

" 快捷键切换
let mapleader=','
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" other setting
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let airline#extensions#c_like_langs = ['c', 'cpp', 'cuda', 'javascript', 'ld', 'php']
"===================================
""    airline setting end
"===================================


"===================================
""    syntastic setting start
"===================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"===================================
""    syntastic setting end
"===================================


"===================================
""    nerdtree setting start
"===================================
" open a NERDTree automatically
autocmd vimenter * NERDTree
" 设置光标默认不在NERDTree 的窗口中
wincmd w
autocmd VimEnter * wincmd w

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" map a specific key or shortcut to open NERDTree(Ctrl+a)
map <C-a> :NERDTreeToggle<CR>
" change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"===================================
""    nerdtree setting end
"===================================


"===================================
""   tagbar setting start
"===================================
" map a specific key or shortcut to open Tagbar(<F8>)
nmap <F8> :TagbarToggle<CR>
" Tagbar window will be opened on right-hand,we can set this option to open it on left instead
"let g:tagbar_left = 1
" Tagbar window will automatically close when you jump to a tag
"let g:tagbar_autoclose = 1
" If you set this option the cursor will move to the Tagbar window when it is opened
"let g:tagbar_autofocus = 1
" If you set this option the cursor will move to the Tagbar window when it is opened
let g:tagbar_autofocus = 0
"===================================
""   tagbar setting end
"===================================


"===================================
""   AutoComplPop setting start
"===================================
let g:acp_enableAtStartup = 1
"===================================
""   AutoComplPop setting end
"===================================
"vim-easy-align{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"}
