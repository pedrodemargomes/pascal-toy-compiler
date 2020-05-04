	.file "procedure2.pas"
# Begin asmlist al_procedures

.section .text.n_p$procedure__$$_proc_a$smallint$smallint$smallint$smallint
	.balign 16,0x90
.globl	P$PROCEDURE__$$_PROC_A$SMALLINT$SMALLINT$SMALLINT$SMALLINT
	.type	P$PROCEDURE__$$_PROC_A$SMALLINT$SMALLINT$SMALLINT$SMALLINT,@function
P$PROCEDURE__$$_PROC_A$SMALLINT$SMALLINT$SMALLINT$SMALLINT:
.Lc1:
# Temps allocated between rbp-40 and rbp-32
# [procedure2.pas]
# [5] begin
	pushq	%rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-48(%rsp),%rsp
	movq	%rbx,-40(%rbp)
# Var a located at rbp-8, size=OS_S16
# Var b located at rbp-16, size=OS_S16
# Var c located at rbp-24, size=OS_S16
# Var d located at rbp-32, size=OS_S16
	movw	%di,-8(%rbp)
	movw	%si,-16(%rbp)
	movw	%dx,-24(%rbp)
	movw	%cx,-32(%rbp)
# [6] writeln(a);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	-8(%rbp),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [7] writeln(b);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	-16(%rbp),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [8] writeln(c);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	-24(%rbp),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [9] writeln(d);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	-32(%rbp),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [10] a := 666;
	movw	$666,-8(%rbp)
# [11] end;
	movq	-40(%rbp),%rbx
	leave
	ret
.Lc2:
.Le0:
	.size	P$PROCEDURE__$$_PROC_A$SMALLINT$SMALLINT$SMALLINT$SMALLINT, .Le0 - P$PROCEDURE__$$_PROC_A$SMALLINT$SMALLINT$SMALLINT$SMALLINT

.section .text.n_p$procedure__$$_proc_b$smallint$smallint
	.balign 16,0x90
.globl	P$PROCEDURE__$$_PROC_B$SMALLINT$SMALLINT
	.type	P$PROCEDURE__$$_PROC_B$SMALLINT$SMALLINT,@function
P$PROCEDURE__$$_PROC_B$SMALLINT$SMALLINT:
.Lc6:
# Temps allocated between rbp-24 and rbp-16
# [14] begin
	pushq	%rbp
.Lc8:
.Lc9:
	movq	%rsp,%rbp
.Lc10:
	leaq	-32(%rsp),%rsp
	movq	%rbx,-24(%rbp)
# Var a located at rbp-8, size=OS_S16
# Var b located at rbp-16, size=OS_S16
	movw	%di,-8(%rbp)
	movw	%si,-16(%rbp)
# [15] writeln(a);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	-8(%rbp),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [16] a := 564;
	movw	$564,-8(%rbp)
# [17] writeln(b);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	-16(%rbp),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [18] end;
	movq	-24(%rbp),%rbx
	leave
	ret
.Lc7:
.Le1:
	.size	P$PROCEDURE__$$_PROC_B$SMALLINT$SMALLINT, .Le1 - P$PROCEDURE__$$_PROC_B$SMALLINT$SMALLINT

.section .text.n_main
	.balign 16,0x90
.globl	PASCALMAIN
	.type	PASCALMAIN,@function
PASCALMAIN:
.globl	main
	.type	main,@function
main:
.Lc11:
# Temps allocated between rbp-8 and rbp+0
# [20] begin
	pushq	%rbp
.Lc13:
.Lc14:
	movq	%rsp,%rbp
.Lc15:
	leaq	-16(%rsp),%rsp
	movq	%rbx,-8(%rbp)
	call	FPC_INITIALIZEUNITS
# [21] a := 12;
	movw	$12,U_$P$PROCEDURE__$$_A
