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
    "�ÿո���������۵� {
        "nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
        "����o���ж����ý���༭ģʽ
        noremap go o<esc>
        noremap gO O<esc>
        nmap <C-n> <C-e>
        nmap <C-p> <C-y>
    " }
    
    " history�洢���ȡ�{
        set history=2000
    " }
    
    " �ļ����� {
        filetype on                "����ļ�����
        filetype indent on         "��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
        filetype plugin on         "������
        filetype plugin indent on  "�����Զ���ȫ
    " }
    
    " �۵�{
        set foldenable          " ��ʼ�۵�
        set foldmethod=indent   " �����۵���ʽ(syntax\marker\expr)
        set foldcolumn=0        " �����۵�����Ŀ��
        setlocal foldlevel=1    " �����۵�����Ϊ
        set foldlevelstart=99   " ���ļ���Ĭ�ϲ��۵�����
        "set foldclose=all      " ����Ϊ�Զ��ر��۵�
    " }

    " ���� {
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
        set shiftwidth=4   "�Զ������Ŀ��
        set softtabstop=4       " ���˸��ʱ����һ��ɾ�� 4 ���ո�
        set smarttab            " insert tabs on the start of a line according to shiftwidth, not tabstop ���˸��ʱ����һ��ɾ�� 4 ���ո�
        set expandtab      "�ÿո����tab
        
        set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
        set smartindent          "Smart indent
        set autoindent           " always set autoindenting on
        " never add copyindent, case error   " copy the previous indentation on autoindenting
        
        set nobackup          "������~�����ļ�(gvim��Ҫͬʱ�޸�vimrc_example.vim)
        set nocompatible      "�ر�vi����ģʽ��������������
        set autoread          " �ļ��޸�֮���Զ����롣
        set noswapfile
        set cursorline        " ͻ����ʾ��ǰ��
        
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

    " }
    
    " ���弰��� {
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

    " �˴��涨Vundle��·��
"    if(g:iswindows==0)
        "set rtp+=~/.vim/bundle/vundle/
"        call vundle#rc('$VIM/vimfiles/bundle/')
"    else
        set rtp+=$VIM/vimfiles/bundle/vundle/
        call vundle#rc('$VIM/vimfiles/bundle/')
"    endif

    " original repos on github
    " github�ϵ��û�д�Ĳ����ʹ�������û���+repo���Ƶķ�ʽ
    Bundle 'gmarik/vundle'
    " vimscripts��repoʹ������ĸ�ʽ��ֱ���ǲ������
    "Bundle 'taglist.vim'
" }

" ��ɫ���� {
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'vim-scripts/Lucius'
    Bundle 'tomasr/molokai'
    colorscheme solarized     "������ɫ����
    set background=dark
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
"}

" ���� { 
    "Ŀ¼����
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
    ""���FileExplorer���ڱ�С����
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
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_match_window_bottom=1
    let g:ctrlp_max_height=15
    let g:ctrlp_match_window_reversed=0
    let g:ctrlp_mruf_max=500
    let g:ctrlp_follow_symlinks=1
"}

" ��ʾ��ǿ {
"״̬����ǿչʾ
Bundle 'Lokaltog/vim-powerline'
"if want to use fancy,need to add font patch -> git clone git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'

Bundle 'vim-scripts/Mark'
"nmap <M-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
   " nmap <unique> <silent> <leader>m <Plug>MarkSet
nmap <M-e> <Plug>MarkSet 
nmap <esc>e <Plug>MarkSet

"������ʾ��ǿ
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
    
"�����Ű�������ʶ
Bundle 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '|'

"for show no user whitespaces
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>
" }

" �����ƶ� {
"����Ч���ƶ� ,, + w/fx
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/matchit.zip'
" }

" �Զ���ȫ {
"����λ���õ�����õ��Զ�VIM�Զ���ȫ���, Windows��ʹ��������
 Bundle 'Valloric/YouCompleteMe'
"youcompleteme  Ĭ��tab  s-tab ���Զ���ȫ��ͻ
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']

