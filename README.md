

# Example

> basic


- [x] if
- [ ] while
- [ ] for
- [ ] func



# QA
## 如何进行编译nasm程序呢？


```

nasm -f elf32 example.asm

ld -m elf_i386 -s -o example example.o


./example


```


