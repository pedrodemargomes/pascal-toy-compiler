	.file "fibonacci.pas"
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
# [fibonacci.pas]
# [3] begin
	pushq	%rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-16(%rsp),%rsp
	movq	%rbx,-8(%rbp)
	call	FPC_INITIALIZEUNITS
# [4] f1 := 1;
	movw	$1,U_$P$FIBONACCI_$$_F1
# [5] f2 := 1;
	movw	$1,U_$P$FIBONACCI_$$_F2
# [6] count := 0;
	movw	$0,U_$P$FIBONACCI_$$_COUNT
# [7] while count < 100 do
	jmp	.Lj10
	.balign 8,0x90
.Lj9:
# [9] aux := f2;
	movw	U_$P$FIBONACCI_$$_F2,%ax
	movw	%ax,U_$P$FIBONACCI_$$_AUX
# [10] f2 := f1 + f2;
	movswl	U_$P$FIBONACCI_$$_F1,%eax
	movswl	U_$P$FIBONACCI_$$_F2,%edx
	leal	(%eax,%edx),%eax
	movw	%ax,U_$P$FIBONACCI_$$_F2
# [11] f1 := aux;
	movw	U_$P$FIBONACCI_$$_AUX,%ax
	movw	%ax,U_$P$FIBONACCI_$$_F1
# [12] writeln(f2);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$FIBONACCI_$$_F2,%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [13] count := count + 1;
	movswl	U_$P$FIBONACCI_$$_COUNT,%eax
	leal	1(%eax),%eax
	movw	%ax,U_$P$FIBONACCI_$$_COUNT
.Lj10:
	cmpw	$100,U_$P$FIBONACCI_$$_COUNT
	jl	.Lj9
	jmp	.Lj11
.Lj11:
# [15] end.
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
# [2] var f1, f2, aux, count : integer;
	.type U_$P$FIBONACCI_$$_F1,@object
	.size U_$P$FIBONACCI_$$_F1,2
U_$P$FIBONACCI_$$_F1:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$FIBONACCI_$$_F2,@object
	.size U_$P$FIBONACCI_$$_F2,2
U_$P$FIBONACCI_$$_F2:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$FIBONACCI_$$_AUX,@object
	.size U_$P$FIBONACCI_$$_AUX,2
U_$P$FIBONACCI_$$_AUX:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$FIBONACCI_$$_COUNT,@object
	.size U_$P$FIBONACCI_$$_COUNT,2
U_$P$FIBONACCI_$$_COUNT:
	.zero 2

.section .data.n_INITFINAL
	.balign 8
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.quad	1,0
	.quad	INIT$_$SYSTEM
	.quad	0
# [16] 
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

