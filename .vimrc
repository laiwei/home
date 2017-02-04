" options {{{
" tab替换为4空格 %retab! 
set ch=2
set ts=4
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set guifont=Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
set nocompatible
set nolinebreak nowrap
set autoindent smartindent
set autoread
set backspace=indent,eol,start
set completefunc=
"set cursorcolumn cursorline

" 中文支持
set fencs=utf-8,chinese,latin1 fenc=utf-8 enc=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8
set scrolloff=3
set fenc=utf-8
set formatoptions=mnoqt
" gVim will load `$VIM/vimrc` before loading `~/.vimrc`,
" add `finish` at the beginning of `$VIM/vimrc` to hide `Menu`,
" because `$VIM/vimrc` calls `syntax on` which will build menu!
set guioptions+=aM guioptions-=T
set guitablabel=(%N)\ %t\ %M
set hidden
set history=50
set hlsearch incsearch
set ignorecase smartcase
set isfname-== isfname-=,
"set listchars=precedes:«,extends:»,tab:>-,trail:-
set listchars=trail:«
"set list
set modeline
set mouse=v
set number numberwidth=4 showbreak=\ \ ->
set number numberwidth=4
set nonumber
set laststatus=2

set path=.,/usr/local/include/*,/usr/include/**1
set ruler
set showcmd
set showmatch matchpairs+=<:> matchtime=2
set sidescroll=1 sidescrolloff=1
set spelllang=en
set splitright splitbelow
set tabpagemax=50
set tags=./tags;/,~/.vim/tags
set thesaurus=~/.vim/tsr.txt
set timeoutlen=500 ttimeoutlen=0
set titlestring=%F\ %M
set virtualedit=block
set wrapscan
set wildignore=*.swp,*.bak,*.pyc,*~
"set wildignorecase
set wildmenu
"代码折叠
"set foldmethod=indent
"filetype off
set t_Co=256
"打开高亮
syntax enable
"使用color solarized
colorscheme solarized
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set background=dark
set modelines=0
set autoindent
set hidden
set ttyfast
set ttymouse=xterm
set scroll=11
"显示行号
set number
"无限undo
" Enable modelines only on secure vim versions
if (v:version >= 703)
	"    set undofile
else
endif
"自动换行
set wrap
"禁止自动换行
"set nowrap
"将-连接符也设置为单词
set isk+=-
"设置大小写敏感
set ignorecase
set smartcase
"set gdefault
set incsearch
set hlsearch
"行号自动跳转
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif
endif

filetype plugin indent on
hi SpecialKey ctermfg=238

"}}}

set clipboard=unnamed
let g:fakeclip_terminal_multiplexer_type = 'tmux'
vmap <C-t>y                 <Plug>(fakeclip-screen-y)
nmap <C-t>P                 <Plug>(fakeclip-screen-P)
nmap <C-t>p                 <Plug>(fakeclip-screen-p)

" plugins {{{
"===================================================
" vim 插件管理 
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'Valloric/YouCompleteMe'
Bundle 'gmarik/vundle'
Bundle 'AutoClose'
Bundle 'taglist.vim'
Bundle 'EasyMotion'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'snipMate'
Bundle 'winmanager'
Bundle 'moll/vim-bbye'
Bundle 'wesleyche/SrcExpl'
Bundle 'https://github.com/yubo/vim-airline.git'
Bundle 'https://github.com/Stormherz/tablify.git'
Bundle 'https://github.com/vim-scripts/ZoomWin.git'
Bundle 'https://github.com/vim-scripts/gtags.vim.git'
Bundle 'https://github.com/fatih/vim-go.git'
Bundle 'https://github.com/kana/vim-fakeclip.git'
Bundle 'majutsushi/tagbar'

let g:fencview_autodetect=1

let g:neocomplcache_enable_at_startup = 1
"NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore = ['\.pyc', '\.mod\.c', '\.o', '\.ko', '\.a', '\.so', 'CMakeFiles', '\.cmake', 'CMakeCache.txt']
"}}}

" mappings {{{
let mapleader = ','

" tab
map <C-M> :tabnew<CR>
map <C-N> :tabnext<CR>
map <C-P> :tabpre<CR>
nnoremap <leader>e :tabedit <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <leader>, :tabnew <C-R>=expand('%:p:h') . '/'<CR>
inoremap jj <Esc>

" normal mode
nnoremap Y                     y$
nnoremap #                     :let @/=printf('\<%s\>\C', expand('<cword>'))<CR>
nnoremap @                     :execute "vimgrep /" . expand("<cword>") . "/ **/*.go"<CR>
" nnoremap <C-L>                 :bn<CR>
" nnoremap <C-H>                 :bp<CR>
nnoremap <C-L>                 :tabnext<CR>
nnoremap <C-H>                 :tabpre<CR>
" nnoremap <C-N>                 :cn<CR>
" nnoremap <C-P>                 :cp<CR>
nnoremap <C-N>                 :bn<CR>
nnoremap <C-P>                 :bp<CR>
nnoremap <C-J>                 7<C-e>
nnoremap <C-K>                 7<C-y>
nnoremap <C-]>                 :Gtags<CR><CR>
nnoremap <C-T>                 :Gtags -r<CR><CR>
nnoremap <C-F>                 :Gtags -gi<CR>
"nnoremap <leader>h             gT
"nnoremap <leader>l             gt
nnoremap <leader>c             :cclose<CR>
nnoremap <leader>o             :copen<CR>
nnoremap <leader>r             :!gtags<CR>
nnoremap <leader>b             : %!xxd<CR>
nnoremap <leader>bb            : %!xxd -r<CR>
nnoremap <leader>y             : YRShow<CR>
nnoremap <leader>h             <C-W>h
nnoremap <leader>j             <C-W>j
nnoremap <leader>k             <C-W>k
nnoremap <leader>l             <C-W>l
nnoremap <leader>s             : so $MYVIMRC<CR>
nnoremap <leader>v             : tabe $MYVIMRC<CR>
"nnoremap <leader>t             : Tlist<CR>
nnoremap <leader>t             : TagbarToggle<CR>
nnoremap <leader>q             : Bdelete<CR>
nnoremap <leader>g=             gg=G
nnoremap <leader>f             : !firefox %<CR>
nnoremap <leader>z             : setl fdm=indent fdc=1 fdn=1<CR>
nnoremap <leader>;             : noh<CR>
nnoremap <leader>p             : set paste<CR>
nnoremap <leader>pp            : set nopaste<CR>
nnoremap <silent><leader><space>       : NERDTreeToggle<CR>
nnoremap <silent><leader>n     : set number<CR>
nnoremap <silent><leader>N     : set nonumber<CR>
nnoremap <leader>nn            : set nonumber<CR>
" diff "
nnoremap <leader>u             :diffupdate<CR>
nnoremap <silent> <leader>wm   :WMToggle<cr>