" YouCompleteMe ����
" ��ȫ������ע����ͬ����Ч
let g:ycm_complete_in_comments=1
" ���� vim ���� .ycm_extra_conf.py �ļ���������ʾ
let g:ycm_confirm_extra_conf=0
" ���� YCM ���ڱ�ǩ����
let g:ycm_collect_identifiers_from_tags_files=1
" ���� C++ ��׼��tags�����û��Ҳû��ϵ��ֻҪ.ycm_extra_conf.py�ļ���ָ������ȷ�ı�׼��·��
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM ���� OmniCppComplete ��ȫ���棬�������ݼ�
inoremap <leader>; <C-x><C-o>
" ��ȫ���ݲ��Էָ��Ӵ�����ʽ���֣�ֻ��ʾ��ȫ�б�
set completeopt-=preview
" �ӵ�һ�������ַ��Ϳ�ʼ����ƥ����
let g:ycm_min_num_of_chars_for_completion=1
" ��ֹ����ƥ���ÿ�ζ���������ƥ����
let g:ycm_cache_omnifunc=0
" �﷨�ؼ��ֲ�ȫ            
let g:ycm_seed_identifiers_with_syntax=1
" �޸Ķ�C�����Ĳ�ȫ��ݼ���Ĭ����CTRL + space���޸�ΪALT + ;
let g:ycm_key_invoke_completion = '<M-;>'
" ����ת�����崦�Ŀ�ݼ�ΪALT + G��������ܷǳ���
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>

"}

" ���ٲ������Ƭ�� {
Bundle 'vim-scripts/UltiSnips'
Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
"�����Ŵ���Ƭ�ε��ļ��� .vim/snippets�£�ʹ���Զ����Ĭ�ϵģ�����ĵ�ȫ�֣��г�ͻ�Ļ���ʾ
let g:UltiSnipsSnippetDirectories=["snippets", "bundle/UltiSnips/UltiSnips"]
"}

" ���ټ����޸Ļ����ַ� {
"Bundle 'tpope/vim-surround'
""for repeat -> enhance surround.vim, . to repeat command
"Bundle 'tpope/vim-repeat'
"}

"�Զ���ȫ�����ţ�˫���ŵ� {
Bundle 'Raimondi/delimitMate'
" for python docstring ",�Ż�����
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

" �﷨��� {
" �༭ʱ�Զ��﷨�����, vim-flake8Ŀǰ����֧��,���Զ�װһ��
" ʹ��pyflakes,�ٶȱ�pylint��
Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
highlight SyntasticErrorSign guifg=white guibg=black

" python fly check, �ֲ�syntasticֻ�ܴ򿪺ͱ���ż���﷨�Ĳ���
Bundle 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0
" }

"QuickFix Toggle {
Bundle 'vim-scripts/QFixToggle'
nnoremap <silent> <leader>sf :QFix<CR>
nmap <F4> :cn<cr>
nmap <F3> :cp<cr>
"}"

" ���������﷨���� { 
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

"edit history, ���Բ鿴�ص�ĳ����ʷ״̬
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

" tags {
Bundle 'vim-scripts/ctags.vim'
"�����ڵ�ǰĿ¼��Ѱ��tags���Ҳ�����Ŀ¼���ң�һֱ�ݹ�
set tags=tags;
"set autochdir		"�ı�vim�ĵ�ǰĿ¼����ΪcscopeҪ����·����һ��ر�
" }

" cscope {
Bundle 'vim-scripts/cscope.vim'
Bundle 'vim-scripts/autoload_cscope.vim'
let g:autocscope_menus=0

"set cscope output to quickfix windows
if has("cscope")
    set cscopequickfix=s-,c-,g-,i-,t-,e-
    set csto=1
    set cst
    set csverb
    set cspc=3
endif

"����cscope���ݿ⡢ctags
map <C-F12> :call Do_GenCsTag()<CR>
map <F12> :call LoadCscope()<CR>
function! Do_GenCsTag()
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
        if(g:iswindows==0)
            silent! execute "!cscope -bkq"
        else
            " Windows��sort���⣬����ʹ��-q����ֻ������
            silent! execute "!gentags.bat"
        endif
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        else
           let cscope_file=findfile("cscope.out", ".;")  
           let cscope_pre=matchstr(cscope_file, ".*/")  
           if !empty(cscope_file) && filereadable(cscope_file)  
               exe "cs add" cscope_file cscope_pre  
           endif
        endif
    endif
