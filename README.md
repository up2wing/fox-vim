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
    ,,f[x]  快速移动到x
### 7、NERD_commenter
    自动注释工具
    ,cc     "基本注释
    ,cm     "添加多行注释；
    ,cu     "取消注释
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
    ,p  迅速打开工程中的一个文件，祖先目录为带.svn .git目录所在目录。因此需要在工程根目录下建立一个.git目录，否则只搜索打开文件所在目录。
    ,f  从历史文件中模糊查找

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
    ,p          将剪贴板复制到vim
    ,f          打开历史文件
### 4、常用操作
    1）禁止生成～备份文件
        修改vimrc_example.vim文件，将下面几行注释掉
        if has("vms")
          set nobackup		" do not keep a backup file, use versions instead
        else
          set backup		" keep a backup file
        endif
    2）修改了配置后马上生效
        :source $VIM/_vimrc
### 5、代码常用操作
    转到局部变量定义    gd



参考：
-------------------------------------------
    1. Vundle for Windows, https://github.com/gmarik/vundle/wiki/Vundle-for-Windows
    2. wklken/k-vim, https://github.com/wklken/k-vim
    3. 易水博客: http://easwy.com/blog/archives/advanced-vim-skills-catalog/
    4. Vimer的程序世界：http://www.vimer.cn/

