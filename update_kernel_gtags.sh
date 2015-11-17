#/*===============================================================
#*   Copyright (C) 2015 All rights reserved.
#*   
#*   FileName：update_kernel_gtags.sh
#*   Author：WangYi
#*   Date： 2015-11-17
#*   Description：
#*
#================================================================*/
#产生cscope文件，排除arch非相关目录

echo will generate gtags for kernel... ...
exclude=" "

for dir in $(ls arch)
do
    #echo $dir
    pre="-path ./arch/$dir -o "

    if  test $dir != "x86" -a $dir != "x86_64" ; then
        exclude=$exclude$pre
    fi
done

exclude=${exclude%"-o "}

find . \( $exclude \) -prune -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > gtags.files; find `pwd` -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files; gtags; cscope -bkq -i cscope.files

echo gtags built completely!

