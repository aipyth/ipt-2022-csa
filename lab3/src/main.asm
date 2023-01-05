.global _start
.section .text
main:
	mov r6, #0x43
	mov r7, #0x1
	mov r0, #0x0

	swi 0

.section .data