" insert mode
inoremap <leader>co            Yu Bo<yubo@yubo.org> <C-r>=strftime('%Y-%m-%d')<CR>
inoremap <expr> <leader>fn     expand('%:p')
inoremap <leader>dt            <C-r>=strftime('%Y-%m-%d')<CR>
inoremap <leader>tm            <C-r>=strftime('%H:%M:%S')<CR>
"inoremap <C-@>                 <C-x><C-u>
"inoremap <C-space>             <C-x><C-u>
inoremap <C-a>                 <home>
inoremap <C-e>                 <end>
inoremap <C-b>                 <left>
inoremap <C-f>                 <right>
"inoremap <A-b>                 <S-left>
"inoremap <A-f>                 <S-right>
inoremap <C-d>                 <del>
inoremap <A-d>                 <C-o>dw
"文件类型切换
inoremap <C-j>                 <down>
inoremap <C-k>                 <up>

" command mode
cnoremap <C-a>                 <home>
cnoremap <C-e>                 <end>
cnoremap <C-b>                 <left>
cnoremap <C-f>                 <right>
"cnoremap <leader>b             <S-left>
"cnoremap <leader>f             <S-right>
"cnoremap <leader>d             <S-right><C-w>
cnoremap <C-d>                 <delete>
cnoremap <C-p>                 <up>
cnoremap <C-n>                 <down>

" visual mode
vnoremap <C-m>                 !markdown<CR>
vnoremap <C-p>                 !pandoc<CR>
vnoremap <C-f>                 !figlet<CR>
" others
cnoreabb <expr> W              getcmdtype()==':'&&getcmdline()=~#'^W'?'w':'W'
"esc的映射
"imap jj <esc>
"使用tab键来代替%进行匹配跳转
nnoremap <tab>                 %
vnoremap <tab>                 %


