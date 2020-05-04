	.file "procedure4.pas"
# Begin asmlist al_procedures

.section .text.n_p$procedurevar_$$_proda
	.balign 16,0x90
.globl	P$PROCEDUREVAR_$$_PRODA
	.type	P$PROCEDUREVAR_$$_PRODA,@function
P$PROCEDUREVAR_$$_PRODA:
.Lc1:
# Temps allocated between rbp-24 and rbp-16
# [procedure4.pas]
# [17] begin
	pushq	%rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-32(%rsp),%rsp
	movq	%rbx,-24(%rbp)
# Var a_prodA located at rbp-4, size=OS_S16
# Var a located at rbp-8, size=OS_S16
# Var b located at rbp-12, size=OS_S16
# Var c located at rbp-16, size=OS_S16
# [18] a_prodA := 10;
	movw	$10,-4(%rbp)
# [19] a_global := a_global + 1;
	movswl	U_$P$PROCEDUREVAR_$$_A_GLOBAL,%eax
	leal	1(%eax),%eax
	movw	%ax,U_$P$PROCEDUREVAR_$$_A_GLOBAL
# [20] prodB;
	movq	%rbp,%rdi
	call	P$PROCEDUREVAR$_$PRODA_$$_PRODB
# [21] writeln(a_prodA);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	-4(%rbp),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [22] end;
	movq	-24(%rbp),%rbx
	leave
	ret
.Lc2:
.Le0:
	.size	P$PROCEDUREVAR_$$_PRODA, .Le0 - P$PROCEDUREVAR_$$_PRODA

.section .text.n_p$procedurevar$_$proda_$$_prodb
	.balign 16,0x90
.globl	P$PROCEDUREVAR$_$PRODA_$$_PRODB
	.type	P$PROCEDUREVAR$_$PRODA_$$_PRODB,@function
P$PROCEDUREVAR$_$PRODA_$$_PRODB:
.Lc6:
# [12] begin
	pushq	%rbp
.Lc8:
.Lc9:
	movq	%rsp,%rbp
.Lc10:
	leaq	-16(%rsp),%rsp
# Var $parentfp located at rbp-8, size=OS_64
	movq	%rdi,-8(%rbp)
# [13] a_prodA := a_prodA + 1;
	movq	-8(%rbp),%rax
	movswl	-4(%rax),%eax
	leal	1(%eax),%eax
	movq	-8(%rbp),%rdx
	movw	%ax,-4(%rdx)
# [14] a_global := a_global + 1;
	movswl	U_$P$PROCEDUREVAR_$$_A_GLOBAL,%eax
	leal	1(%eax),%eax
	movw	%ax,U_$P$PROCEDUREVAR_$$_A_GLOBAL
# [15] prodC;
	movq	%rbp,%rdi
	call	P$PROCEDUREVAR$_$PRODA_PRODB_$$_PRODC
# [16] end;
	leave
	ret
.Lc7:
.Le1:
	.size	P$PROCEDUREVAR$_$PRODA_$$_PRODB, .Le1 - P$PROCEDUREVAR$_$PRODA_$$_PRODB

.section .text.n_p$procedurevar$_$proda_prodb_$$_prodc
	.balign 16,0x90
.globl	P$PROCEDUREVAR$_$PRODA_PRODB_$$_PRODC
	.type	P$PROCEDUREVAR$_$PRODA_PRODB_$$_PRODC,@function
P$PROCEDUREVAR$_$PRODA_PRODB_$$_PRODC:
.Lc11:
# [8] begin
	pushq	%rbp
.Lc13:
.Lc14:
	movq	%rsp,%rbp
.Lc15:
	leaq	-16(%rsp),%rsp
# Var $parentfp located at rbp-8, size=OS_64
	movq	%rdi,-8(%rbp)
# [9] a_prodA := a_prodA + 1;
	movq	-8(%rbp),%rax
	movq	-8(%rax),%rax
	movswl	-4(%rax),%eax
	leal	1(%eax),%eax
	movq	-8(%rbp),%rdx
	movq	-8(%rdx),%rdx
	movw	%ax,-4(%rdx)
# [10] a_global := a_global + 1;
	movswl	U_$P$PROCEDUREVAR_$$_A_GLOBAL,%eax
	leal	1(%eax),%eax
	movw	%ax,U_$P$PROCEDUREVAR_$$_A_GLOBAL
