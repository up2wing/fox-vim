echo on

IF NOT EXIST "%HOME%\vimfiles\bundle" (
	call mkdir "%HOME%\vimfiles\bundle"
)

IF NOT EXIST "%HOME%/vimfiles/bundle/vundle" (
    echo "Installing Vundle"
    call git clone https://github.com/gmarik/vundle.git "%HOME%/vimfiles/bundle/vundle"
)

echo "update/install plugins using Vundle"
call vim -u "%HOME%\_vimrc" +BundleInstall! +BundleClean +qall
