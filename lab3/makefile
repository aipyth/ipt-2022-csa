DEBUG_SERVER_PORT:=1234

compile: src/main.s
	arm-none-eabi-as src/main.s -o os/main.o -g

link: compile
	arm-none-eabi-ld os/main.o -o bin/main -d

all: link

run: link
	qemu-arm bin/main

start-debug-server:
	qemu-arm -singlestep -g $(DEBUG_SERVER_PORT) ./bin/main