# [22] proc_a(1,2,3,4);
	movl	$4,%eax
	movl	$3,%edx
	movl	$2,%esi
	movl	$1,%edi
	movl	%eax,%ecx
	call	P$PROCEDURE__$$_PROC_A$SMALLINT$SMALLINT$SMALLINT$SMALLINT
# [23] proc_b(5,6);
	movl	$6,%esi
	movl	$5,%edi
	call	P$PROCEDURE__$$_PROC_B$SMALLINT$SMALLINT
# [24] writeln(a);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$PROCEDURE__$$_A,%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [25] end.
	call	FPC_DO_EXIT
	movq	-8(%rbp),%rbx
	leave
	ret
.Lc12:
.Le2:
	.size	main, .Le2 - main

.section .text
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 2
# [2] var a, b, c, d : integer;
	.type U_$P$PROCEDURE__$$_A,@object
	.size U_$P$PROCEDURE__$$_A,2
U_$P$PROCEDURE__$$_A:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$PROCEDURE__$$_B,@object
	.size U_$P$PROCEDURE__$$_B,2
U_$P$PROCEDURE__$$_B:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$PROCEDURE__$$_C,@object
	.size U_$P$PROCEDURE__$$_C,2
U_$P$PROCEDURE__$$_C:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$PROCEDURE__$$_D,@object
	.size U_$P$PROCEDURE__$$_D,2
U_$P$PROCEDURE__$$_D:
	.zero 2

.section .data.n_INITFINAL
	.balign 8
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.quad	1,0
	.quad	INIT$_$SYSTEM
	.quad	0
# [27] 
.Le3:
	.size	INITFINAL, .Le3 - INITFINAL

.section .data.n_FPC_THREADVARTABLES
	.balign 8
.globl	FPC_THREADVARTABLES
	.type	FPC_THREADVARTABLES,@object
FPC_THREADVARTABLES:
	.long	1
	.quad	THREADVARLIST_$SYSTEM
.Le4:
	.size	FPC_THREADVARTABLES, .Le4 - FPC_THREADVARTABLES

.section .data.n_FPC_RESOURCESTRINGTABLES
	.balign 8
.globl	FPC_RESOURCESTRINGTABLES
	.type	FPC_RESOURCESTRINGTABLES,@object
FPC_RESOURCESTRINGTABLES:
	.quad	0
.Le5:
	.size	FPC_RESOURCESTRINGTABLES, .Le5 - FPC_RESOURCESTRINGTABLES

.section .data.n_FPC_WIDEINITTABLES
	.balign 8
.globl	FPC_WIDEINITTABLES
	.type	FPC_WIDEINITTABLES,@object
FPC_WIDEINITTABLES:
	.quad	0
.Le6:
	.size	FPC_WIDEINITTABLES, .Le6 - FPC_WIDEINITTABLES

.section .data.n_FPC_RESSTRINITTABLES
	.balign 8
.globl	FPC_RESSTRINITTABLES
	.type	FPC_RESSTRINITTABLES,@object
FPC_RESSTRINITTABLES:
	.quad	0
.Le7:
	.size	FPC_RESSTRINITTABLES, .Le7 - FPC_RESSTRINITTABLES

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
.Lc16:
	.long	.Lc18-.Lc17
.Lc17:
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
.Lc18:
	.long	.Lc20-.Lc19
.Lc19:
	.quad	.Lc16
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
.Lc20:
	.long	.Lc22-.Lc21
.Lc21:
	.quad	.Lc16
	.quad	.Lc6
	.quad	.Lc7-.Lc6
	.byte	4
	.long	.Lc8-.Lc6
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc9-.Lc8
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc10-.Lc9
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc22:
	.long	.Lc24-.Lc23
.Lc23:
	.quad	.Lc16
	.quad	.Lc11
	.quad	.Lc12-.Lc11
	.byte	4
	.long	.Lc13-.Lc11
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc14-.Lc13
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc15-.Lc14
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc24:
# End asmlist al_dwarf_frame
.section .note.GNU-stack,"",%progbits

