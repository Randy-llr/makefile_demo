git clone git@github.com:Randy-llr/makefile_demo.git

一 ： 编译单个文件命令gcc g++ C/C++, 下面gcc与g++可替换，取决于语言是C还是C++
    gcc main.c gcc *.c
    g++ main.cpp g++ *.cpp
    windows默认生成a.exe Linux默认生成a.out

二 ： 源程序到可执行文件步骤：
    1.预处理
        gcc -E *.c > *.txt 
        这里> *.txt 表示把预处理文件重定向到txt文件
        
        预编译指令：
            头文件引入
            宏的展开
            指令处理
    2.编译
        gcc -c *.c
        默认生成目标文件 *.o
    3.链接
        将多个目标文件（动态库、静态库）链接生成一个可执行文件
        gcc main.o plus.o -o main.exe
        将多个.o文件生成exe可执行文件

三 ： 多文件编译
	初级版
	Linux下Makefile不能用空格代替tab不然编译不过，很奇怪
##########################################################
calculate.exe:main.o plus.o
	gcc main.o plus.o -o calculate.exe
main.o:main.c
	gcc -c main.c -o main.o
plus.o:plus.c
	gcc -c plus.c -o plus.o

clean:
	rm -rf *.o calculate.exe
##########################################################
	最终版
	这时候clean前面不能空一行
	$@表示前面的目标
	$<一个个匹配依赖
##########################################################
calculate.exe:main.o plus.o
	gcc *.o -o $@
%.o:%.c
	gcc -c $< -o $@
clean:
	rm -rf *.o calculate.exe
##########################################################

四 ： Linux下Makefile不能用空格代替tab不然编译不过，很奇怪