fox-vim
=======
"=============================================
" Author: WangYi
" Version: 1
" Email: up2wing@gmail.com
" ReadMe: README.md
" Sections:


fox-vim, using vundle to manage plugins

1. 安装插件
    使用了vundle管理插件，首先要安装git和curl，方法见参考1。Windows下直接执行install.bat。 

2. 插件的使用
    1）nerdtree
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










参考：
    1、Vundle for Windows, https://github.com/gmarik/vundle/wiki/Vundle-for-Windows
    2、wklken/k-vim, https://github.com/wklken/k-vim
    
