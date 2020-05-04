	.file "procedure3.pas"
# Begin asmlist al_procedures

.section .text.n_p$procedurevar_$$_proda$crc4414b449
	.balign 16,0x90
.globl	P$PROCEDUREVAR_$$_PRODA$crc4414B449
	.type	P$PROCEDUREVAR_$$_PRODA$crc4414B449,@function
P$PROCEDUREVAR_$$_PRODA$crc4414B449:
.Lc1:
# Temps allocated between rbp-64 and rbp-56
# [procedure3.pas]
# [10] begin
	pushq	%rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-64(%rsp),%rsp
	movq	%rbx,-64(%rbp)
# Var a located at rbp-8, size=OS_S16
# Var b located at rbp-16, size=OS_S16
# Var c located at rbp-24, size=OS_S16
# Var d located at rbp-32, size=OS_S16
# Var e located at rbp-40, size=OS_S16
# Var f located at rbp-48, size=OS_S16
# Var g located at rbp+16, size=OS_S16
# Var h located at rbp+24, size=OS_S16
# Var i located at rbp+32, size=OS_S16
# Var j located at rbp+40, size=OS_S16
# Var k located at rbp+48, size=OS_S16
# Var l located at rbp+56, size=OS_S16
# Var m located at rbp+64, size=OS_S16
# Var n located at rbp+72, size=OS_S16
# Var o located at rbp+80, size=OS_S16
# Var p located at rbp+88, size=OS_S16
# Var q located at rbp+96, size=OS_S16
# Var r located at rbp+104, size=OS_S16
# Var bb located at rbp-52, size=OS_S16
# Var cc located at rbp-56, size=OS_S16
	movw	%di,-8(%rbp)
	movw	%si,-16(%rbp)
	movw	%dx,-24(%rbp)
	movw	%cx,-32(%rbp)
	movw	%r8w,-40(%rbp)
	movw	%r9w,-48(%rbp)
# [11] a := 44;
	movw	$44,-8(%rbp)
# [12] bb := 45;
	movw	$45,-52(%rbp)
# [13] cc := 46;
	movw	$46,-56(%rbp)
# [14] writeln(a);
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
# [15] writeln(b);
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
# [16] writeln(c);
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
# [17] prodB(a);
	movswl	-8(%rbp),%esi
	movq	%rbp,%rdi
	call	P$PROCEDUREVAR$_$PRODA$crc4414B449_$$_PRODB$SMALLINT
# [18] writeln(a);
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
# [19] end;
	movq	-64(%rbp),%rbx
	leave
	ret
.Lc2:
.Le0:
	.size	P$PROCEDUREVAR_$$_PRODA$crc4414B449, .Le0 - P$PROCEDUREVAR_$$_PRODA$crc4414B449

.section .text.n_p$procedurevar$_$proda$crc4414b449_$$_prodb$smallint
	.balign 16,0x90
.globl	P$PROCEDUREVAR$_$PRODA$crc4414B449_$$_PRODB$SMALLINT
	.type	P$PROCEDUREVAR$_$PRODA$crc4414B449_$$_PRODB$SMALLINT,@function
P$PROCEDUREVAR$_$PRODA$crc4414B449_$$_PRODB$SMALLINT:
.Lc6:
# [6] begin
	pushq	%rbp
.Lc8:
.Lc9:
	movq	%rsp,%rbp
.Lc10:
	leaq	-16(%rsp),%rsp
# Var a located at rbp-8, size=OS_S16
# Var $parentfp located at rbp-16, size=OS_64
	movq	%rdi,-16(%rbp)
	movw	%si,-8(%rbp)
# [7] a := 666;
	movw	$666,-8(%rbp)
# [8] end;
	leave
	ret
.Lc7:
.Le1:
	.size	P$PROCEDUREVAR$_$PRODA$crc4414B449_$$_PRODB$SMALLINT, .Le1 - P$PROCEDUREVAR$_$PRODA$crc4414B449_$$_PRODB$SMALLINT

.section .text.n_p$procedurevar_$$_prodc$smallint$smallint
	.balign 16,0x90
.globl	P$PROCEDUREVAR_$$_PRODC$SMALLINT$SMALLINT
	.type	P$PROCEDUREVAR_$$_PRODC$SMALLINT$SMALLINT,@function
P$PROCEDUREVAR_$$_PRODC$SMALLINT$SMALLINT:
.Lc11:
# Temps allocated between rbp-24 and rbp-16
# [22] begin
	pushq	%rbp
.Lc13:
.Lc14:
	movq	%rsp,%rbp
.Lc15:
	leaq	-32(%rsp),%rsp
	movq	%rbx,-24(%rbp)
# Var a located at rbp-8, size=OS_S16
# Var b located at rbp-16, size=OS_S16
	movw	%di,-8(%rbp)
	movw	%si,-16(%rbp)
# [23] writeln(a+b);
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	-8(%rbp),%rax
	movswq	-16(%rbp),%rdx
	leaq	(%rax,%rdx),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [24] end;
	movq	-24(%rbp),%rbx
	leave
	ret
.Lc12:
.Le2:
	.size	P$PROCEDUREVAR_$$_PRODC$SMALLINT$SMALLINT, .Le2 - P$PROCEDUREVAR_$$_PRODC$SMALLINT$SMALLINT

.section .text.n_main
	.balign 16,0x90
.globl	PASCALMAIN
	.type	PASCALMAIN,@function
PASCALMAIN:
.globl	main
	.type	main,@function
main:
.Lc16:
# [26] begin
	pushq	%rbp
.Lc18:
.Lc19:
	movq	%rsp,%rbp
.Lc20:
	leaq	-192(%rsp),%rsp
	call	FPC_INITIALIZEUNITS
# [27] prodA(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18);
	movl	$18,88(%rsp)
	movl	$17,80(%rsp)
	movl	$16,72(%rsp)
	movl	$15,64(%rsp)
	movl	$14,56(%rsp)
	movl	$13,48(%rsp)
	movl	$12,40(%rsp)
	movl	$11,32(%rsp)
	movl	$10,24(%rsp)
	movl	$9,16(%rsp)
	movl	$8,8(%rsp)
	movl	$7,(%rsp)
	movl	$6,%eax
	movl	$5,%r8d
	movl	$4,%ecx
	movl	$3,%edx
	movl	$2,%esi
	movl	$1,%edi
	movl	%eax,%r9d
	call	P$PROCEDUREVAR_$$_PRODA$crc4414B449
# [28] prodC(10,10);
	movl	$10,%esi
	movl	$10,%edi
	call	P$PROCEDUREVAR_$$_PRODC$SMALLINT$SMALLINT
# [29] end.
	call	FPC_DO_EXIT
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
# [2] var a : integer;
	.type U_$P$PROCEDUREVAR_$$_A,@object
	.size U_$P$PROCEDUREVAR_$$_A,2
U_$P$PROCEDUREVAR_$$_A:
	.zero 2

.section .data.n_INITFINAL
	.balign 8
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.quad	1,0
	.quad	INIT$_$SYSTEM
	.quad	0
# [31] 
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

