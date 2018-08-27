" auto install plug.vim plugin
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'altercation/vim-colors-solarized'
"molokai color scheme
Plug 'tomasr/molokai'
"show indent line 
Plug 'Yggdroot/indentLine'
"Plug 'mhinz/vim-signify'
"lint tool  gcc and cppcheck tool are needed
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"airline tool
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"format tool astyle tool is needed
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdcommenter'
" git wrapper git is needed
Plug 'tpope/vim-fugitive'
" generate tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'derekwyatt/vim-fswitch'
call plug#end()
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" set leading key ;
let mapleader=";"



"enable file type detection
filetype on
"loading plugin according to file type
filetype plugin on
"set auto complete for vim command
set wildmenu
"disable compatibility
set nocompatible
"ignore case when searching
set ignorecase
"if has upper case do not ignore case
set smartcase
"enable realtime search
set incsearch
"highlight search result
set hlsearch


"highlight syntax
syntax enable
"allow syntax on for specific
syntax on
"display status line
set laststatus=2
" no wrap 
set nowrap
"highlight cursor line/column
set cursorline
"set cursorcolumn


"auto indent on
filetype indent on
"extend tab to blankspace
set expandtab
"set blancspace num per tab
set tabstop=4
"set format tab blankspace num
set shiftwidth=4
"set continous blankspace to tab
set softtabstop=4
"Yggdroot/indentLine
"let g:indentLine_setColors = 0
let g:indentLine_color_term = 2
let g:indentLine_char = '¦'
map <C-i> :IndentLinesToggle<CR> 

"set fold type
"set foldmethod=indent
set foldmethod=syntax
"disable fold on start
set nofoldenable



"nerdtee setting
";+f2 show file list windows 
nmap <C-e> :NERDTreeToggle<CR>
"file windows width
let NERDTreeWinSize=32
"file list windows postion
let NERDTreeWinPos="right"
"show hinden files
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

"vim-colors-solarized molokai
syntax on
set background=dark
"colorscheme solarized
colorscheme molokai

"vim-cpp-enhanced-highlight
"


"w0rp/ale  lint

let g:ale_linters_explicit = 1
let g:ale_linters= { 'cpp':['gcc','cppcheck'],'c':['gcc','cppcheck'],}
"let g:ale_linter_aliasesj = {'cxx':'cpp'}
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = '--enable=all'
let g:ale_cpp_cppcheck_options = '--enable=all'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0`
let g:ale_lint_delay = 500

let g:ale_set_highlights = 1
let g:ale_sign_column_always =1
let g:ale_sign_error = "E"
let g:ale_sign_warning = "W"
let g:ale_sign_info = 'I'
let g:ale_echo_delay = 20
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'
let g:airline#extensions#ale#enabled = 1

nmap <Leader>s :ALEToggle<CR>
nmap <Leader>d :ALEDetail<CR>
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)


"auto format
let g:formatdef_my_cpp = '"astyle --style=google"'
let g:formatters_cpp = ['my_cpp']
noremap <F3> :Autoformat<CR>

"comment
let NERDSpaceDelims=1
let NERDCompactSexyComs=1
let g:NERDDefaultAlign = 'left'

"gtags
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_auto_add_gtags_cscope = 0

"fswitch
nmap <silent> <Leader>sw :FSHere<cr>