# [11] end;
	leave
	ret
.Lc12:
.Le2:
	.size	P$PROCEDUREVAR$_$PRODA_PRODB_$$_PRODC, .Le2 - P$PROCEDUREVAR$_$PRODA_PRODB_$$_PRODC

.section .text.n_main
	.balign 16,0x90
.globl	PASCALMAIN
	.type	PASCALMAIN,@function
PASCALMAIN:
.globl	main
	.type	main,@function
main:
.Lc16:
# Temps allocated between rbp-8 and rbp+0
# [24] begin
	pushq	%rbp
.Lc18:
.Lc19:
	movq	%rsp,%rbp
.Lc20:
	leaq	-16(%rsp),%rsp
	movq	%rbx,-8(%rbp)
	call	FPC_INITIALIZEUNITS
# [25] a_global := 10;
	movw	$10,U_$P$PROCEDUREVAR_$$_A_GLOBAL
# [26] prodA;
	call	P$PROCEDUREVAR_$$_PRODA
# [27] writeln(a_global);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$PROCEDUREVAR_$$_A_GLOBAL,%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [28] end.
	call	FPC_DO_EXIT
	movq	-8(%rbp),%rbx
	leave
	ret
.Lc17:
.Le3:
	.size	main, .Le3 - main

.section .text
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 2
# [2] var a_global : integer;
	.type U_$P$PROCEDUREVAR_$$_A_GLOBAL,@object
	.size U_$P$PROCEDUREVAR_$$_A_GLOBAL,2
U_$P$PROCEDUREVAR_$$_A_GLOBAL:
	.zero 2

.section .data.n_INITFINAL
	.balign 8
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.quad	1,0
	.quad	INIT$_$SYSTEM
	.quad	0
# [30] 
.Le4:
	.size	INITFINAL, .Le4 - INITFINAL

.section .data.n_FPC_THREADVARTABLES
	.balign 8
.globl	FPC_THREADVARTABLES
	.type	FPC_THREADVARTABLES,@object
FPC_THREADVARTABLES:
	.long	1
	.quad	THREADVARLIST_$SYSTEM
.Le5:
	.size	FPC_THREADVARTABLES, .Le5 - FPC_THREADVARTABLES

.section .data.n_FPC_RESOURCESTRINGTABLES
	.balign 8
.globl	FPC_RESOURCESTRINGTABLES
	.type	FPC_RESOURCESTRINGTABLES,@object
FPC_RESOURCESTRINGTABLES:
	.quad	0
.Le6:
	.size	FPC_RESOURCESTRINGTABLES, .Le6 - FPC_RESOURCESTRINGTABLES

.section .data.n_FPC_WIDEINITTABLES
	.balign 8
.globl	FPC_WIDEINITTABLES
	.type	FPC_WIDEINITTABLES,@object
FPC_WIDEINITTABLES:
	.quad	0
.Le7:
	.size	FPC_WIDEINITTABLES, .Le7 - FPC_WIDEINITTABLES

.section .data.n_FPC_RESSTRINITTABLES
	.balign 8
.globl	FPC_RESSTRINITTABLES
	.type	FPC_RESSTRINITTABLES,@object
FPC_RESSTRINITTABLES:
	.quad	0
.Le8:
	.size	FPC_RESSTRINITTABLES, .Le8 - FPC_RESSTRINITTABLES

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
.Lc21:
	.long	.Lc23-.Lc22
.Lc22:
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
.Lc23:
	.long	.Lc25-.Lc24
.Lc24:
	.quad	.Lc21
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
.Lc25:
	.long	.Lc27-.Lc26
.Lc26:
	.quad	.Lc21
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
.Lc27:
	.long	.Lc29-.Lc28
.Lc28:
	.quad	.Lc21
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
.Lc29:
	.long	.Lc31-.Lc30
.Lc30:
	.quad	.Lc21
	.quad	.Lc16
	.quad	.Lc17-.Lc16
	.byte	4
	.long	.Lc18-.Lc16
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc19-.Lc18
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc20-.Lc19
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc31:
# End asmlist al_dwarf_frame
.section .note.GNU-stack,"",%progbits

