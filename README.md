fox-vim
=====================================
    " Author: WangYi
    " Version: 1.2
    " Email: up2wing#gmail.com
    " ReadMe: README.md


    fox-vim, using vundle to manage plugins

一. 安装插件
--------------------------------------
    使用了vundle管理插件，首先要安装git和curl，方法见参考1。
    然后设置HOME环境变量，指向vim的安装路径，例如：d:\Program Files\Vim。
    Windows下直接执行install.bat。
    默认Cygwin安装在c:\cygwin目录，否则需要修改gentags.bat。

二. 插件的使用
---------------------------------------
### 1、YouCompleteMe
    自动补全神器，需要手动安装。配置方法移步：http://blog.csdn.net/up2wing/article/details/20313213。
### 2、GNU Global
    跳转定义、查找引用，比cscope用起来快。需要手动安装。
    从GNU官网http://www.gnu.org/software/global/download.html下载压缩包，然后将bin下的文件拷贝到gvim所在目录（以Windows为例）。
    映射快捷键->->->->
        Ctrl+F12即可生成tags,并自动添加数据库
        F12自动更新数据库
        Alt+g                   "转到函数定义
        Alt+d                   "打开符号表，支持POSIX正则；按Tab自动补全；
        Alt+s                   "查找引用
        Alt+f                   "搜索字符串
        Alt+w                   “如果Alt+g找不到定义，用这个
### 3、QuickFix窗口
    ,sf     "快速打开QuickFix窗口
    f3/F4   "向前/前后切换
### 4、rainbow_parentheses
    高亮显示匹配大括号、小括号等。不知道为什么我的配置文件自动载入不生效，按F2手动生效:(
### 5、tagbar
    比TagList在面向对象语言时看起来更舒服些, 需要ctags支持。下载CTags到gvim.exe所在目录。
    F9打开Tagbar窗口.
### 6、Easymotion
    快速移动插件
    ,,w    跳转到某单词
    ,,f    跳转到以某字母开头的单词

### 7、NERD_commenter
    自动注释工具
    ,ca    在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
    ,cc    注释当前行
    ,cs    以”性感”的方式注释
    ,cA    在当前行尾添加注释符，并进入Insert模式
    ,cu    取消注释

### 8、sessionman
    将session保存、恢复
### 9、 nerdtree
    ,w  打开 关闭树形目录结构
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
### 10、CtrlP
    在项目根目录中建立一个.git目录，ctrlp每次搜索即从根目录开始查找
    如要修改根目录标志，可以修改g:ctrlp_root_markers变量。绑定快捷键：
        ,p  迅速打开工程中的一个文件，祖先目录为带.svn .git目录所在目录。因此需要在工程根目录下建立一个.git目录，否则只搜索打开文件所在目录。
        ,f  从历史文件中模糊查找
    ctrlp扩展ctrlp-funky
        ,ff    模糊查找本文件内的函数

### 11、FixWhiteSpace
    ,space    消除代码中的空格

### 12、Mark
    Alt+e                  "高亮/取消高亮当前单词颜色


三、vim使用
----------------------------------------------
### 1、字体
    采用Bitstream Vera Sans Mono，SourceInsight、VS、SSH都可以采用这种字体。
    双击VeraMono.ttf，直接安装即可。

### 2、窗口
    Ctrl+w  切分的窗口之间切换
### 3、常用操作
    lb/le/lr    到达行尾/行首/首个不为空的单词
    ,y          将选中文本复制到剪贴板
    gd          转到局部变量定义
### 4、常用操作
    1）禁止生成～备份文件
        修改vimrc_example.vim文件，将下面几行注释掉
        if has("vms")
          set nobackup		" do not keep a backup file, use versions instead
        else
          set backup		" keep a backup file
        endif

        补记：
        这个最好还是不要注释掉，否则再次打开文件不能回到上次打开的位置.
        本vim配置将备份文件放在~/vimbackupfile，Windows下对应vim安装目录，例如：d:\program files\vim。

    2）修改了配置后马上生效
        :source $VIM/_vimrc
    3）在终端putty下面使用时
        set t_Co=256
        配置putty的solarized配色，下载这个工程，导入注册表即可。
        https://github.com/brantb/solarized/tree/master/putty-colors-solarized
    4）粘贴时防止自动缩进
        set pastetoggle=<F8>
        粘贴之前，按下F8。粘贴之后，再次按下F8。



参考：
-------------------------------------------
    1. Vundle for Windows, https://github.com/gmarik/vundle/wiki/Vundle-for-Windows
    2. wklken/k-vim, https://github.com/wklken/k-vim
    3. 易水博客: http://easwy.com/blog/archives/advanced-vim-skills-catalog/
    4. Vimer的程序世界：http://www.vimer.cn/

