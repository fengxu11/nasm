section .data
    msg db 'Hello, World!', 0   ; 字符串常量

section .text
    global _start              ; 入口点

_start:
    ; 将消息指针存储在 ebx 中
    mov ebx, msg
    ; 调用系统调用 write
    ; 参数 1: stdout 文件描述符 (1)
    ; 参数 2: 指向消息的指针
    ; 参数 3: 消息长度
    ; 返回值: 写入的字节数
    mov eax, 4                  ; write 系统调用号
    mov ecx, ebx                ; 消息指针
    mov edx, 13                 ; 消息长度
    int 0x80                    ; 调用系统调用

    ; 调用系统调用 exit
    ; 参数 1: 退出码 (0 表示正常退出)
    mov eax, 1                  ; exit 系统调用号
    xor ebx, ebx                ; 退出码为 0
    int 0x80                    ; 调用系统调用