endfunction

function! LoadCscope()
    if (g:iswindows==1)
        if (executable("cscope") && has("cscope"))
        	let UpperPath = findfile("cscope.out", ".;")
        	if (!empty(UpperPath))
        		let path = strpart(UpperPath, 0, match(UpperPath, "cscope.out$") - 1)	
        		if (!empty(path))
        			let s:CurrentDir = getcwd()
        			let direct = strpart(s:CurrentDir, 0, 2) 
        			let s:FullPath = direct . path
        			let s:AFullPath = globpath(s:FullPath, "cscope.out")
        			let s:CscopeAddString = "cs add " . s:AFullPath . " " . s:FullPath 
        			execute s:CscopeAddString 
        		endif
        	endif
        endif
    else
       let db = findfile("cscope.out", ".;")
       if (!empty(db))
         let path = strpart(db, 0, match(db, "/cscope.out$"))
         set nocscopeverbose " suppress 'duplicate connection' error
         exe "cs add " . db . " " . path
         set cscopeverbose
       endif        
    endif
endfunction

"----���Һ������ꡢö�ٵȶ����λ��: alt+g
nmap <M-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <esc>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <M-d> :tag 
nmap <esc>d :tag 
nmap <M-w> :cs f g 
nmap <esc>w :cs f g 
"----���ҵ��ñ������ĺ���:  alt+s
nmap <M-s> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <esc>s :cs find c <C-R>=expand("<cword>")<CR><CR>
"����C���Է��ţ������Һ��������ꡢö��ֵ�ȳ��ֵĵط�
nmap <M-f> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <esc>f :cs find s <C-R>=expand("<cword>")<CR><CR>
"����egrepģʽ���൱��egrep���ܣ��������ٶȿ����
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"----����ָ�����ַ���:  alt+f
nmap <C-@>s :cs find t <C-R>=expand("<cword>")<CR><CR>
"���Ҳ����ļ�������vim��find����
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"���Ұ������ļ����ļ�
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"���ұ��������õĺ���
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" }

" ��ǩ���� {
Bundle 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_left = 1
let g:tagbar_sort = 0
" }

" tag list {
" ��tagbar���棬�����������֧�ָ���
"Bundle 'vim-scripts/taglist.vim'
"if g:iswindows==1                "�趨windowsϵͳ��ctags�����λ��
    "let Tlist_Ctags_Cmd = 'ctags'
"elseif g:iswindows==0              "�趨linuxϵͳ��ctags�����λ��
    "let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"endif
"let Tlist_Show_One_File = 1            "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
"let Tlist_Exit_OnlyWindow = 1          "���taglist���������һ�����ڣ����˳�vim
"let Tlist_Use_Right_Window = 0        "���Ҳര������ʾtaglist��
"let Tlist_File_Fold_Auto_Close=1        "�õ�ǰ�����༭���ļ��ķ����б��Զ��۵�����

""ӳ��F8ΪTaglist
"map <silent> <F8> :TlistToggle<cr>
" }

" Alternate ͷ�ļ��л� {
Bundle 'vim-scripts/a.vim'
" }

" OmniCppComplete {
"Bundle 'vim-scripts/OmniCppComplete'
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " ��ʾ���������б�
"let OmniCpp_MayCompleteDot = 1   " ���� .  ���Զ���ȫ
"let OmniCpp_MayCompleteArrow = 1 " ���� -> ���Զ���ȫ
"let OmniCpp_MayCompleteScope = 1 " ���� :: ���Զ���ȫ
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" �Զ��رղ�ȫ����
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest
" }

" lookupfile setting {
Bundle 'vim-scripts/genutils'
Bundle 'vim-scripts/lookupfile'
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
" }

" netrw setting {
Bundle 'vim-scripts/netrw.vim'
let g:netrw_winsize = 30
" ,fe���ļ������
nmap <silent> <leader>fe :Sexplore!<cr>
" }

" BufExplorer {
Bundle 'corntrace/bufexplorer'
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber
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

