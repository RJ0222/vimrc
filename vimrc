set nocompatible              " required
filetype on                   " required
set t_Co=256                  " color 256

set wildmenu
set foldenable
set cin
set nu

"""""""""Auto Compelete Command"""""""""

" autocmd Filetype c      set omnifunc=ccomplete#Complete
autocmd Filetype html   set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype xml    set omnifunc=xmlcomplete#CompleteTags


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright
set listchars=tab:>>,trail:.,extends:>
set expandtab

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" V tab
xnoremap < <gv
xnoremap > >gv

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'

au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix

Plugin 'vim-scripts/indentpython.vim'
set encoding=utf-8
set backspace=indent,eol,start

Bundle 'Valloric/YouCompleteMe'

" Global config file for YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

    " python3 path
    let g:ycm_python_binary_path='/usr/local/bin/python3'
    " shut down promote of loading ycm_confirm_extra_conf
    let g:ycm_confirm_extra_conf=0
    " autocomplete based by tag
    let g:ycm_collect_identifiers_from_tags_files=1
    " autocomplete for commanter and status
    let g:ycm_collect_identifiers_from_comments_and_strings = 0
    " start complete on second character
    let g:ycm_min_num_of_chars_for_completion=2
    " syntax support
    let g:ycm_seed_identifiers_with_syntax=1
    " autocomplete when ccomment
    let g:ycm_complete_in_comments = 1
    " autocomplete in string
    let g:ycm_complete_in_strings = 1
    " abandon ycm
    let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
" shutdown complete window automatically
set completeopt-=preview

" --command line setting--
set showcmd
set showmode

" --findsetting--
set incsearch
set hlsearch

" syntatic check for python2 and python3
Plugin 'scrooloose/syntastic'

Plugin 'nvie/vim-flake8'
autocmd FileType python map   :call Flake8()
let g:flake8_ignore="E501,W293,E306"
let g:flake8_max_line_length = 99
let g:syntastic_python_flake8_exec = '/usr/bin/python3'
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']
let g:syntastic_check_on_open = 1
let g:syntastic_python_pylint_post_args="--max-line-length=120"
let python_highlight_all=1
syntax on

" colorschem plugin
Plugin 'jnurmine/Zenburn'
colorscheme molokai
let g:rehash256 = 1
set termguicolors
let g:sublimemonokai_term_italic = 1
set background=dark

" cursor auto appeared on last time where file be opened
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set softtabstop=4
set tabstop=4
set ts=4
set shiftwidth=4
set expandtab
set autoindent

" show cursor line-number
set ruler

" cmdline height
set cmdheight=1

" highlight match () {} <> etc...
set showmatch

" ignorecase while seraching
set ignorecase

" nerdtree plugin
Bundle 'scrooloose/nerdtree'
" config for nerdtree <F8>
:map <F8> <ESC>:NERDTree %<CR>
nnoremap <F10> :exe ‘NERDTreeToggle’<CR>
let NERDTreeDirArrows=0
let NERDTreeMapOpenSplit="s"
let NERDTreeMapOpenVSplit="v"

" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif

" always split windows vertically
set splitright

let &winheight = &lines * 7 / 10
" autocmd WinEnter * execute winnr() * 2 . 'wincmd _'

" --ctags setting--
" Press F5 to rebuild taglist and update taglist
map <F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags        "
set tags+=./tags     " add current directory's generated tags file, search taglist in current dir
set tags+=/usr/src/linux-headers-4.2.0-27/tags " add new tags file

" taglis plugin
Bundle 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1
let Tlist_WinWidt=28
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
" let Tlist_Use_Left_Window=1

" golang plugin
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

augroup go
  autocmd!
  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" Plugin for js
Plugin 'marijnh/tern_for_vim'

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" yaml file
Plugin 'chase/vim-ansible-yaml'
let g:ansible_options = {'ignore_blank_lines': 0}

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

filetype plugin indent on

" autocomplete  {} [] () etc...
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 return a:char
 elseif line[col - 1] == a:char
 return "\<Right>"
 else
 return a:char.a:char."\<Esc>i"
 endif
endf

" for auto switch between vim tab
map <C-Right> :tabn<CR>
map <C-Left>  :tabp<CR>

" remove whitespace which at tail
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

" commenter
Bundle 'scrooloose/nerdcommenter'
" one space before when comment
let g:NERDSpaceDelims=1
