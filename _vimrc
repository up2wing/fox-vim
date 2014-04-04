" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"=============================================
" Author: WangYi
" Version: 1
" Email: up2wing@gmail.com
" ReadMe: README.md
" Sections:

" }

" Platform {
        "------------------------------- {
        "          Platform
        "-------------------------------
        if(has("win32") || has("win95") || has("win64") || has("win16"))
            let g:iswindows=1
        else
            let g:iswindows=0
        endif
        autocmd BufEnter * lcd %:p:h

        function! SwitchToBuf(filename)
            "let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
            " find in current tab
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec bufwinnr . "wincmd w"
                return
            else
                " find in each tab
                tabfirst
                let tab = 1
                while tab <= tabpagenr("$")
                    let bufwinnr = bufwinnr(a:filename)
                    if bufwinnr != -1
                        exec "normal " . tab . "gt"
                        exec bufwinnr . "wincmd w"
                        return
                    endif
                    tabnext
                    let tab = tab + 1
                endwhile
                " not exist, new tab
                exec "tabnew " . a:filename
            endif
        endfunction
    " }
" }

" Common Setting {
    "用空格键来开关折叠 {
        "nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
        "两次o换行而不用进入编辑模式
        noremap go o<esc>
        noremap gO O<esc>
        "仿照emacs滚动
        nmap <C-n> <C-e>
        nmap <C-p> <C-y>
        " 定义快捷键到行首和行尾
        nmap lb 0
        nmap le $
        nmap lr ^
        " 设置快捷键将选中文本块复制至系统剪贴板
        vnoremap <Leader>y "+y
        " 设置快捷键将系统剪贴板内容粘贴至 vim
        nmap <Leader>p "+p
    " }

    " history存储长度。{
        set history=2000
    " }

    " 文件类型 {
        filetype on                "检测文件类型
        filetype indent on         "针对不同的文件类型采用不同的缩进格式
        filetype plugin on         "允许插件
        filetype plugin indent on  "启动自动补全
    " }

    " 折叠{
        set foldenable          " 开始折叠
        set foldmethod=syntax   " 设置折叠方式(indent\syntax\marker\expr)
        set foldcolumn=0        " 设置折叠区域的宽度
        setlocal foldlevel=1    " 设置折叠层数为
        set foldlevelstart=99   " 打开文件是默认不折叠代码
        "set foldclose=all      " 设置为自动关闭折叠
    " }

    " 其它 {
        syntax on          "打开高亮
        set hlsearch       "高亮显示结果
        set incsearch      "在输入要搜索的文字时，vim会实时匹配
        set ignorecase     " 搜索时忽略大小写
        set showmatch      " 显示括号配对情况
        set mat=2          " How many tenths of a second to blink when matching brackets
        set number         " 显示行号
        set title          " change the terminal's title
        set novisualbell   " don't beep
        set noerrorbells   " don't beep
        set vb t_vb=       "去掉错误声音

        let mapleader = ","     "Set mapleader

        set tabstop=4           " 设置Tab键的宽度        [等同的空格个数]
        set shiftwidth=4   "自动缩进的宽度
        set softtabstop=4       " 按退格键时可以一次删掉 4 个空格
        set smarttab            " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
        set expandtab      "用空格代替tab

        set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
        set smartindent          "Smart indent
        set autoindent           " always set autoindenting on
        " never add copyindent, case error   " copy the previous indentation on autoindenting

        set nobackup          "不生成~备份文件(gvim需要同时修改vimrc_example.vim)
        set nocompatible      "关闭vi兼容模式，避免引发问题
        set autoread          " 文件修改之后自动载入。
        set noswapfile
        set cursorline        " 突出显示当前行

        "create undo file
        set undolevels=1000         " How many undos
        set undoreload=10000        " number of lines to save for undo

        set wildignore=*.swp,*.bak,*.pyc,*.class

        set ruler                 "显示当前的行号列号：
        set showcmd               "在状态栏显示正在输入的命令
        set showmode              " Show current mode

        set scrolloff=7          "j/k 上下滚动,始终在中间

        "insert mode shortcut
        inoremap <C-f> <Right>
        inoremap <C-b> <Left>

        "set winwidth=79

        " 命令行（在状态行下）的高度，默认为1，这里是2
        set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
        " Always show the status line
        set laststatus=2

    " }

    " 字体及外观 {
        set guifont=Bitstream_Vera_Sans_Mono:h9.5:cANSI      "字体设置为Bitstream

        set guioptions-=m               "把gui的菜单栏去掉
        set guioptions-=T               "去掉工具栏
        autocmd GUIEnter * simalt ~x    "启动时最大化

        "下面的设置避免vim中文出现乱码
        set encoding=utf-8
        set fileencodings=utf-8,chinese,latin-1
        if has("win32")
        set fileencoding=chinese
        else
        set fileencoding=utf-8
        endif
        "解决菜单乱码
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        "解决consle输出乱码
        language messages zh_CN.utf-8
    " }

    "Fast edit vimrc {
        if g:iswindows==0
            "Fast reloading of the .vimrc
            map <silent> <leader>ss :source ~/.vimrc<cr>
            "Fast editing of .vimrc
            map <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
            "When .vimrc is edited, reload it
            autocmd! bufwritepost .vimrc source ~/.vimrc
        elseif g:iswindows==1
            " Set helplang
            set helplang=cn
            "Fast reloading of the _vimrc
            map <silent> <leader>ss :source ~/_vimrc<cr>
            "Fast editing of _vimrc
            map <silent> <leader>ee :call SwitchToBuf("~/_vimrc")<cr>
            "When _vimrc is edited, reload it
            autocmd! bufwritepost _vimrc source ~/_vimrc
        endif
    " }
