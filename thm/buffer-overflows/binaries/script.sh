#!/bin/bash
echo '[-] 32-Bit Assembly to Shellcode converter '
echo ''
echo ''
echo '[+] Assembling with Nasm ... '
nasm -f elf32 -o $1.o $1
echo '[+] Linking ...'
ld -m elf_i386 -o $1.bin $1.o
echo ''
echo '[+] Generating shellcode ...'
for i in $(objdump -d ./$1.bin |grep "^ " |cut -f2); do echo -n '\x'$i >> sc.txt; done; echo
cat sc.txt
echo''
echo '[+] Done.'
