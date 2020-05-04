	.file "expression.pas"
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
# Temps allocated between rbp-48 and rbp-16
# [expression.pas]
# [3] begin
	pushq	%rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-64(%rsp),%rsp
	movq	%rbx,-48(%rbp)
	call	FPC_INITIALIZEUNITS
# [4] b := 2;
	movw	$2,U_$P$EXPRESSION_$$_B
# [5] a := (b-4)*((2)+2*(2-1*2));
	movswl	U_$P$EXPRESSION_$$_B,%eax
	leal	-4(%eax),%eax
	shll	$1,%eax
	movw	%ax,U_$P$EXPRESSION_$$_A
# [6] writeln((b-4)*((2)+2*(2-1*2))); (*-4*)
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$EXPRESSION_$$_B,%rax
	leaq	-4(%rax),%rdx
	shlq	$1,%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [7] writeln(a); (*-4*)
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$EXPRESSION_$$_A,%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [8] writeln(0-99); (*-99*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$-99,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [9] writeln(b-2); (*0*)
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$EXPRESSION_$$_B,%rax
	leaq	-2(%rax),%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [10] writeln((1-3)*(0-2)); (*4*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$4,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [12] writeln(99999999);
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$99999999,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [14] writeln(4*(0-2)); (*-8*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$-8,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [15] writeln((0-4)*(0-2)); (*8*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$8,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [16] writeln((0-4)*2); (*-8*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$-8,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [17] writeln(4*2); (*8*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$8,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [18] writeln((4)*(2)); (*8*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$8,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [20] writeln(99999999);
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$99999999,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [22] writeln(4/(0-2)); (*-2*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$EXPRESSION$_Ld1,%rax
	movq	%rax,(%rsp)
	movw	_$EXPRESSION$_Ld1+8,%ax
	movw	%ax,8(%rsp)
	movq	%rbx,%rcx
	movl	$-32767,%edx
	movl	$-1,%esi
	movl	$1,%edi
	call	fpc_write_text_float
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [23] writeln((0-4)/(0-2)); (*2*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$EXPRESSION$_Ld2,%rax
	movq	%rax,(%rsp)
	movw	_$EXPRESSION$_Ld2+8,%ax
	movw	%ax,8(%rsp)
	movq	%rbx,%rcx
	movl	$-32767,%edx
	movl	$-1,%esi
	movl	$1,%edi
	call	fpc_write_text_float
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [24] writeln((0-4)/2); (*-2*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$EXPRESSION$_Ld1,%rax
	movq	%rax,(%rsp)
	movw	_$EXPRESSION$_Ld1+8,%ax
	movw	%ax,8(%rsp)
	movq	%rbx,%rcx
	movl	$-32767,%edx
	movl	$-1,%esi
	movl	$1,%edi
	call	fpc_write_text_float
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [25] writeln(4/2); (*2*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$EXPRESSION$_Ld2,%rax
	movq	%rax,(%rsp)
	movw	_$EXPRESSION$_Ld2+8,%ax
	movw	%ax,8(%rsp)
	movq	%rbx,%rcx
	movl	$-32767,%edx
	movl	$-1,%esi
	movl	$1,%edi
	call	fpc_write_text_float
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [26] writeln((4)/(2)); (*2*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	_$EXPRESSION$_Ld2,%rax
	movq	%rax,(%rsp)
	movw	_$EXPRESSION$_Ld2+8,%ax
	movw	%ax,8(%rsp)
	movq	%rbx,%rcx
	movl	$-32767,%edx
	movl	$-1,%esi
	movl	$1,%edi
	call	fpc_write_text_float
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [28] writeln(99999999);
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$99999999,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [30] b := 0-4;
	movw	$-4,U_$P$EXPRESSION_$$_B
# [31] c := 0-1;
	movw	$-1,U_$P$EXPRESSION_$$_C
# [32] writeln(b/c); (*4*)
	call	fpc_get_output
	movq	%rax,%rbx
	movswl	U_$P$EXPRESSION_$$_B,%eax
	cvtsi2sd	%eax,%xmm0
	movswl	U_$P$EXPRESSION_$$_C,%eax
	cvtsi2sd	%eax,%xmm1
	divsd	%xmm1,%xmm0
	movsd	%xmm0,-24(%rbp)
	fldl	-24(%rbp)
	fstpt	(%rsp)
	movq	%rbx,%rcx
	movl	$-32767,%edx
	movl	$-1,%esi
	movl	$1,%edi
	call	fpc_write_text_float
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [33] writeln(b/(0-c)); (*-4*)
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$EXPRESSION_$$_C,%rax
	negq	%rax
	cvtsi2sd	%rax,%xmm1
	movswl	U_$P$EXPRESSION_$$_B,%eax
	cvtsi2sd	%eax,%xmm0
	divsd	%xmm1,%xmm0
	movsd	%xmm0,-24(%rbp)
	fldl	-24(%rbp)
	fstpt	(%rsp)
	movq	%rbx,%rcx
	movl	$-32767,%edx
	movl	$-1,%esi
	movl	$1,%edi
	call	fpc_write_text_float
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [34] writeln(b/(1-c)); (*-2*)
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$EXPRESSION_$$_C,%rdx
	movq	$1,%rax
	subq	%rdx,%rax
	cvtsi2sd	%rax,%xmm1
	movswl	U_$P$EXPRESSION_$$_B,%eax
	cvtsi2sd	%eax,%xmm0
	divsd	%xmm1,%xmm0
	movsd	%xmm0,-24(%rbp)
	fldl	-24(%rbp)
	fstpt	(%rsp)
	movq	%rbx,%rcx
	movl	$-32767,%edx
	movl	$-1,%esi
	movl	$1,%edi
	call	fpc_write_text_float
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [35] writeln((0-b)/(1-c)); (*2*)
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$EXPRESSION_$$_B,%rax
	negq	%rax
	cvtsi2sd	%rax,%xmm0
	movswq	U_$P$EXPRESSION_$$_C,%rdx
	movq	$1,%rax
	subq	%rdx,%rax
	cvtsi2sd	%rax,%xmm1
	divsd	%xmm1,%xmm0
	movsd	%xmm0,-24(%rbp)
	fldl	-24(%rbp)
	fstpt	(%rsp)
	movq	%rbx,%rcx
	movl	$-32767,%edx
	movl	$-1,%esi
	movl	$1,%edi
	call	fpc_write_text_float
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [37] writeln(99999999);
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$99999999,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [39] a := 9;
	movw	$9,U_$P$EXPRESSION_$$_A
# [40] b := 0-6;
	movw	$-6,U_$P$EXPRESSION_$$_B
# [41] writeln(a); (*9*)
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$EXPRESSION_$$_A,%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [42] writeln(b); (*-6*)
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$EXPRESSION_$$_B,%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [43] c := a;
	movw	U_$P$EXPRESSION_$$_A,%ax
	movw	%ax,U_$P$EXPRESSION_$$_C
# [44] a := b;
	movw	U_$P$EXPRESSION_$$_B,%ax
	movw	%ax,U_$P$EXPRESSION_$$_A
# [45] b := c;
	movw	U_$P$EXPRESSION_$$_C,%ax
	movw	%ax,U_$P$EXPRESSION_$$_B
# [46] writeln(a); (*-6*)
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$EXPRESSION_$$_A,%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [47] writeln(b); (*9*)
	call	fpc_get_output
	movq	%rax,%rbx
	movswq	U_$P$EXPRESSION_$$_B,%rdx
	movq	%rbx,%rsi
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [49] writeln(99999999);
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$99999999,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [51] writeln(5 mod 2); (*1*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$1,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [52] writeln((0-5) mod (0-2)); (*-1*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$-1,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [53] writeln((0-5) mod (2)); (*-1*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$-1,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [54] writeln((5) mod (0-2)); (*1*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$1,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [55] writeln(1+(5+1) mod (2+1)+1); (*2*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$2,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [57] writeln(19 mod 4*100); (*300*)
	call	fpc_get_output
	movq	%rax,%rbx
	movq	%rbx,%rsi
	movq	$300,%rdx
	movl	$0,%edi
	call	fpc_write_text_sint
	call	FPC_IOCHECK
	movq	%rbx,%rdi
	call	fpc_writeln_end
	call	FPC_IOCHECK
# [58] end.
	call	FPC_DO_EXIT
	movq	-48(%rbp),%rbx
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
# [2] Var a, b, c : integer;
	.type U_$P$EXPRESSION_$$_A,@object
	.size U_$P$EXPRESSION_$$_A,2
U_$P$EXPRESSION_$$_A:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$EXPRESSION_$$_B,@object
	.size U_$P$EXPRESSION_$$_B,2
U_$P$EXPRESSION_$$_B:
	.zero 2

.section .bss
	.balign 2
	.type U_$P$EXPRESSION_$$_C,@object
	.size U_$P$EXPRESSION_$$_C,2
U_$P$EXPRESSION_$$_C:
	.zero 2

.section .data.n_INITFINAL
	.balign 8
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.quad	1,0
	.quad	INIT$_$SYSTEM
	.quad	0
# [60] 
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
# Begin asmlist al_typedconsts

.section .rodata.n__$EXPRESSION$_Ld1
	.balign 8
.globl	_$EXPRESSION$_Ld1
_$EXPRESSION$_Ld1:
# value: 0d-2.00000000000000000000E+0000
	.byte	0,0,0,0,0,0,0,128,0,192

.section .rodata.n__$EXPRESSION$_Ld2
	.balign 8
.globl	_$EXPRESSION$_Ld2
_$EXPRESSION$_Ld2:
# value: 0d+2.00000000000000000000E+0000
	.byte	0,0,0,0,0,0,0,128,0,64
# End asmlist al_typedconsts
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