" }

" Vundle {
    set nocompatible               " be iMproved
    filetype off                   " required!

    " 此处规定Vundle的路径
"    if(g:iswindows==0)
        "set rtp+=~/.vim/bundle/vundle/
"        call vundle#rc('$VIM/vimfiles/bundle/')
"    else
        set rtp+=$VIM/vimfiles/bundle/vundle/
        call vundle#rc('$VIM/vimfiles/bundle/')
"    endif

    " original repos on github
    " github上的用户写的插件，使用这种用户名+repo名称的方式
    Bundle 'gmarik/vundle'
    " vimscripts的repo使用下面的格式，直接是插件名称
    "Bundle 'taglist.vim'
" }

" 颜色主题 {
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'vim-scripts/Lucius'
    Bundle 'tomasr/molokai'
    colorscheme solarized     "设置颜色主题
    set background=dark
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"

    " c++ syntax highlight
"    Bundle 'octol/vim-cpp-enhanced-highlight'
    "Bundle 'vim-scripts/STL-Syntax'
"}

" 导航 {
    "目录导航
    Bundle 'scrooloose/nerdtree'
    map <leader>w :NERDTreeToggle<CR>
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    let g:netrw_home='~/bak'
    let NERDTreeWinPos=1
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
"}

" grep{
Bundle 'vim-scripts/grep.vim'
nnoremap <silent> <F3> :Grep<CR>
"}

" minibufferexpl {
"    Bundle 'fholgado/minibufexpl.vim'
    "let g:miniBufExplMapWindowNavVim = 1
    "let g:miniBufExplMapWindowNavArrows = 1
    "let g:miniBufExplMapCTabSwitchBufs = 1
    "let g:miniBufExplModSelTarget = 1
    ""解决FileExplorer窗口变小问题
    "let g:miniBufExplForceSyntaxEnable = 1
    "let g:miniBufExplorerMoreThanOne=2
"    let g:miniBufExplCycleArround=1
"}

" file search ctrlp {
Bundle 'kien/ctrlp.vim'
    let g:ctrlp_map = '<leader>p'
    let g:ctrlp_cmd = 'CtrlP'
    map <leader>f :CtrlPMRU<CR>
    "set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
        \ }
    "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    let g:ctrlp_working_path_mode='rw'  "设置工作目录为最近的包括.git, .svn目录的目录
    let g:ctrlp_match_window_bottom=1
    let g:ctrlp_max_height=15
    let g:ctrlp_match_window_reversed=0
    let g:ctrlp_mruf_max=500
    let g:ctrlp_follow_symlinks=1
    let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                                 \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
"}

" 显示增强 {
"状态栏增强展示
Bundle 'Lokaltog/vim-powerline'
"if want to use fancy,need to add font patch -> git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'

Bundle 'vim-scripts/Mark'
nmap <M-e> <Plug>MarkSet
nmap <esc>e <Plug>MarkSet

"括号显示增强
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0
map <F2> :RainbowParenthesesToggle<CR>
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

