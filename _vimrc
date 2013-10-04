"=============================================
" Author: WangYi
" Version: 1
" Email: up2wing@gmail.com
" ReadMe: README.md
" Sections:

"-------------------------------
"     Common Setting
"-------------------------------
"用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>   
"两次o换行而不用进入编辑模式
noremap go o<esc>
noremap gO O<esc>

" history存储长度。
set history=2000

filetype on                "检测文件类型
filetype indent on         "针对不同的文件类型采用不同的缩进格式
filetype plugin on         "允许插件
filetype plugin indent on  "启动自动补全

set shiftwidth=4   "自动缩进的宽度
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
set shiftwidth=4        " number of spaces to use for autoindenting
set softtabstop=4       " 按退格键时可以一次删掉 4 个空格
set smarttab            " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab      "用空格代替tab

set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

set foldenable          " 开始折叠
set foldmethod=indent   " 设置折叠方式(syntax\marker\expr)
set foldcolumn=0        " 设置折叠区域的宽度
setlocal foldlevel=1    " 设置折叠层数为
set foldlevelstart=99   " 打开文件是默认不折叠代码
"set foldclose=all      " 设置为自动关闭折叠 

set smartindent          "Smart indent
set autoindent           " always set autoindenting on
" never add copyindent, case error   " copy the previous indentation on autoindenting

set nobackup          "不生成~备份文件(gvim需要同时修改vimrc_example.vim)
set nocompatible      "关闭vi兼容模式，避免引发问题
set autoread          " 文件修改之后自动载入。
set nobackup          " 取消备份。 视情况自己改
set noswapfile
set cursorline              " 突出显示当前行

"create undo file
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set wildignore=*.swp,*.bak,*.pyc,*.class

set ruler                 "显示当前的行号列号：
set showcmd               "在状态栏显示正在输入的命令
set showmode              " Show current mode

set scrolloff=7          "j/k 上下滚动,始终在中间

"set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
set laststatus=2


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


"-------------------------------
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

"Fast edit vimrc
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

"--------------------------------
"       Vundle 
"--------------------------------
set nocompatible               " be iMproved
filetype off                   " required!
 
" 此处规定Vundle的路径
" if Linux
"   set rtp+=~/.vim/bundle/vundle/
"   call vundle#rc('$VIM/vimfiles/bundle/')
" if Windows
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')

" original repos on github
" github上的用户写的插件，使用这种用户名+repo名称的方式
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/taglist.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'bronson/vim-trailing-whitespace'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/matchit.zip'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'Raimondi/delimitMate'
Bundle 'godlygeek/tabular'
Bundle 'terryma/vim-expand-region'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/syntastic'
Bundle 'kevinw/pyflakes-vim'
Bundle 'hdima/python-syntax'
Bundle 'jnwhiteh/vim-golang'
Bundle 'plasticboy/vim-markdown'
Bundle "pangloss/vim-javascript"
Bundle 'nono/jquery.vim'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'thiderman/nginx-vim-syntax'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'sjl/gundo.vim'
" vimscripts的repo使用下面的格式，直接是插件名称
"Bundle 'taglist.vim'


"===============颜色主题===================="
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/Lucius'
Bundle 'tomasr/molokai'
colorscheme solarized     "设置颜色主题
set background=dark
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"################### 导航 ###################"
"目录导航
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end


"--------------------------------
"       session manager
"--------------------------------
autocmd VimEnter * call EnterSessionList()
autocmd VimLeave * call SaveSession()
function EnterSessionList()
    silent! execute "SessionList"
    silent! execute "cs add e:\\wing\\work\\spice\\cscope.out"
endfunction
function SaveSession()
    silent! execute "SessionSave"
endfunction

"--------------------------------
"       nerd commenter
"--------------------------------
let NERDShutUp=1

"-------------------------------
"       tags
"-------------------------------
"首先在当前目录中寻找tags，找不到向父目录中找，一直递归
set tags=tags;
"set autochdir		"改变vim的当前目录。因为cscope要绝对路径，一般关闭

"-------------------------------
"      cscope 
"-------------------------------
"生成cscope数据库、ctags
map <C-F12> :call Do_GenCsTag()<CR>
function Do_GenCsTag()
"    if(g:iswindows==0)
"        silent! execute "!bash gentags.sh"
"    else
"        silent! execute "!gentags.bat"
"    endif
"    if filereadable("cscope.out")
"        execute "cs add cscope.out"
"    endif
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif

    "build filenametags for lookupfile
    silent! execute "!echo -e '!_TAG_FILE_SORTED\t2\t/2=foldcase/' > filenametags"
    if(g:iswindows==1)
        silent! execute "!gfind . -not -regex '.*\.\(png\|gif\|svn\|git\)' -type f -printf \"%f\t%p\t1\n\" | gsort -f>> filenametags"
    else
        silent! execute "!find . -not -regex '.*\.\(png\|gif\|svn\|git\)' -type f -printf \"%f\t%p\t1\n\" | sort -f>> filenametags"
    endif

    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

"set cscope output to quickfix windows
if has("cscope")
    "set cscopequickfix=s-,c-,d-,i-,t-,e-
    set csto=1
    set cst
    set csverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

"----查找函数、宏、枚举等定义的位置: alt+g
nmap <M-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <esc>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"----查找调用本函数的函数:  alt+s
nmap <M-s> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <esc>s :cs find c <C-R>=expand("<cword>")<CR><CR>
"----查找指定的字符串:  alt+f
nmap <M-f> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <esc>f :cs find t <C-R>=expand("<cword>")<CR><CR>
"查找C语言符号，即查找函数名、宏、枚举值等出现的地方
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"查找egrep模式，相当于egrep功能，但查找速度快多了
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"查找并打开文件，类似vim的find功能
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"查找包含本文件的文件
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"查找本函数调用的函数
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"-------------------------------
"       tag list
"-------------------------------
if g:iswindows==1                "设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = 'ctags'
elseif g:iswindows==0              "设定linux系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗
let Tlist_File_Fold_Auto_Close=1        "让当前不被编辑的文件的方法列表自动折叠起来

"映射F8为Taglist
map <silent> <F8> :TlistToggle<cr>      

"-------------------------------
"    OmniCppComplete
"-------------------------------
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest


"-----------------------------
" lookupfile setting
"-----------------------------
let g:LookupFile_MinPatLength = 2 
let g:LookupFile_PreserveLastPattern = 0 
let g:LookupFile_PreservePatternHistory = 0 
let g:LookupFile_AlwaysAcceptFirst = 1 
let g:LookupFile_AllowNewFiles = 0 
let g:LookupFile_UsingSpecializedTags = 1 
let g:LookupFile_Bufs_LikeBufCmd = 0 
let g:LookupFile_ignorecase = 1 
let g:LookupFile_smartcase = 1 
if filereadable("./filenametag")
    let g:LookupFile_TagExpr = '"./filenametags"'
endif
 
" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry
    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

"映射LookupFile为,lk-----搜索文件
nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll------搜索Buffer
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw-----搜索目录
nmap <silent> <leader>lw :LUWalk<cr>


"-------------------------------
"      netrw setting 
"-------------------------------
let g:netrw_winsize = 30
" ,fe打开文件浏览器
nmap <silent> <leader>fe :Sexplore!<cr> 

"-------------------------------
"       BufExplorer 
"-------------------------------
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

filetype plugin indent on     " vbundle required!
"============Default settings=================
set nocompatible
" For windows version
if g:iswindows==1 
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif 

