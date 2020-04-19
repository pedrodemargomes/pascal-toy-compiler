	global main
	extern  printf
	section .text
main:
	push rbp
	mov rbp, rsp
	mov rax, 0
	push rax
	mov rax, 0
	push rax
	mov rax, 0
	push rax
	mov rax, 2
	mov [rbp-8], rax
	mov rax, [rbp-8]
	push rax
	mov rax, 4
	pop rcx
	sub rcx, rax
	mov rax, rcx
	push rax
	mov rax, 2
	push rax
	mov rax, 2
	push rax
	mov rax, 2
	push rax
	mov rax, 1
	push rax
	mov rax, 2
	pop rcx
	mul rcx
	pop rcx
	sub rcx, rax
	mov rax, rcx
	pop rcx
	mul rcx
	pop rcx
	add rax, rcx
	pop rcx
	mul rcx
	mov [rbp+0], rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, [rbp-8]
	push rax
	mov rax, 4
	pop rcx
	sub rcx, rax
	mov rax, rcx
	push rax
	mov rax, 2
	push rax
	mov rax, 2
	push rax
	mov rax, 2
	push rax
	mov rax, 1
	push rax
	mov rax, 2
	pop rcx
	mul rcx
	pop rcx
	sub rcx, rax
	mov rax, rcx
	pop rcx
	mul rcx
	pop rcx
	add rax, rcx
	pop rcx
	mul rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, [rbp+0]
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 0
	push rax
	mov rax, 99
	pop rcx
	sub rcx, rax
	mov rax, rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, [rbp-8]
	push rax
	mov rax, 2
	pop rcx
	sub rcx, rax
	mov rax, rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 1
	push rax
	mov rax, 3
	pop rcx
	sub rcx, rax
	mov rax, rcx
	push rax
	mov rax, 0
	push rax
	mov rax, 2
	pop rcx
	sub rcx, rax
	mov rax, rcx
	pop rcx
	mul rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 99999999
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 4
	push rax
	mov rax, 0
	push rax
	mov rax, 2
	pop rcx
	sub rcx, rax
	mov rax, rcx
	pop rcx
	mul rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 0
	push rax
	mov rax, 4
	pop rcx
	sub rcx, rax
	mov rax, rcx
	push rax
	mov rax, 0
	push rax
	mov rax, 2
	pop rcx
	sub rcx, rax
	mov rax, rcx
	pop rcx
	mul rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 0
	push rax
	mov rax, 4
	pop rcx
	sub rcx, rax
	mov rax, rcx
	push rax
	mov rax, 2
	pop rcx
	mul rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 4
	push rax
	mov rax, 2
	pop rcx
	mul rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 4
	push rax
	mov rax, 2
	pop rcx
	mul rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 99999999
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 4
	push rax
	mov rax, 0
	push rax
	mov rax, 2
	pop rcx
	sub rcx, rax
	mov rax, rcx
	pop rcx
	mov rbx, rax
	mov rax, rcx
	mov rcx, rbx
	cqo
	idiv rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 0
	push rax
	mov rax, 4
	pop rcx
	sub rcx, rax
	mov rax, rcx
	push rax
	mov rax, 0
	push rax
	mov rax, 2
	pop rcx
	sub rcx, rax
	mov rax, rcx
	pop rcx
	mov rbx, rax
	mov rax, rcx
	mov rcx, rbx
	cqo
	idiv rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 0
	push rax
	mov rax, 4
	pop rcx
	sub rcx, rax
	mov rax, rcx
	push rax
	mov rax, 2
	pop rcx
	mov rbx, rax
	mov rax, rcx
	mov rcx, rbx
	cqo
	idiv rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 4
	push rax
	mov rax, 2
	pop rcx
	mov rbx, rax
	mov rax, rcx
	mov rcx, rbx
	cqo
	idiv rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 4
	push rax
	mov rax, 2
	pop rcx
	mov rbx, rax
	mov rax, rcx
	mov rcx, rbx
	cqo
	idiv rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 99999999
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	mov rax, 0
	push rax
	mov rax, 4
	pop rcx
	sub rcx, rax
	mov rax, rcx
	mov [rbp-8], rax
	mov rax, 0
	push rax
	mov rax, 1
	pop rcx
	sub rcx, rax
	mov rax, rcx
	mov [rbp-16], rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, [rbp-8]
	push rax
	mov rax, [rbp-16]
	pop rcx
	mov rbx, rax
	mov rax, rcx
	mov rcx, rbx
	cqo
	idiv rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, [rbp-8]
	push rax
	mov rax, 0
	push rax
	mov rax, [rbp-16]
	pop rcx
	sub rcx, rax
	mov rax, rcx
	pop rcx
	mov rbx, rax
	mov rax, rcx
	mov rcx, rbx
	cqo
	idiv rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, [rbp-8]
	push rax
	mov rax, 1
	push rax
	mov rax, [rbp-16]
	pop rcx
	sub rcx, rax
	mov rax, rcx
	pop rcx
	mov rbx, rax
	mov rax, rcx
	mov rcx, rbx
	cqo
	idiv rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rax
	push rbx
	push rcx
	push rdx
	mov rax, 0
	push rax
	mov rax, [rbp-8]
	pop rcx
	sub rcx, rax
	mov rax, rcx
	push rax
	mov rax, 1
	push rax
	mov rax, [rbp-16]
	pop rcx
	sub rcx, rax
	mov rax, rcx
	pop rcx
	mov rbx, rax
	mov rax, rcx
	mov rcx, rbx
	cqo
	idiv rcx
	mov rdi, formatNum
	mov rsi, rax
	xor rax, rax
	call printf wrt ..plt
	pop rdx
	pop rcx
	pop rbx
	pop rax
	pop rax
	pop rax
	pop rax
	mov rsp, rbp
	pop rbp
	section .rodata
formatNum:	db '%ld', 10, 0