"代码排版缩进标识
Bundle 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '|'

"for show no user whitespaces
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>
" }

" 快速移动 {
"更高效的移动 ,, + w/fx
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/matchit.zip'
" }

" 自动补全 {
"迄今位置用到的最好的自动VIM自动补全插件, Windows下使用有问题
 Bundle 'Valloric/YouCompleteMe'
"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']

" YouCompleteMe 功能
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'
" 设置转到定义处的快捷键为ALT + G，这个功能非常赞
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>

"}

" 快速插入代码片段 {
"Bundle 'vim-scripts/UltiSnips'
"Bundle 'SirVer/ultisnips'
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
""定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories=["snippets", "bundle/UltiSnips/UltiSnips"]
"}

" 快速加入修改环绕字符 {
"Bundle 'tpope/vim-surround'
""for repeat -> enhance surround.vim, . to repeat command
"Bundle 'tpope/vim-repeat'
"}

"自动补全单引号，双引号等 {
Bundle 'Raimondi/delimitMate'
" for python docstring ",优化输入
au FileType python let b:delimitMate_nesting_quotes = ['"']
" }

"for code alignment {
"Bundle 'godlygeek/tabular'
"nmap <Leader>a= :Tabularize /=<CR>
"vmap <Leader>a= :Tabularize /=<CR>
"nmap <Leader>a: :Tabularize /:\zs<CR>
"vmap <Leader>a: :Tabularize /:\zs<CR>
" }

"for visual selection {
"Bundle 'terryma/vim-expand-region'
"map = <Plug>(expand_region_expand)
"map - <Plug>(expand_region_shrink)
" }

"for mutil cursor {
"Bundle 'terryma/vim-multiple-cursors'
"let g:multi_cursor_use_default_mapping=0
"" Default mapping
"let g:multi_cursor_next_key='<C-m>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'
" }

" 语法检查 {
" 编辑时自动语法检查标红, vim-flake8目前还不支持,所以多装一个
" 使用pyflakes,速度比pylint快
Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
highlight SyntasticErrorSign guifg=white guibg=black

" python fly check, 弥补syntastic只能打开和保存才检查语法的不足
Bundle 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0
" }

"QuickFix Toggle {
Bundle 'vim-scripts/QFixToggle'
nnoremap <silent> <leader>sf :QFix<CR>
nmap <F4> :cn<cr>
nmap <F3> :cp<cr>
"}"

" 具体语言语法高亮 {
" for python.vim syntax highlight
Bundle 'hdima/python-syntax'
let python_highlight_all = 1

" for golang
"Bundle 'jnwhiteh/vim-golang'

" for markdown
"Bundle 'plasticboy/vim-markdown'
"let g:vim_markdown_folding_disabled=1

" for javascript
"Bundle "pangloss/vim-javascript"
"let g:html_indent_inctags = "html,body,head,tbody"
"let g:html_indent_script1 = "inc"
"let g:html_indent_style1 = "inc"

"for jquery
" Bundle 'nono/jquery.vim'

"for jinja2 highlight
" Bundle 'Glench/Vim-Jinja2-Syntax'

" task list
"Bundle 'vim-scripts/TaskList.vim'
"map <leader>td <Plug>TaskList

"edit history, 可以查看回到某个历史状态
"Bundle 'sjl/gundo.vim'
"nnoremap <leader>h :GundoToggle<CR>
" }

" session manager {
Bundle 'vim-scripts/sessionman.vim'
" autocmd VimEnter * call EnterSessionList()
" autocmd VimLeave * call SaveSession()
function! EnterSessionList()
    silent! execute "SessionList"
endfunction
function! SaveSession()
    silent! execute "SessionSave"
endfunction

map <silent> <F7> :SessionList<cr>
" }

" nerd commenter {
Bundle 'scrooloose/nerdcommenter'
let NERDShutUp=1
" }

" gtags {
Bundle 'vim-scripts/gtags.vim'
" }

