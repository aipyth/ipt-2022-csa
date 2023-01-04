build: src/main.asm
	nasm -g -f elf src/main.asm

link: build
	ld -s -m elf_i386 -o bin/main src/main.o

run: link
	./bin/main

debug: link
	r2 -d bin/main
