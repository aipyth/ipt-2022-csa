Install tools for compilation

```bash
yay -S arm-none-eabi-gcc
```

Install debugger

```bash
yay -S arm-none-eabi-gdb
```

Install qemu headless

```bash
pacman -S qemu-headless-arch-extra
```

Compile and link

```bash
make compile
make link
```

Start debug server

```bash
make start-debug-server
```

Start `gdb` debugger

```bash
arm-none-eabi-gdb
```

```
(gdb) file bin/main
(gdb) target remote localhost:1234
```

*Optionally* start tui
```bash
(gdb) tui enable
(gdb) tui reg next
```
