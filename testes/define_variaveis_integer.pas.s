	global _start
	section .text
_start:
	mov eax, 0
	push eax
	mov eax, 0
	push eax
	mov eax, 0
	push eax
	mov eax, 0
	push eax
	mov dword [ebp+0], 1
	mov dword [ebp+-4], 2
	mov dword [ebp+-8], 3
	mov dword [ebp+-12], 4
	mov dword [ebp+-16], 5
