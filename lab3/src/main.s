.global _start

.text
_start:

cycleinit:
  ldr r4, =n
  ldr r5, [r4]    @ load number of iterations
  ldr r4, =as   @ load pointer to first element
  mov r7, #0    @ store the sum here
  mov r8, #0    @ store number of summands
cycle:
  cmp r5, #0
  sub r5, r5, #1
  beq endcycle  @ break if all elements are checked
  ldr r6, [r4], #4    @ check current element and r4 is updated automatically
  mov r0, r6
  bl remainder5       @ the remainder is stored in r0
  sub r0, r0, #1
    @ add r0, r0, #1
    @ and r0, r0, #0b10
    @ cmp r0, #0
  cmp r0, #1
  addls r7, r7, r6
  addls r8, r8, #1
  b cycle


endcycle:

quit:
  mov r7, #0x1
	mov r0, #0x0

	swi 0

# take the number in r0
remainder5:
              push {lr}
remainder5c:  cmp r0, #5
              poplt {pc}
              sub r0, r0, #5
              b remainder5c


.data

n:  .word 5

as: .word 13, 42, 73, 7, 5
