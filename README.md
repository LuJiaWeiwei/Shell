# Introduction
A simple simulation of shell in Linux for learning.

# Usage
type

　　make shell

for shell read input by fgets() or

　　make shell_r
　　

for shell with readline lib.It need to install libreadline5-dev first.


## Attention

　　Because of the lack of support for regular expressions , typing file's names such as "*.c" are not support.
　　

# File List
### shell.c
　　main program

### type_prompt.c
　　print out the prompt of shell including path,hostname

### read_command.c
　　read command input, and analyse the command and parameter(s).

### builtin_command.c
　　support some built-in command,such as exit,quit,about, and cd.

### test.c
　　a test program, helloworld, which can be executed in shell.

### parsing.c
　　analyses user's input line and tell them to shell.
　　

# 简介
为了学习而编写的Linux下shell的简单模拟实现。

# 用法
输入

　　make shell

构建使用fgets()接收命令的shell

　　make shell_r
　　

构建使用readline接收命令的shell。需要安装libreadline5-dev或其他类似的库。


## 注意

　　由于不支持正则表达式，含有通配符如"*.c"这样的文件名是不支持的。
    不存在的命令不会提示。
　　

# 文件列表
### shell.c
　　主程序

### type_prompt.c
　　拼接当前路径、主机名的提示符。

### read_command.c
　　读取输入的命令，并分离出其中的参数。

### builtin_command.c
　　提供对基本内建命令的支持，含exit、quit、about、cd等。

### test.c
　　用来在shell中执行的测试程序。

### parsing.c
　　分析用户输入（是否使用了管道、重定向、后台执行等）。
　　
    -实现了用于分析用户输入的函数parse()。
    -支持输入输出重定向、管道、后台运行。
    -Bug修复:
        输入ctrl+d会正常退出shell了。此前，在使用readline库时会段错误。
    由于某处缺少free(), 会内存泄漏。
    -实现了一些内建命令，包括`exit` 、 `quit` 、 `about` 、 `cd`。
    -Bug修复:
        从未释放命令和参数的空间，导致内存泄漏。
        重写read_command()以解决这个问题，现在的行为更像Linux的了。
    -重写read_command():
        现在没必要为command和parameter释放内存了，它们只是指针。
    -提供了两个版本:
        使用readline库和不使用的。前者需要事先安装这个库。
        输入"make shell_r"可以生成前者，而"make shell"会生成后者。
    -用execvp()代替execve()处理 `ls` 这种命令。
    -通过geteuid()判断shell是否执行在root用户下。
    -Bug修复:
        execv()'的arg[0]一般是不含路径的命令，上一个版本处理有误。
    -下一步计划:
        支持内建命令 `cd`。
    -一个具有基本功能的shell: 获取输入并执行测试程序(hello world).
