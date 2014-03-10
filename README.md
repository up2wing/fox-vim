fox-vim
=====================================
    " Author: WangYi
    " Version: 1.1
    " Email: up2wing#gmail.com
    " ReadMe: README.md


    fox-vim, using vundle to manage plugins

一. 安装插件
--------------------------------------
    使用了vundle管理插件，首先要安装git和curl，方法见参考1。
    然后设置HOME环境变量，指向vim的安装路径，例如：d:\Program Files\Vim。
    Windows下直接执行install.bat。
    产生cscope和tags的时候，使用了linux命令find等，需要安装Cygwin或者UnixUtils，并将find拷贝一份重命名gfind.exe, sort->gsort.exe。
    默认Cygwin安装在c:\cygwin目录，否则修改gentags.bat; cscope.exe及dll需要放到cygwin\bin下。

二. 插件的使用
---------------------------------------
### 1、tags
    将ctags58目录中的exe文件拷贝到vim.exe所在目录。
    Ctrl+F12即可生成tags,并自动添加数据库
        Alt+d                   "打开符号表
        Alt+s                   "通过cscope查找引用
        Alt+f                   "搜索文本

        :tag {ident}            "跳转到指定的标签
        :tags                   "显示标签栈
        CTRL-]                  "跳转到当前光标下的标签
        CTRL-T                  "跳到标签栈中较早的标签
### 2、LookupFiles
    首先安装genutils，然后安装lookupfiles插件。
    按”<F5>“或输入”:LookupFile“在当前窗口上方打开一个lookupfile小窗口。
### 3、QuickFix窗口
    ,sf     "快速打开QuickFix窗口
    f3/F4   "向前/前后切换
### 4、cscope
    通过:cs add cscope.out添加数据库，使用参见vimrc文件。
### 5、Taglist
    F9打开TagList窗口.
### 6、winmanager
    ,wm  打开winmanager
### 7、NERD_commenter
    自动注释：,cm是添加注释；,cu是取消注释
### 8、sessionman
    将session保存、恢复
### 9、 nerdtree
    ,n  打开 关闭树形目录结构
    在nerdtree窗口常用操作：(小写当前，大写root)
        x.......Close the current nodes parent收起当前目录树
        R.......Recursively refresh the current root刷新根目录树
        r.......Recursively refresh the current directory刷新当前目录
        P.......Jump to the root node
        p.......Jump to current nodes parent
        K.......Jump up inside directories at the current tree depth  到同目录第一个节点
        J.......Jump down inside directories at the current tree depth 最后一个节点
        o.......Open files, directories and bookmarks
        i.......Open selected file in a split window上下分屏
        s.......Open selected file in a new vsplit左右分屏

三、vim使用
----------------------------------------------
### 1、BufExplorer
    ,be 正常打开；
    ,bs 水平打开；
    ,bv 垂直打开
### 2、会话
    1) 退出时:mksession! c:\Users\Administrator\project_name.vim，然后在用户目录中建立project_namex.vim，输入：
        set path+=project_path
        :cs add project_path\cscope.out
    2) 打开时，cmd输入gvim &，在打开的vim中输入:source project_name.vim。
### 3、字体
    采用Bitstream Vera Sans Mono，SourceInsight、VS、SSH都可以采用这种字体。
    双击VeraMono.ttf，直接安装即可。

### 3、窗口
    Ctrl+w  切分的窗口之间切换
### 4、常用操作
    lb/le/lr    到达行尾/行首/首个不为空的单词
    ,y          将选中文本复制到剪贴板
    ,p          将剪贴板复制到vim
    ,f          打开历史文件
### 5、常用操作
    1）禁止生成～备份文件
        修改vimrc_example.vim文件
    2）修改了配置后马上生效
        :source $VIM/_vimrc



参考：
-------------------------------------------
    1. Vundle for Windows, https://github.com/gmarik/vundle/wiki/Vundle-for-Windows
    2. wklken/k-vim, https://github.com/wklken/k-vim
    3. 易水博客: http://easwy.com/blog/archives/advanced-vim-skills-catalog/
    4. Vimer的程序世界：http://www.vimer.cn/

