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
gtags_exc="-path ./arch"
cscope_exc="-path `pwd`/arch"
find . \( $gtags_exc \) -prune -type f -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.S' > gtags.files
find ./arch/x86  -type f -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.S' >> gtags.files
find `pwd` \( $cscope_exc \) -prune -type f -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files
find `pwd`/arch/x86 -type f -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.S' >> cscope.files
gtags
cscope -bkq -i cscope.files

echo gtags built completely!

