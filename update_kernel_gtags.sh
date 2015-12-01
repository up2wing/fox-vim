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
gtags_exc=" "
cscope_exc=" "

for dir in $(ls arch)
do
    #echo $dir
    gtags_pre="-path ./arch/$dir -o "
    cscope_pre="-path `pwd`/arch/$dir -o "

    if  test $dir != "x86" -a $dir != "x86_64" ; then
        gtags_exc=$gtags_exc$gtags_pre
        cscope_exc=$cscope_exc$cscope_pre
    fi
done

gtags_exc=${gtags_exc%"-o "}
cscope_exc=${cscope_exc%"-o "}

find . \( $gtags_exc \) -prune -type f -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.S' > gtags.files
find ./include -type f -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.S' >> gtags.files
find `pwd` \( $cscope_exc \) -prune -type f -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files
find `pwd`/include -type f -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.S' >> cscope.files
gtags
cscope -bkq -i cscope.files

echo gtags built completely!

