@echo off
echo "building cscope files......"
set path=c:\cygwin\bin;
find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > gtags.files

