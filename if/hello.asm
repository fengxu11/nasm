section .data

msg_odd db 'j', 0
msg_even db 'ooo', 0
msg_newline db 10, 0 ; 换行符

section .bss

num resb 4 ; 分配4个字节的空间用于存放输入的数

section .text

global _start

_start:
    ; 读入一个整数
    mov eax, 3 ; 系统调用号 3 代表读取
    mov ebx, 0 ; 文件描述符为标准输入
    mov ecx, num ; 存储读取到的数的地址
    mov edx, 4 ; 最多读取 4 个字节
    int 0x80 ; 调用系统调用

    ; 判断数的奇偶性
    mov eax, [num]
    and eax, 1 ; 将数与 1 进行按位与运算
    jz .even ; 如果结果为 0，则是偶数
    jmp .odd ; 否则是奇数

.odd:
    ; 打印字符 'j'
    mov eax, 4 ; 系统调用号 4 代表写入
    mov ebx, 1 ; 文件描述符为标准输出
    mov ecx, msg_odd ; 存储要打印的字符的地址
    mov edx, 1 ; 一次只打印一个字符
    int 0x80 ; 调用系统调用
    jmp .end

.even:
    ; 打印字符串 'ooo'
    mov eax, 4 ; 系统调用号 4 代表写入
    mov ebx, 1 ; 文件描述符为标准输出
    mov ecx, msg_even ; 存储要打印的字符串的地址
    mov edx, 3 ; 一次打印三个字符
    int 0x80 ; 调用系统调用

.end:
    ; 打印换行符并退出程序
    mov eax, 4 ; 系统调用号 4 代表写入
    mov ebx, 1 ; 文件描述符为标准输出
    mov ecx, msg_newline ; 存储要打印的换行符的地址
    mov edx, 1 ; 一次只打印一个字符
    int 0x80 ; 调用系统调用

    mov eax, 1 ; 系统调用号 1 代表退出程序
    xor ebx, ebx ; 返回码为 0
    int 0x80 ; 调用系统调用
