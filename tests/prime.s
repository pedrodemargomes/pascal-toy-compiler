	.file "prime.pas"
# Begin asmlist al_procedures

.section .text.n_main
	.balign 16,0x90
.globl	PASCALMAIN
	.type	PASCALMAIN,@function
PASCALMAIN:
.globl	main
	.type	main,@function
main:
.Lc1:
# Temps allocated between rbp-8 and rbp+0
# [prime.pas]
# [3] begin
	pushq	%rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-16(%rsp),%rsp
	movq	%rbx,-8(%rbp)
	call	FPC_INITIALIZEUNITS
# [4] count := 0;
	movw	$0,U_$P$PRIME_$$_COUNT
# [5] p := 2;
	movw	$2,U_$P$PRIME_$$_P
# [6] while count < 100 do
	jmp	.Lj8
	.balign 8,0x90
.Lj7:
# [8] c := 2;
	movw	$2,U_$P$PRIME_$$_C
# [9] while p mod c > 0 do
	jmp	.Lj13
	.balign 8,0x90
.Lj12:
# [11] c := c + 1;
	movswl	U_$P$PRIME_$$_C,%eax
	leal	1(%eax),%eax
	movw	%ax,U_$P$PRIME_$$_C
.Lj13:
	movswq	U_$P$PRIME_$$_P,%rax
	movswq	U_$P$PRIME_$$_C,%rcx
	cqto
	idivq	%rcx
	cmpq	$0,%rdx
	jg	.Lj12
	jmp	.Lj14
.Lj14:
# [13] if p - c > 0 then
	movswq	U_$P$PRIME_$$_P,%rax
	movswq	U_$P$PRIME_$$_C,%rdx
	subq	%rdx,%rax
	cmpq	$0,%rax
	jg	.Lj17
	jmp	.Lj18
.Lj17:
# [15] c := 8787;
	movw	$8787,U_$P$PRIME_$$_C
	jmp	.Lj21
.Lj18:
# [19] writeln(p);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$PRIME_$$_P,%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [20] count := count + 1;
	movswl	U_$P$PRIME_$$_COUNT,%eax
	leal	1(%eax),%eax
	movw	%ax,U_$P$PRIME_$$_COUNT
.Lj21:
# [22] p := p + 1;
	movswl	U_$P$PRIME_$$_P,%eax
	leal	1(%eax),%eax
	movw	%ax,U_$P$PRIME_$$_P
.Lj8:
	cmpw	$100,U_$P$PRIME_$$_COUNT
	jl	.Lj7
	jmp	.Lj9
.Lj9:
# [24] end.
	call	FPC_DO_EXIT
	movq	-8(%rbp),%rbx
	leave
	ret
.Lc2:
.Le0:
	.size	main, .Le0 - main

.section .text
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 2
# [2] var p, c, count : integer;
	.type U_$P$PRIME_$$_P,@object
	.size U_$P$PRIME_$$_P,2
U_$P$PRIME_$$_P:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$PRIME_$$_C,@object
	.size U_$P$PRIME_$$_C,2
U_$P$PRIME_$$_C:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$PRIME_$$_COUNT,@object
	.size U_$P$PRIME_$$_COUNT,2
U_$P$PRIME_$$_COUNT:
	.zero 2

.section .data.n_INITFINAL
	.balign 8
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.quad	1,0
	.quad	INIT$_$SYSTEM
	.quad	0
# [25] 
.Le1:
	.size	INITFINAL, .Le1 - INITFINAL

.section .data.n_FPC_THREADVARTABLES
	.balign 8
.globl	FPC_THREADVARTABLES
	.type	FPC_THREADVARTABLES,@object
FPC_THREADVARTABLES:
	.long	1
	.quad	THREADVARLIST_$SYSTEM
.Le2:
	.size	FPC_THREADVARTABLES, .Le2 - FPC_THREADVARTABLES

.section .data.n_FPC_RESOURCESTRINGTABLES
	.balign 8
.globl	FPC_RESOURCESTRINGTABLES
	.type	FPC_RESOURCESTRINGTABLES,@object
FPC_RESOURCESTRINGTABLES:
	.quad	0
.Le3:
	.size	FPC_RESOURCESTRINGTABLES, .Le3 - FPC_RESOURCESTRINGTABLES

.section .data.n_FPC_WIDEINITTABLES
	.balign 8
.globl	FPC_WIDEINITTABLES
	.type	FPC_WIDEINITTABLES,@object
FPC_WIDEINITTABLES:
	.quad	0
.Le4:
	.size	FPC_WIDEINITTABLES, .Le4 - FPC_WIDEINITTABLES

.section .data.n_FPC_RESSTRINITTABLES
	.balign 8
.globl	FPC_RESSTRINITTABLES
	.type	FPC_RESSTRINITTABLES,@object
FPC_RESSTRINITTABLES:
	.quad	0
.Le5:
	.size	FPC_RESSTRINITTABLES, .Le5 - FPC_RESSTRINITTABLES

.section .fpc.n_version
	.balign 8
	.ascii	"FPC 3.0.4+dfsg-18ubuntu2 [2018/08/29] for x86_64 - "
	.ascii	"Linux"

.section .data.n___stklen
	.balign 8
.globl	__stklen
	.type	__stklen,@object
__stklen:
	.quad	8388608

.section .data.n___heapsize
	.balign 8
.globl	__heapsize
	.type	__heapsize,@object
__heapsize:
	.quad	0

.section .data.n___fpc_valgrind
.globl	__fpc_valgrind
	.type	__fpc_valgrind,@object
__fpc_valgrind:
	.byte	0

.section .data.n_FPC_RESLOCATION
	.balign 8
.globl	FPC_RESLOCATION
	.type	FPC_RESLOCATION,@object
FPC_RESLOCATION:
	.quad	0
# End asmlist al_globals
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc6:
	.long	.Lc8-.Lc7
.Lc7:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	16
	.byte	12
	.uleb128	7
	.uleb128	8
	.byte	5
	.uleb128	16
	.uleb128	2
	.balign 4,0
.Lc8:
	.long	.Lc10-.Lc9
.Lc9:
	.quad	.Lc6
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.byte	4
	.long	.Lc3-.Lc1
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc4-.Lc3
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc5-.Lc4
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc10:
# End asmlist al_dwarf_frame
.section .note.GNU-stack,"",%progbits