"for golang"
syntax on
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:godef_split=3
au BufRead,BufNewFile *.go set filetype=go
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>rr <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>tt <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
"au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
"au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>r <Plug>(go-rename)
au FileType go nmap <C-g>	gd
au FileType go nmap <C-s> <Plug>(go-def-vertical)


""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0

"NERD Tree
let NERDChristmasTree=1
let NERDTreeWinPos='left'

"Taglist"
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exit_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_SingleClick = 1 "to a tag on single mouse cliek"
let Tlist_Exit_OnlyWindow = 1 
let tlist_c_settings = 'c;f:My Functions'
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "order"


" YCM{{{
" youcompleteme  默认tab  s-tab 和自动补全冲突
" let g:ycm_key_list_select_completion=['<c-n>']
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_previous_completion = ['<Up>']
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_confirm_extra_conf = 0      "关闭加载.ycm_extra_conf.py提示
let g:ycm_complete_in_comments = 1    "在注释输入中也能补全
let g:ycm_complete_in_strings = 1     "在字符串输入中也能补全
let g:ycm_seed_identifiers_with_syntax = 1                  " 语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
let g:ycm_min_num_of_chars_for_completion = 1               " 从第2个键入字符就开始罗列匹配项
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_warning_symbol = '>>'
let g:ycm_error_symbol = '->'
"let g:ycm_add_preview_to_completeopt = 1
if !empty(glob("~/.vim/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
endif
nmap <leader>gd :YcmDiags<CR>
nnoremap <leader>gh :YcmCompleter GoToDeclaration<CR>           " 跳转到申明处
nnoremap <leader>gc :YcmCompleter GoToDefinition<CR>            " 跳转到定义处
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 直接触发自动补全
let g:ycm_key_invoke_completion = '<C-Space>'
" 黑名单,不启用
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'gitcommit' : 1,
      \}
" }}}

" omnicppcomplete{{{
""set omnifunc=syntaxcomplete#Complete
"""Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
""" Disable AutoComplPop.
""let g:acp_enableAtStartup = 0
""" Use neocomplcache.
""let g:neocomplcache_enable_at_startup = 1
""" Use smartcase.
""let g:neocomplcache_enable_smart_case = 1
""" Set minimum syntax keyword length.
""let g:neocomplcache_min_syntax_length = 3
""let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
""
""" Enable heavy features.
""" Use camel case completion.
"""let g:neocomplcache_enable_camel_case_completion = 1
""" Use underbar completion.
"""let g:neocomplcache_enable_underbar_completion = 1
""
""" <TAB>: completion.
""inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
""" <C-h>, <BS>: close popup and delete backword char.
""inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
""inoremap <expr><C-y>  neocomplcache#close_popup()
""inoremap <expr><C-e>  neocomplcache#cancel_popup()
""" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
""
""" AutoComplPop like behavior.
"""let g:neocomplcache_enable_auto_select = 1
""
""" Enable omni completion.
""autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
""autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
""autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
""autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
""autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
""
""" Enable heavy omni completion.
""if !exists('g:neocomplcache_force_omni_patterns')
""	let g:neocomplcache_force_omni_patterns = {}
""endif
""let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
""
""" For perlomni.vim setting.
""" https://github.com/c9s/perlomni.vim
""let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""set completeopt=longest,menu
" }}}

"cscope"
set cscopequickfix=s-,c-,d-,i-,t-,e-

"gtags"
let Gtags_OpenQuickfixWindow = 0

" srcexpl {{{
" // The switch of the Source Explorer 
nnoremap <leader>se :SrcExplToggle<CR> 

" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_" 
    \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
""let g:SrcExpl_updateTagsCmd = "ctags -L cscope.files" 

" // Set "<F12>" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F12>" 

" // Set "<F3>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<F3>" 

" // Set "<F4>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<F4>" 
" }}}

" vim-airline {{{
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" or copy paste the following into your vimrc for shortform text
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'x', 'y', 'z' ]
  \ ]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{strlen(&ft) ? &ft : "Noft"}%{&bomb ? " BOM" : ""}'
let g:airline_section_y = '%{&fileformat} %{(&fenc == "" ? &enc : &fenc)}'
let g:airline_section_z = '%2l:%-1v/%L'
" }}}

highlight TagbarSignature guifg=#00afaf ctermfg=green
