"=============================================
" Author: WangYi
" Version: 1
" Email: up2wing@gmail.com
" ReadMe: README.md
" Sections:

"-------------------------------
"     Common Setting
"-------------------------------
"�ÿո���������۵�
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>   
"����o���ж����ý���༭ģʽ
noremap go o<esc>
noremap gO O<esc>

" history�洢���ȡ�
set history=2000

filetype on                "����ļ�����
filetype indent on         "��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype plugin on         "������
filetype plugin indent on  "�����Զ���ȫ

set shiftwidth=4   "�Զ������Ŀ��
syntax on          "�򿪸���
set hlsearch       "������ʾ���
set incsearch      "������Ҫ����������ʱ��vim��ʵʱƥ��
set ignorecase     " ����ʱ���Դ�Сд
set showmatch      " ��ʾ����������
set mat=2          " How many tenths of a second to blink when matching brackets
set number         " ��ʾ�к�
set title          " change the terminal's title
set novisualbell   " don't beep
set noerrorbells   " don't beep
set vb t_vb=       "ȥ����������

let mapleader = ","     "Set mapleader

set tabstop=4           " ����Tab���Ŀ��        [��ͬ�Ŀո����]
set shiftwidth=4        " number of spaces to use for autoindenting
set softtabstop=4       " ���˸��ʱ����һ��ɾ�� 4 ���ո�
set smarttab            " insert tabs on the start of a line according to shiftwidth, not tabstop ���˸��ʱ����һ��ɾ�� 4 ���ո�
set expandtab      "�ÿո����tab

set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

set foldenable          " ��ʼ�۵�
set foldmethod=indent   " �����۵���ʽ(syntax\marker\expr)
set foldcolumn=0        " �����۵�����Ŀ��
setlocal foldlevel=1    " �����۵�����Ϊ
set foldlevelstart=99   " ���ļ���Ĭ�ϲ��۵�����
"set foldclose=all      " ����Ϊ�Զ��ر��۵� 

set smartindent          "Smart indent
set autoindent           " always set autoindenting on
" never add copyindent, case error   " copy the previous indentation on autoindenting

set nobackup          "������~�����ļ�(gvim��Ҫͬʱ�޸�vimrc_example.vim)
set nocompatible      "�ر�vi����ģʽ��������������
set autoread          " �ļ��޸�֮���Զ����롣
set nobackup          " ȡ�����ݡ� ������Լ���
set noswapfile
set cursorline              " ͻ����ʾ��ǰ��

"create undo file
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set wildignore=*.swp,*.bak,*.pyc,*.class

set ruler                 "��ʾ��ǰ���к��кţ�
set showcmd               "��״̬����ʾ�������������
set showmode              " Show current mode

set scrolloff=7          "j/k ���¹���,ʼ�����м�

"set winwidth=79

" �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
set laststatus=2


set guifont=Bitstream_Vera_Sans_Mono:h9.5:cANSI      "��������ΪBitstream

set guioptions-=m               "��gui�Ĳ˵���ȥ��
set guioptions-=T               "ȥ��������
autocmd GUIEnter * simalt ~x    "����ʱ���

"��������ñ���vim���ĳ�������
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
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
 
" �˴��涨Vundle��·��
" if Linux
"   set rtp+=~/.vim/bundle/vundle/
"   call vundle#rc('$VIM/vimfiles/bundle/')
" if Windows
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')

" original repos on github
" github�ϵ��û�д�Ĳ����ʹ�������û���+repo���Ƶķ�ʽ
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
" vimscripts��repoʹ������ĸ�ʽ��ֱ���ǲ������
"Bundle 'taglist.vim'


"===============��ɫ����===================="
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/Lucius'
Bundle 'tomasr/molokai'
colorscheme solarized     "������ɫ����
set background=dark
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"################### ���� ###################"
"Ŀ¼����
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
"�����ڵ�ǰĿ¼��Ѱ��tags���Ҳ�����Ŀ¼���ң�һֱ�ݹ�
set tags=tags;
"set autochdir		"�ı�vim�ĵ�ǰĿ¼����ΪcscopeҪ����·����һ��ر�

"-------------------------------
"      cscope 
"-------------------------------
"����cscope���ݿ⡢ctags
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

"----���Һ������ꡢö�ٵȶ����λ��: alt+g
nmap <M-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <esc>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"----���ҵ��ñ������ĺ���:  alt+s
nmap <M-s> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <esc>s :cs find c <C-R>=expand("<cword>")<CR><CR>
"----����ָ�����ַ���:  alt+f
nmap <M-f> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <esc>f :cs find t <C-R>=expand("<cword>")<CR><CR>
"����C���Է��ţ������Һ��������ꡢö��ֵ�ȳ��ֵĵط�
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"����egrepģʽ���൱��egrep���ܣ��������ٶȿ����
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"���Ҳ����ļ�������vim��find����
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"���Ұ������ļ����ļ�
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"���ұ��������õĺ���
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"-------------------------------
"       tag list
"-------------------------------
if g:iswindows==1                "�趨windowsϵͳ��ctags�����λ��
    let Tlist_Ctags_Cmd = 'ctags'
elseif g:iswindows==0              "�趨linuxϵͳ��ctags�����λ��
    let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
let Tlist_Show_One_File = 1            "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_Exit_OnlyWindow = 1          "���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window = 1         "���Ҳര������ʾtaglist��
let Tlist_File_Fold_Auto_Close=1        "�õ�ǰ�����༭���ļ��ķ����б��Զ��۵�����

"ӳ��F8ΪTaglist
map <silent> <F8> :TlistToggle<cr>      

"-------------------------------
"    OmniCppComplete
"-------------------------------
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " ��ʾ���������б�
let OmniCpp_MayCompleteDot = 1   " ���� .  ���Զ���ȫ
let OmniCpp_MayCompleteArrow = 1 " ���� -> ���Զ���ȫ
let OmniCpp_MayCompleteScope = 1 " ���� :: ���Զ���ȫ
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" �Զ��رղ�ȫ����
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

"ӳ��LookupFileΪ,lk-----�����ļ�
nmap <silent> <leader>lk :LUTags<cr>
"ӳ��LUBufsΪ,ll------����Buffer
nmap <silent> <leader>ll :LUBufs<cr>
"ӳ��LUWalkΪ,lw-----����Ŀ¼
nmap <silent> <leader>lw :LUWalk<cr>


"-------------------------------
"      netrw setting 
"-------------------------------
let g:netrw_winsize = 30
" ,fe���ļ������
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

