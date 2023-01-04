section .data
  ; Визначити дані
  ; a1 → 15H, a2 → 20H, b1 → 4H, b2 → 88H, c1 → 5H, c2 → 6H
  a1: dw 0x15
  a2: dw 0x20
  b1: dw 0x4
  b2: dw 0x88
  c1: dw 0x5
  c2: dw 0x6

section .text
	global _start

_start:
  ; Занести в регістри такі величини
  ; AX → a1 + a2
  mov ax, [a1]
  mov bx, [a2]
  add ax, bx     ; ax = 0x0035
  ;---------------------------
  ; BX → b2 / b1
  push ax

  mov ax, [b2]
  mov bx, [b1]
  mov dx, 0
  div bx
  mov bx, ax     ; bx = 0x0022

  pop ax
  ;---------------------------
  ; CX → c1 + c2
  mov cx, [c1]
  mov dx, [c2]
  add cx, dx     ; cx = 0x000B
  ;---------------------------
  ; DX → Циклічний зсув з переносом а1 на 2 позиції ліворуч
  mov dx, [a1]
  rol dx, 2      ; dx = 0x0054

; Організувати цикл, послідовно зменшуючи число у регістрі СХ на 1. У 
; циклі збільшувати число, що знаходиться у регістрі АХ на величину, що 
; знаходиться у регістрі ВХ, пока значення СХ не стане меншим 0

  ; jmp cycle2

cycle:
  cmp cx, 0
  jl quit
  add ax, bx
  sub cx, 1
  jmp cycle
  ; at the end of the cycle
  ; ax = 0x01cd

cycle2:
  add ax, bx
  sub cx, 1
  jcxz quit
  jmp cycle2

  dec eax

quit:
	mov eax,1
	mov ebx,0
	int 80h
