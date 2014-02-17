echo off

set vim_bin_path = "%HOME%\vim74"

REM copy _vimrc and backup the original one
copy "%HOME%"\_vimrc "%HOME%"\_vimrc_bak
copy _vimrc "%HOME%"\

REM gentags.bat产生cscope.out，放到gvim.exe目录下。
copy gentags.bat "%vim_bin_path%"\

REM 语法高亮: 拷贝cpp.vim, c.vim到vim的安装插件目录，覆盖默认的对应文件
copy cpp.vim %vim_vin_path%\syntax
copy c.vim %vim_vin_path%\syntax

REM make folder for bundle and update the newest from github
IF NOT EXIST "%HOME%\vimfiles\bundle" (
	call mkdir "%HOME%\vimfiles\bundle"
)

IF NOT EXIST "%HOME%/vimfiles/bundle/vundle" (
    echo "Installing Vundle"
    call git clone https://github.com/gmarik/vundle.git "%HOME%/vimfiles/bundle/vundle"
)

echo "update/install plugins using Vundle"
call vim -u "%HOME%\_vimrc" +BundleInstall! +BundleClean +qall