" GNU Global {
"----查找函数、宏、枚举等定义的位置: alt+g
nmap <M-g> :Gtags -a <C-R>=expand("<cword>")<CR><CR>
nmap <esc>g :Gtags -a <C-R>=expand("<cword>")<CR><CR>
"----查找符号表：alt+d
nmap <M-d> :Gtags -a 
nmap <esc>d :Gtags -a 
"-----查找grep：alt+w
nmap <M-w> :Gtags -sa <C-R>=expand("<cword>")<CR><CR>
nmap <esc>w :Gtags -sa <C-R>=expand("<cword>")<CR><CR>
"nmap <M-w> :global -ga 
"nmap <esc>w :global -ga 
"----查找调用本函数的函数:  alt+s
nmap <M-s> :Gtags -ra <C-R>=expand("<cword>")<CR><CR>
nmap <esc>s :Gtags -ra <C-R>=expand("<cword>")<CR><CR>
"查找C语言符号，即查找函数名、宏、枚举值等出现的地方
nmap <M-f> :Gtags -ga <C-R>=expand("<cword>")<CR><CR>
nmap <esc>f :Gtags -ga <C-R>=expand("<cword>")<CR><CR>

"生成cscope数据库、ctags
map <C-F12> :call Do_GenCsTag()<CR>
map <F12> :call LoadCscope()<CR>
function! Do_GenCsTag()
    let dir = getcwd()
    if(executable('gtags'))
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > gtags.files"
        else
            silent! execute "!gentags.bat"
        endif
        silent! execute "!gtags"
    endif
endfunction

function! LoadCscope()
    silent! execute "!global -u"
endfunction

" }

" 标签导航 {
Bundle 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_left = 1
let g:tagbar_sort = 0
" }

" Alternate 头文件切换 {
Bundle 'vim-scripts/a.vim'
" }

" OmniCppComplete {
"Bundle 'vim-scripts/OmniCppComplete'
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
"let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
"let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
"let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" 自动关闭补全窗口
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest
" }

" lookupfile setting {
"Bundle 'vim-scripts/genutils'
"Bundle 'vim-scripts/lookupfile'
"let g:LookupFile_MinPatLength = 2
"let g:LookupFile_PreserveLastPattern = 0
"let g:LookupFile_PreservePatternHistory = 0
"let g:LookupFile_AlwaysAcceptFirst = 1
"let g:LookupFile_AllowNewFiles = 0
"let g:LookupFile_UsingSpecializedTags = 1
"let g:LookupFile_Bufs_LikeBufCmd = 0
"let g:LookupFile_ignorecase = 1
"let g:LookupFile_smartcase = 1
"if filereadable("./filenametag")
    "let g:LookupFile_TagExpr = '"./filenametags"'
"endif

"" lookup file with ignore case
"function! LookupFile_IgnoreCaseFunc(pattern)
    "let _tags = &tags
    "try
        "let &tags = eval(g:LookupFile_TagExpr)
        "let newpattern = '\c' . a:pattern
        "let tags = taglist(newpattern)
    "catch
        "echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        "return ""
    "finally
        "let &tags = _tags
    "endtry
    "" Show the matches for what is typed so far.
    "let files = map(tags, 'v:val["filename"]')
    "return files
"endfunction
"let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

""映射LookupFile为,lk-----搜索文件
"nmap <silent> <leader>lk :LUTags<cr>
""映射LUBufs为,ll------搜索Buffer
"nmap <silent> <leader>ll :LUBufs<cr>
""映射LUWalk为,lw-----搜索目录
"nmap <silent> <leader>lw :LUWalk<cr>
" }

" netrw setting {
"Bundle 'vim-scripts/netrw.vim'
"let g:netrw_winsize = 30
"" ,fe打开文件浏览器
"nmap <silent> <leader>fe :Sexplore!<cr>
" }

" BufExplorer {
"Bundle 'corntrace/bufexplorer'
"let g:bufExplorerDefaultHelp=0       " Do not show default help.
"let g:bufExplorerShowRelativePath=1  " Show relative paths.
"let g:bufExplorerSortBy='mru'        " Sort by most recently used.
"let g:bufExplorerSplitRight=0        " Split left.
"let g:bufExplorerSplitVertical=1     " Split vertically.
"let g:bufExplorerSplitVertSize = 30  " Split width
"let g:bufExplorerUseCurrentWindow=1  " Open in new window.
"autocmd BufWinEnter \[Buf\ List\] setl nonumber
" }

filetype plugin indent on     " vbundle required!

" Default settings {
set nocompatible
" For windows version
if g:iswindows==1
    source $VIMRUNTIME/vimrc_example.vim
    "source $VIMRUNTIME/mswin.vim
    behave mswin
endif
" }

