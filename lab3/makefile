compile: src/main.asm
	arm-linux-gnueabi-as src/main.asm -o os/main.o -g

link: os/main.o
	arm-linux-gnueabi-ld os/main.o -o bin/main -d

all: compile link
