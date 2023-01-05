DEBUG_SERVER_PORT:=1234

compile: src/main.asm
	arm-linux-gnueabi-as src/main.asm -o os/main.o -g

link: os/main.o
	arm-linux-gnueabi-ld os/main.o -o bin/main -d

all: compile link

run:
	qemu-arm bin/main

start-debug-server:
	qemu-arm -singlestep -g $(DEBUG_SERVER_PORT) ./bin/main
