#!/bin/bash
echo '[-] 64-Bit Assembly to Shellcode converter '
echo ''
echo ''
echo '[+] Assembling with Nasm ... '
nasm -f elf64 -o $1.o $1
echo '[+] Linking ...'
ld -m elf_x86_64 -o $1.bin $1.o
echo ''
echo '[+] Generating shellcode ...'
for i in $(objdump -d ./$1.bin |grep "^ " |cut -f2); do echo -n '\x'$i >> sc.txt; done; echo
cat sc.txt
echo''
echo '[+] Done.'

