	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	__Z10init_MultHPv       ## -- Begin function _Z10init_MultHPv
	.p2align	4, 0x90
__Z10init_MultHPv:                      ## @_Z10init_MultHPv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	8(%rdi), %rdi
	callq	__ZN6Matrix8get_rowsEv
	movl	$4, %ecx
	movl	%ecx, %edi
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
                                        ## kill: def $rax killed $eax
	mulq	%rdi
	seto	%sil
	movq	$-1, %rdi
	cmovoq	%rdi, %rax
	movq	%rax, %rdi
	movb	%sil, -29(%rbp)         ## 1-byte Spill
	callq	__Znam
	movq	-16(%rbp), %rdi
	movq	(%rdi), %rdi
	movq	%rax, (%rdi)
	movl	$0, -24(%rbp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jae	LBB0_8
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %ecx
	movl	%ecx, %edx
	movl	$0, (%rax,%rdx,4)
	movl	$0, -28(%rbp)
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	16(%rcx), %eax
	jae	LBB0_6
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=2
	movl	-28(%rbp), %eax
	shll	$1, %eax
	movl	%eax, -28(%rbp)
	movq	-16(%rbp), %rcx
	movq	8(%rcx), %rdi
	movl	-24(%rbp), %esi
	callq	__ZN6MatrixixEj
	movl	-28(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	(%rax), %esi
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movl	-24(%rbp), %edx
	movl	%esi, -36(%rbp)         ## 4-byte Spill
	movl	%edx, %esi
	callq	__ZN6MatrixixEj
	movl	-28(%rbp), %edx
	addl	$1, %edx
	movq	%rax, %rdi
	movl	%edx, %esi
	callq	__ZN5ArrayixEj
	movl	-36(%rbp), %edx         ## 4-byte Reload
	imull	(%rax), %edx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %esi
	movl	%esi, %ecx
	addl	(%rax,%rcx,4), %edx
	movl	%edx, (%rax,%rcx,4)
## %bb.5:                               ##   in Loop: Header=BB0_3 Depth=2
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB0_3
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_7
LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB0_1
LBB0_8:
	xorl	%eax, %eax
                                        ## kill: def $rax killed $eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z10init_MultVPv       ## -- Begin function _Z10init_MultVPv
	.p2align	4, 0x90
__Z10init_MultVPv:                      ## @_Z10init_MultVPv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	8(%rdi), %rdi
	callq	__ZN6Matrix8get_colsEv
	movl	$4, %ecx
	movl	%ecx, %edi
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
                                        ## kill: def $rax killed $eax
	mulq	%rdi
	seto	%sil
	movq	$-1, %rdi
	cmovoq	%rdi, %rax
	movq	%rax, %rdi
	movb	%sil, -29(%rbp)         ## 1-byte Spill
	callq	__Znam
	movq	-16(%rbp), %rdi
	movq	(%rdi), %rdi
	movq	%rax, (%rdi)
	movl	$0, -24(%rbp)
LBB1_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jae	LBB1_8
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %ecx
	movl	%ecx, %edx
	movl	$0, (%rax,%rdx,4)
	movl	$0, -28(%rbp)
LBB1_3:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	16(%rcx), %eax
	jae	LBB1_6
## %bb.4:                               ##   in Loop: Header=BB1_3 Depth=2
	movl	-28(%rbp), %eax
	shll	$1, %eax
	movl	%eax, -28(%rbp)
	movq	-16(%rbp), %rcx
	movq	8(%rcx), %rdi
	movl	-28(%rbp), %esi
	callq	__ZN6MatrixixEj
	movl	-24(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	(%rax), %esi
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movl	-28(%rbp), %edx
	addl	$1, %edx
	movl	%esi, -36(%rbp)         ## 4-byte Spill
	movl	%edx, %esi
	callq	__ZN6MatrixixEj
	movl	-24(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	-36(%rbp), %edx         ## 4-byte Reload
	imull	(%rax), %edx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %esi
	movl	%esi, %ecx
	addl	(%rax,%rcx,4), %edx
	movl	%edx, (%rax,%rcx,4)
## %bb.5:                               ##   in Loop: Header=BB1_3 Depth=2
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB1_3
LBB1_6:                                 ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_7
LBB1_7:                                 ##   in Loop: Header=BB1_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB1_1
LBB1_8:
	xorl	%eax, %eax
                                        ## kill: def $rax killed $eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z12multiply_oddPv     ## -- Begin function _Z12multiply_oddPv
	.p2align	4, 0x90
__Z12multiply_oddPv:                    ## @_Z12multiply_oddPv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	8(%rdi), %rdi
	callq	__ZN6Matrix8get_colsEv
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rdi
	movl	48(%rdi), %eax
	movl	%eax, -24(%rbp)
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
                                        ##       Child Loop BB2_5 Depth 3
	movl	-24(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	52(%rcx), %eax
	jae	LBB2_12
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	$0, -28(%rbp)
LBB2_3:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB2_5 Depth 3
	movl	-28(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jae	LBB2_10
## %bb.4:                               ##   in Loop: Header=BB2_3 Depth=2
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	movl	-24(%rbp), %esi
	callq	__ZN6MatrixixEj
	movq	-16(%rbp), %rdi
	movl	44(%rdi), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	(%rax), %esi
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movq	-16(%rbp), %rax
	movl	44(%rax), %ecx
	movl	%esi, -36(%rbp)         ## 4-byte Spill
	movl	%ecx, %esi
	callq	__ZN6MatrixixEj
	movl	-28(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	-36(%rbp), %ecx         ## 4-byte Reload
	imull	(%rax), %ecx
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movl	-24(%rbp), %esi
	movl	%esi, %edi
	subl	(%rax,%rdi,4), %ecx
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movl	-28(%rbp), %esi
	movl	%esi, %edi
	subl	(%rax,%rdi,4), %ecx
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	movl	-24(%rbp), %esi
	movl	%ecx, -40(%rbp)         ## 4-byte Spill
	callq	__ZN6MatrixixEj
	movl	-28(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	-40(%rbp), %ecx         ## 4-byte Reload
	movl	%ecx, (%rax)
	movl	$0, -32(%rbp)
LBB2_5:                                 ##   Parent Loop BB2_1 Depth=1
                                        ##     Parent Loop BB2_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	-32(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	40(%rcx), %eax
	jae	LBB2_8
## %bb.6:                               ##   in Loop: Header=BB2_5 Depth=3
	movl	-32(%rbp), %eax
	shll	$1, %eax
	movl	%eax, -32(%rbp)
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rdi
	movl	-24(%rbp), %esi
	callq	__ZN6MatrixixEj
	movl	-32(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	(%rax), %esi
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movl	-32(%rbp), %edx
	addl	$1, %edx
	movl	%esi, -44(%rbp)         ## 4-byte Spill
	movl	%edx, %esi
	callq	__ZN6MatrixixEj
	movl	-28(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	-44(%rbp), %edx         ## 4-byte Reload
	addl	(%rax), %edx
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	movl	-24(%rbp), %esi
	movl	%edx, -48(%rbp)         ## 4-byte Spill
	callq	__ZN6MatrixixEj
	movl	-32(%rbp), %edx
	addl	$1, %edx
	movq	%rax, %rdi
	movl	%edx, %esi
	callq	__ZN5ArrayixEj
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movl	-32(%rbp), %esi
	movl	%edx, -52(%rbp)         ## 4-byte Spill
	callq	__ZN6MatrixixEj
	movl	-28(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	-52(%rbp), %edx         ## 4-byte Reload
	addl	(%rax), %edx
	movl	-48(%rbp), %esi         ## 4-byte Reload
	imull	%edx, %esi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	movl	-24(%rbp), %edx
	movl	%esi, -56(%rbp)         ## 4-byte Spill
	movl	%edx, %esi
	callq	__ZN6MatrixixEj
	movl	-28(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	-56(%rbp), %edx         ## 4-byte Reload
	addl	(%rax), %edx
	movl	%edx, (%rax)
## %bb.7:                               ##   in Loop: Header=BB2_5 Depth=3
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB2_5
LBB2_8:                                 ##   in Loop: Header=BB2_3 Depth=2
	jmp	LBB2_9
LBB2_9:                                 ##   in Loop: Header=BB2_3 Depth=2
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB2_3
LBB2_10:                                ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_11
LBB2_11:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB2_1
LBB2_12:
	xorl	%eax, %eax
                                        ## kill: def $rax killed $eax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z13multiply_evenPv    ## -- Begin function _Z13multiply_evenPv
	.p2align	4, 0x90
__Z13multiply_evenPv:                   ## @_Z13multiply_evenPv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	8(%rdi), %rdi
	callq	__ZN6Matrix8get_colsEv
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rdi
	movl	48(%rdi), %eax
	movl	%eax, -24(%rbp)
LBB3_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_3 Depth 2
                                        ##       Child Loop BB3_5 Depth 3
	movl	-24(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	52(%rcx), %eax
	jae	LBB3_12
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	movl	$0, -28(%rbp)
LBB3_3:                                 ##   Parent Loop BB3_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB3_5 Depth 3
	movl	-28(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jae	LBB3_10
## %bb.4:                               ##   in Loop: Header=BB3_3 Depth=2
	xorl	%eax, %eax
	movq	-16(%rbp), %rcx
	movq	24(%rcx), %rcx
	movl	-24(%rbp), %edx
	movl	%edx, %esi
	subl	(%rcx,%rsi,4), %eax
	movq	-16(%rbp), %rcx
	movq	32(%rcx), %rcx
	movl	-28(%rbp), %edx
	movl	%edx, %esi
	subl	(%rcx,%rsi,4), %eax
	movq	-16(%rbp), %rcx
	movq	16(%rcx), %rdi
	movl	-24(%rbp), %esi
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	callq	__ZN6MatrixixEj
	movl	-28(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	-36(%rbp), %edx         ## 4-byte Reload
	movl	%edx, (%rax)
	movl	$0, -32(%rbp)
LBB3_5:                                 ##   Parent Loop BB3_1 Depth=1
                                        ##     Parent Loop BB3_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	-32(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	40(%rcx), %eax
	jae	LBB3_8
## %bb.6:                               ##   in Loop: Header=BB3_5 Depth=3
	movl	-32(%rbp), %eax
	shll	$1, %eax
	movl	%eax, -32(%rbp)
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rdi
	movl	-24(%rbp), %esi
	callq	__ZN6MatrixixEj
	movl	-32(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	(%rax), %esi
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movl	-32(%rbp), %edx
	addl	$1, %edx
	movl	%esi, -40(%rbp)         ## 4-byte Spill
	movl	%edx, %esi
	callq	__ZN6MatrixixEj
	movl	-28(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	-40(%rbp), %edx         ## 4-byte Reload
	addl	(%rax), %edx
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	movl	-24(%rbp), %esi
	movl	%edx, -44(%rbp)         ## 4-byte Spill
	callq	__ZN6MatrixixEj
	movl	-32(%rbp), %edx
	addl	$1, %edx
	movq	%rax, %rdi
	movl	%edx, %esi
	callq	__ZN5ArrayixEj
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	movl	-32(%rbp), %esi
	movl	%edx, -48(%rbp)         ## 4-byte Spill
	callq	__ZN6MatrixixEj
	movl	-28(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	-48(%rbp), %edx         ## 4-byte Reload
	addl	(%rax), %edx
	movl	-44(%rbp), %esi         ## 4-byte Reload
	imull	%edx, %esi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	movl	-24(%rbp), %edx
	movl	%esi, -52(%rbp)         ## 4-byte Spill
	movl	%edx, %esi
	callq	__ZN6MatrixixEj
	movl	-28(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	-52(%rbp), %edx         ## 4-byte Reload
	addl	(%rax), %edx
	movl	%edx, (%rax)
## %bb.7:                               ##   in Loop: Header=BB3_5 Depth=3
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB3_5
LBB3_8:                                 ##   in Loop: Header=BB3_3 Depth=2
	jmp	LBB3_9
LBB3_9:                                 ##   in Loop: Header=BB3_3 Depth=2
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB3_3
LBB3_10:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_11
LBB3_11:                                ##   in Loop: Header=BB3_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB3_1
LBB3_12:
	xorl	%eax, %eax
                                        ## kill: def $rax killed $eax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z24multiply_vinograd_threadR6MatrixS0_j ## -- Begin function _Z24multiply_vinograd_threadR6MatrixS0_j
	.p2align	4, 0x90
__Z24multiply_vinograd_threadR6MatrixS0_j: ## @_Z24multiply_vinograd_threadR6MatrixS0_j
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$448, %rsp              ## imm = 0x1C0
	movq	%rdi, %rax
	movq	%rsi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movl	-20(%rbp), %ecx
	movl	%ecx, %edx
	movl	$8, %ecx
	movl	%ecx, %esi
	movq	%rax, -304(%rbp)        ## 8-byte Spill
	movq	%rdx, %rax
	mulq	%rsi
	movq	$-1, %rdx
	cmovoq	%rdx, %rax
	movq	%rdi, -312(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	callq	__Znam
	movq	%rax, -56(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZN6Matrix8get_rowsEv
	movl	%eax, -60(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZN6Matrix8get_colsEv
	movl	%eax, -64(%rbp)
	movq	-16(%rbp), %rdi
	callq	__ZN6Matrix8get_colsEv
	movl	%eax, -68(%rbp)
	movb	$0, -69(%rbp)
	movl	-60(%rbp), %esi
	movl	-68(%rbp), %edx
	movq	-312(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN6MatrixC1Ejj
	movl	-64(%rbp), %eax
	shrl	%eax
	movl	%eax, -76(%rbp)
Ltmp0:
	callq	__ZNSt3__1L15__get_nullptr_tEv
Ltmp1:
	movq	%rax, -320(%rbp)        ## 8-byte Spill
	jmp	LBB4_1
LBB4_1:
	movq	-320(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -96(%rbp)
Ltmp2:
	leaq	-96(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_IiEEv
Ltmp3:
	movq	%rax, -328(%rbp)        ## 8-byte Spill
	jmp	LBB4_2
LBB4_2:
	movq	-328(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -88(%rbp)
Ltmp4:
	callq	__ZNSt3__1L15__get_nullptr_tEv
Ltmp5:
	movq	%rax, -336(%rbp)        ## 8-byte Spill
	jmp	LBB4_3
LBB4_3:
	movq	-336(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -128(%rbp)
Ltmp6:
	leaq	-128(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_IiEEv
Ltmp7:
	movq	%rax, -344(%rbp)        ## 8-byte Spill
	jmp	LBB4_4
LBB4_4:
	movq	-344(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -120(%rbp)
	leaq	-88(%rbp), %rcx
	movq	%rcx, -152(%rbp)
	movq	-8(%rbp), %rcx
	movq	%rcx, -144(%rbp)
	movl	-76(%rbp), %edx
	movl	%edx, -136(%rbp)
	leaq	-120(%rbp), %rcx
	movq	%rcx, -176(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rcx, -168(%rbp)
	movl	-76(%rbp), %edx
	movl	%edx, -160(%rbp)
Ltmp8:
	leaq	__Z10init_MultHPv(%rip), %rdx
	xorl	%esi, %esi
                                        ## kill: def $rsi killed $esi
	leaq	-40(%rbp), %rdi
	leaq	-152(%rbp), %rcx
	callq	_pthread_create
Ltmp9:
	movl	%eax, -348(%rbp)        ## 4-byte Spill
	jmp	LBB4_5
LBB4_5:
	movl	-348(%rbp), %eax        ## 4-byte Reload
	movl	%eax, -24(%rbp)
	cmpl	$0, -24(%rbp)
	je	LBB4_10
## %bb.6:
	movl	-24(%rbp), %esi
Ltmp51:
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	movb	%al, %cl
	movb	%cl, %al
	callq	_printf
Ltmp52:
	movl	%eax, -352(%rbp)        ## 4-byte Spill
	jmp	LBB4_7
LBB4_7:
Ltmp53:
	movl	$-1, %edi
	callq	_exit
Ltmp54:
	jmp	LBB4_8
LBB4_8:
	ud2
LBB4_9:
Ltmp55:
	movl	%edx, %ecx
	movq	%rax, -104(%rbp)
	movl	%ecx, -108(%rbp)
	jmp	LBB4_64
LBB4_10:
Ltmp10:
	leaq	__Z10init_MultVPv(%rip), %rdx
	xorl	%eax, %eax
	movl	%eax, %esi
	leaq	-48(%rbp), %rdi
	leaq	-176(%rbp), %rcx
	callq	_pthread_create
Ltmp11:
	movl	%eax, -356(%rbp)        ## 4-byte Spill
	jmp	LBB4_11
LBB4_11:
	movl	-356(%rbp), %eax        ## 4-byte Reload
	movl	%eax, -24(%rbp)
	cmpl	$0, -24(%rbp)
	je	LBB4_15
## %bb.12:
	movl	-24(%rbp), %esi
Ltmp47:
	leaq	L_.str.1(%rip), %rdi
	xorl	%eax, %eax
	movb	%al, %cl
	movb	%cl, %al
	callq	_printf
Ltmp48:
	movl	%eax, -360(%rbp)        ## 4-byte Spill
	jmp	LBB4_13
LBB4_13:
Ltmp49:
	movl	$-1, %edi
	callq	_exit
Ltmp50:
	jmp	LBB4_14
LBB4_14:
	ud2
LBB4_15:
	movq	-40(%rbp), %rdi
Ltmp12:
	leaq	-28(%rbp), %rsi
	callq	_pthread_join
Ltmp13:
	movl	%eax, -364(%rbp)        ## 4-byte Spill
	jmp	LBB4_16
LBB4_16:
	movl	-364(%rbp), %eax        ## 4-byte Reload
	movl	%eax, -24(%rbp)
	cmpl	$0, -24(%rbp)
	je	LBB4_20
## %bb.17:
	movl	-24(%rbp), %esi
Ltmp43:
	leaq	L_.str.2(%rip), %rdi
	xorl	%eax, %eax
	movb	%al, %cl
	movb	%cl, %al
	callq	_printf
Ltmp44:
	movl	%eax, -368(%rbp)        ## 4-byte Spill
	jmp	LBB4_18
LBB4_18:
Ltmp45:
	movl	$-2, %edi
	callq	_exit
Ltmp46:
	jmp	LBB4_19
LBB4_19:
	ud2
LBB4_20:
	movq	-48(%rbp), %rdi
Ltmp14:
	leaq	-28(%rbp), %rsi
	callq	_pthread_join
Ltmp15:
	movl	%eax, -372(%rbp)        ## 4-byte Spill
	jmp	LBB4_21
LBB4_21:
	movl	-372(%rbp), %eax        ## 4-byte Reload
	movl	%eax, -24(%rbp)
	cmpl	$0, -24(%rbp)
	je	LBB4_25
## %bb.22:
	movl	-24(%rbp), %esi
Ltmp39:
	leaq	L_.str.3(%rip), %rdi
	xorl	%eax, %eax
	movb	%al, %cl
	movb	%cl, %al
	callq	_printf
Ltmp40:
	movl	%eax, -376(%rbp)        ## 4-byte Spill
	jmp	LBB4_23
LBB4_23:
Ltmp41:
	movl	$-2, %edi
	callq	_exit
Ltmp42:
	jmp	LBB4_24
LBB4_24:
	ud2
LBB4_25:
	movl	-60(%rbp), %eax
	movl	%eax, %ecx
	cvtsi2ssq	%rcx, %xmm0
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	cvtsi2ssq	%rcx, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -180(%rbp)
	movss	-180(%rbp), %xmm0       ## xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -184(%rbp)
	movl	$0, -188(%rbp)
	cvttss2si	-184(%rbp), %rcx
	movl	%ecx, %eax
	movl	%eax, -192(%rbp)
Ltmp16:
	leaq	-216(%rbp), %rdi
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEC1Ev
Ltmp17:
	jmp	LBB4_26
LBB4_26:
	movl	$0, -220(%rbp)
LBB4_27:                                ## =>This Inner Loop Header: Depth=1
	movl	-220(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jae	LBB4_32
## %bb.28:                              ##   in Loop: Header=BB4_27 Depth=1
	movq	-8(%rbp), %rax
	movq	%rax, -280(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -272(%rbp)
	movq	-312(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -264(%rbp)
	movq	-88(%rbp), %rcx
	movq	%rcx, -256(%rbp)
	movq	-120(%rbp), %rcx
	movq	%rcx, -248(%rbp)
	movl	-76(%rbp), %edx
	movl	%edx, -240(%rbp)
	movl	-64(%rbp), %edx
	decl	%edx
	movl	%edx, -236(%rbp)
	movl	-188(%rbp), %edx
	movl	%edx, -232(%rbp)
	movl	-192(%rbp), %edx
	movl	%edx, -228(%rbp)
Ltmp34:
	leaq	-216(%rbp), %rdi
	leaq	-280(%rbp), %rsi
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE9push_backERKS1_
Ltmp35:
	jmp	LBB4_29
LBB4_29:                                ##   in Loop: Header=BB4_27 Depth=1
	movl	-192(%rbp), %eax
	movl	%eax, -188(%rbp)
	movss	-180(%rbp), %xmm0       ## xmm0 = mem[0],zero,zero,zero
	movss	-184(%rbp), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	addss	%xmm0, %xmm1
	movss	%xmm1, -184(%rbp)
	cvttss2si	-184(%rbp), %rcx
	movl	%ecx, %eax
	movl	%eax, -192(%rbp)
## %bb.30:                              ##   in Loop: Header=BB4_27 Depth=1
	movl	-220(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -220(%rbp)
	jmp	LBB4_27
LBB4_31:
Ltmp36:
	movl	%edx, %ecx
	movq	%rax, -104(%rbp)
	movl	%ecx, -108(%rbp)
Ltmp37:
	leaq	-216(%rbp), %rdi
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED1Ev
Ltmp38:
	jmp	LBB4_61
LBB4_32:
	leaq	__Z13multiply_evenPv(%rip), %rax
	movq	%rax, -288(%rbp)
	movl	-64(%rbp), %ecx
	andl	$1, %ecx
	cmpl	$0, %ecx
	je	LBB4_34
## %bb.33:
	leaq	__Z12multiply_oddPv(%rip), %rax
	movq	%rax, -288(%rbp)
LBB4_34:
	movl	$0, -292(%rbp)
LBB4_35:                                ## =>This Inner Loop Header: Depth=1
	movl	-292(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jae	LBB4_44
## %bb.36:                              ##   in Loop: Header=BB4_35 Depth=1
	movq	-56(%rbp), %rax
	movl	-292(%rbp), %ecx
	movl	%ecx, %edx
	leaq	(%rax,%rdx,8), %rdi
	movq	-288(%rbp), %rax
Ltmp26:
	leaq	-216(%rbp), %rsi
	movq	%rdi, -384(%rbp)        ## 8-byte Spill
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	movq	%rax, -392(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEixEm
Ltmp27:
	movq	%rax, -400(%rbp)        ## 8-byte Spill
	jmp	LBB4_37
LBB4_37:                                ##   in Loop: Header=BB4_35 Depth=1
Ltmp28:
	xorl	%eax, %eax
	movl	%eax, %esi
	movq	-384(%rbp), %rdi        ## 8-byte Reload
	movq	-392(%rbp), %rdx        ## 8-byte Reload
	movq	-400(%rbp), %rcx        ## 8-byte Reload
	callq	_pthread_create
Ltmp29:
	movl	%eax, -404(%rbp)        ## 4-byte Spill
	jmp	LBB4_38
LBB4_38:                                ##   in Loop: Header=BB4_35 Depth=1
	movl	-404(%rbp), %eax        ## 4-byte Reload
	movl	%eax, -24(%rbp)
	cmpl	$0, -24(%rbp)
	je	LBB4_42
## %bb.39:
	movl	-292(%rbp), %esi
	movl	-24(%rbp), %edx
Ltmp30:
	leaq	L_.str.4(%rip), %rdi
	xorl	%eax, %eax
	movb	%al, %cl
	movb	%cl, %al
	callq	_printf
Ltmp31:
	movl	%eax, -408(%rbp)        ## 4-byte Spill
	jmp	LBB4_40
LBB4_40:
Ltmp32:
	movl	$-1, %edi
	callq	_exit
Ltmp33:
	jmp	LBB4_41
LBB4_41:
	ud2
LBB4_42:                                ##   in Loop: Header=BB4_35 Depth=1
	jmp	LBB4_43
LBB4_43:                                ##   in Loop: Header=BB4_35 Depth=1
	movl	-292(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -292(%rbp)
	jmp	LBB4_35
LBB4_44:
	movl	$0, -296(%rbp)
LBB4_45:                                ## =>This Inner Loop Header: Depth=1
	movl	-296(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jae	LBB4_53
## %bb.46:                              ##   in Loop: Header=BB4_45 Depth=1
	movq	-56(%rbp), %rax
	movl	-296(%rbp), %ecx
	movl	%ecx, %edx
	movq	(%rax,%rdx,8), %rdi
Ltmp20:
	leaq	-28(%rbp), %rsi
	callq	_pthread_join
Ltmp21:
	movl	%eax, -412(%rbp)        ## 4-byte Spill
	jmp	LBB4_47
LBB4_47:                                ##   in Loop: Header=BB4_45 Depth=1
	movl	-412(%rbp), %eax        ## 4-byte Reload
	movl	%eax, -24(%rbp)
	cmpl	$0, -24(%rbp)
	je	LBB4_51
## %bb.48:
	movl	-296(%rbp), %esi
	movl	-24(%rbp), %edx
Ltmp22:
	leaq	L_.str.5(%rip), %rdi
	xorl	%eax, %eax
	movb	%al, %cl
	movb	%cl, %al
	callq	_printf
Ltmp23:
	movl	%eax, -416(%rbp)        ## 4-byte Spill
	jmp	LBB4_49
LBB4_49:
Ltmp24:
	movl	$-2, %edi
	callq	_exit
Ltmp25:
	jmp	LBB4_50
LBB4_50:
	ud2
LBB4_51:                                ##   in Loop: Header=BB4_45 Depth=1
	jmp	LBB4_52
LBB4_52:                                ##   in Loop: Header=BB4_45 Depth=1
	movl	-296(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -296(%rbp)
	jmp	LBB4_45
LBB4_53:
	movq	-88(%rbp), %rax
	cmpq	$0, %rax
	movq	%rax, -424(%rbp)        ## 8-byte Spill
	je	LBB4_55
## %bb.54:
	movq	-424(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdaPv
LBB4_55:
	movq	-120(%rbp), %rax
	cmpq	$0, %rax
	movq	%rax, -432(%rbp)        ## 8-byte Spill
	je	LBB4_57
## %bb.56:
	movq	-432(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdaPv
LBB4_57:
	movq	-56(%rbp), %rax
	cmpq	$0, %rax
	movq	%rax, -440(%rbp)        ## 8-byte Spill
	je	LBB4_59
## %bb.58:
	movq	-440(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdaPv
LBB4_59:
	movb	$1, -69(%rbp)
Ltmp18:
	leaq	-216(%rbp), %rdi
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED1Ev
Ltmp19:
	jmp	LBB4_60
LBB4_60:
	testb	$1, -69(%rbp)
	jne	LBB4_63
	jmp	LBB4_62
LBB4_61:
	jmp	LBB4_64
LBB4_62:
	movq	-312(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN6MatrixD1Ev
LBB4_63:
	movq	-304(%rbp), %rax        ## 8-byte Reload
	addq	$448, %rsp              ## imm = 0x1C0
	popq	%rbp
	retq
LBB4_64:
Ltmp56:
	movq	-312(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN6MatrixD1Ev
Ltmp57:
	jmp	LBB4_65
LBB4_65:
	jmp	LBB4_66
LBB4_66:
	movq	-104(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB4_67:
Ltmp58:
	movq	%rax, %rdi
	movq	%rdx, -448(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table4:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0 ## >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0     ##   Call between Lfunc_begin0 and Ltmp0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0     ## >> Call Site 2 <<
	.uleb128 Ltmp17-Ltmp0           ##   Call between Ltmp0 and Ltmp17
	.uleb128 Ltmp55-Lfunc_begin0    ##     jumps to Ltmp55
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp34-Lfunc_begin0    ## >> Call Site 3 <<
	.uleb128 Ltmp35-Ltmp34          ##   Call between Ltmp34 and Ltmp35
	.uleb128 Ltmp36-Lfunc_begin0    ##     jumps to Ltmp36
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp37-Lfunc_begin0    ## >> Call Site 4 <<
	.uleb128 Ltmp38-Ltmp37          ##   Call between Ltmp37 and Ltmp38
	.uleb128 Ltmp58-Lfunc_begin0    ##     jumps to Ltmp58
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp26-Lfunc_begin0    ## >> Call Site 5 <<
	.uleb128 Ltmp25-Ltmp26          ##   Call between Ltmp26 and Ltmp25
	.uleb128 Ltmp36-Lfunc_begin0    ##     jumps to Ltmp36
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp18-Lfunc_begin0    ## >> Call Site 6 <<
	.uleb128 Ltmp19-Ltmp18          ##   Call between Ltmp18 and Ltmp19
	.uleb128 Ltmp55-Lfunc_begin0    ##     jumps to Ltmp55
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp19-Lfunc_begin0    ## >> Call Site 7 <<
	.uleb128 Ltmp56-Ltmp19          ##   Call between Ltmp19 and Ltmp56
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp56-Lfunc_begin0    ## >> Call Site 8 <<
	.uleb128 Ltmp57-Ltmp56          ##   Call between Ltmp56 and Ltmp57
	.uleb128 Ltmp58-Lfunc_begin0    ##     jumps to Ltmp58
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp57-Lfunc_begin0    ## >> Call Site 9 <<
	.uleb128 Lfunc_end0-Ltmp57      ##   Call between Ltmp57 and Lfunc_end0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end0:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase0:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L15__get_nullptr_tEv
__ZNSt3__1L15__get_nullptr_tEv:         ## @_ZNSt3__1L15__get_nullptr_tEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	-8(%rbp), %rdi
	movq	$-1, %rsi
	callq	__ZNSt3__19nullptr_tC1EMNS0_5__natEi
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__19nullptr_tcvPT_IiEEv
__ZNKSt3__19nullptr_tcvPT_IiEEv:        ## @_ZNKSt3__19nullptr_tcvPT_IiEEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
                                        ## kill: def $rax killed $eax
	movq	%rdi, -8(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEC1Ev
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEC1Ev: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEC1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEC2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE9push_backERKS1_
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE9push_backERKS1_: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE9push_backERKS1_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	8(%rsi), %rdi
	movq	%rsi, %rax
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, -40(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE9__end_capEv
	movq	-32(%rbp), %rsi         ## 8-byte Reload
	cmpq	(%rax), %rsi
	je	LBB8_2
## %bb.1:
	movl	$1, %eax
	movl	%eax, %edx
	leaq	-24(%rbp), %rdi
	movq	-40(%rbp), %rsi         ## 8-byte Reload
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotatorC1ERKS4_m
	movq	-40(%rbp), %rdx         ## 8-byte Reload
	movq	%rdx, %rdi
	callq	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv
	movq	-40(%rbp), %rdx         ## 8-byte Reload
	movq	8(%rdx), %rdi
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L16__to_raw_pointerI10MultArgs_tEEPT_S3_
	movq	-16(%rbp), %rdx
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE9constructIS2_S2_EEvRS3_PT_RKT0_
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotator6__doneEv
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	8(%rax), %rdx
	addq	$56, %rdx
	movq	%rdx, 8(%rax)
	jmp	LBB8_3
LBB8_2:
	movq	-16(%rbp), %rsi
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE21__push_back_slow_pathIKS1_EEvRT_
LBB8_3:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEixEm
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEixEm: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEixEm
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	(%rsi), %rsi
	imulq	$56, -16(%rbp), %rdi
	addq	%rdi, %rsi
	movq	%rsi, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED1Ev ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED1Ev
	.p2align	4, 0x90
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED1Ev: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.private_extern	___clang_call_terminate ## -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_definition	___clang_call_terminate
	.p2align	4, 0x90
___clang_call_terminate:                ## @__clang_call_terminate
## %bb.0:
	pushq	%rax
	callq	___cxa_begin_catch
	movq	%rax, (%rsp)            ## 8-byte Spill
	callq	__ZSt9terminatev
                                        ## -- End function
	.globl	__Z26multiply_vinograd_nothreadR6MatrixS0_ ## -- Begin function _Z26multiply_vinograd_nothreadR6MatrixS0_
	.p2align	4, 0x90
__Z26multiply_vinograd_nothreadR6MatrixS0_: ## @_Z26multiply_vinograd_nothreadR6MatrixS0_
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$576, %rsp              ## imm = 0x240
	movq	%rdi, %rax
	movq	%rsi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movq	-8(%rbp), %rdx
	movq	%rdi, -128(%rbp)        ## 8-byte Spill
	movq	%rdx, %rdi
	movq	%rax, -136(%rbp)        ## 8-byte Spill
	callq	__ZN6Matrix8get_rowsEv
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZN6Matrix8get_colsEv
	movl	%eax, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	__ZN6Matrix8get_colsEv
	movl	%eax, -28(%rbp)
	movb	$0, -29(%rbp)
	movl	-20(%rbp), %esi
	movl	-28(%rbp), %edx
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN6MatrixC1Ejj
	movl	-24(%rbp), %eax
	shrl	%eax
	movl	%eax, -36(%rbp)
	movl	-20(%rbp), %eax
                                        ## kill: def $rax killed $eax
	movl	$4, %edx
	movl	%edx, %edi
	mulq	%rdi
	movq	$-1, %rdx
	cmovoq	%rdx, %rax
Ltmp59:
	movq	%rax, %rdi
	callq	__Znam
Ltmp60:
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	jmp	LBB12_1
LBB12_1:
	movq	-144(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -48(%rbp)
	movl	$0, -64(%rbp)
LBB12_2:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB12_4 Depth 2
	movl	-64(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jae	LBB12_14
## %bb.3:                               ##   in Loop: Header=BB12_2 Depth=1
	movq	-48(%rbp), %rax
	movl	-64(%rbp), %ecx
	movl	%ecx, %edx
	movl	$0, (%rax,%rdx,4)
	movl	$0, -68(%rbp)
LBB12_4:                                ##   Parent Loop BB12_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-68(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jae	LBB12_12
## %bb.5:                               ##   in Loop: Header=BB12_4 Depth=2
	movl	-68(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -68(%rbp)
	movq	-8(%rbp), %rdi
	movl	-64(%rbp), %esi
Ltmp127:
	callq	__ZN6MatrixixEj
Ltmp128:
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	jmp	LBB12_6
LBB12_6:                                ##   in Loop: Header=BB12_4 Depth=2
	movl	-68(%rbp), %esi
Ltmp129:
	movq	-152(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp130:
	movq	%rax, -160(%rbp)        ## 8-byte Spill
	jmp	LBB12_7
LBB12_7:                                ##   in Loop: Header=BB12_4 Depth=2
	movq	-160(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movq	-8(%rbp), %rdi
	movl	-64(%rbp), %esi
Ltmp131:
	movl	%ecx, -164(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp132:
	movq	%rax, -176(%rbp)        ## 8-byte Spill
	jmp	LBB12_8
LBB12_8:                                ##   in Loop: Header=BB12_4 Depth=2
	movl	-68(%rbp), %eax
	incl	%eax
Ltmp133:
	movq	-176(%rbp), %rdi        ## 8-byte Reload
	movl	%eax, %esi
	callq	__ZN5ArrayixEj
Ltmp134:
	movq	%rax, -184(%rbp)        ## 8-byte Spill
	jmp	LBB12_9
LBB12_9:                                ##   in Loop: Header=BB12_4 Depth=2
	movl	-164(%rbp), %eax        ## 4-byte Reload
	movq	-184(%rbp), %rcx        ## 8-byte Reload
	imull	(%rcx), %eax
	movq	-48(%rbp), %rdx
	movl	-64(%rbp), %esi
	movl	%esi, %edi
	addl	(%rdx,%rdi,4), %eax
	movl	%eax, (%rdx,%rdi,4)
## %bb.10:                              ##   in Loop: Header=BB12_4 Depth=2
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	LBB12_4
LBB12_11:
Ltmp135:
	movl	%edx, %ecx
	movq	%rax, -56(%rbp)
	movl	%ecx, -60(%rbp)
Ltmp136:
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN6MatrixD1Ev
Ltmp137:
	jmp	LBB12_89
LBB12_12:                               ##   in Loop: Header=BB12_2 Depth=1
	jmp	LBB12_13
LBB12_13:                               ##   in Loop: Header=BB12_2 Depth=1
	movl	-64(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -64(%rbp)
	jmp	LBB12_2
LBB12_14:
	movl	-28(%rbp), %eax
                                        ## kill: def $rax killed $eax
	movl	$4, %ecx
	movl	%ecx, %edx
	mulq	%rdx
	movq	$-1, %rdx
	cmovoq	%rdx, %rax
Ltmp61:
	movq	%rax, %rdi
	callq	__Znam
Ltmp62:
	movq	%rax, -192(%rbp)        ## 8-byte Spill
	jmp	LBB12_15
LBB12_15:
	movq	-192(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -80(%rbp)
	movl	$0, -84(%rbp)
LBB12_16:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB12_18 Depth 2
	movl	-84(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jae	LBB12_27
## %bb.17:                              ##   in Loop: Header=BB12_16 Depth=1
	movq	-80(%rbp), %rax
	movl	-84(%rbp), %ecx
	movl	%ecx, %edx
	movl	$0, (%rax,%rdx,4)
	movl	$0, -88(%rbp)
LBB12_18:                               ##   Parent Loop BB12_16 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-88(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jae	LBB12_25
## %bb.19:                              ##   in Loop: Header=BB12_18 Depth=2
	movl	-88(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -88(%rbp)
	movq	-16(%rbp), %rdi
	movl	-88(%rbp), %esi
Ltmp119:
	callq	__ZN6MatrixixEj
Ltmp120:
	movq	%rax, -200(%rbp)        ## 8-byte Spill
	jmp	LBB12_20
LBB12_20:                               ##   in Loop: Header=BB12_18 Depth=2
	movl	-84(%rbp), %esi
Ltmp121:
	movq	-200(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp122:
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	jmp	LBB12_21
LBB12_21:                               ##   in Loop: Header=BB12_18 Depth=2
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movq	-16(%rbp), %rdi
	movl	-88(%rbp), %edx
	incl	%edx
Ltmp123:
	movl	%edx, %esi
	movl	%ecx, -212(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp124:
	movq	%rax, -224(%rbp)        ## 8-byte Spill
	jmp	LBB12_22
LBB12_22:                               ##   in Loop: Header=BB12_18 Depth=2
	movl	-84(%rbp), %esi
Ltmp125:
	movq	-224(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp126:
	movq	%rax, -232(%rbp)        ## 8-byte Spill
	jmp	LBB12_23
LBB12_23:                               ##   in Loop: Header=BB12_18 Depth=2
	movl	-212(%rbp), %eax        ## 4-byte Reload
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	imull	(%rcx), %eax
	movq	-80(%rbp), %rdx
	movl	-84(%rbp), %esi
	movl	%esi, %edi
	addl	(%rdx,%rdi,4), %eax
	movl	%eax, (%rdx,%rdi,4)
## %bb.24:                              ##   in Loop: Header=BB12_18 Depth=2
	movl	-88(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	jmp	LBB12_18
LBB12_25:                               ##   in Loop: Header=BB12_16 Depth=1
	jmp	LBB12_26
LBB12_26:                               ##   in Loop: Header=BB12_16 Depth=1
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
	jmp	LBB12_16
LBB12_27:
	movl	-24(%rbp), %eax
	andl	$1, %eax
	cmpl	$0, %eax
	je	LBB12_57
## %bb.28:
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -92(%rbp)
	movl	$0, -96(%rbp)
LBB12_29:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB12_31 Depth 2
                                        ##       Child Loop BB12_39 Depth 3
	movl	-96(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jae	LBB12_56
## %bb.30:                              ##   in Loop: Header=BB12_29 Depth=1
	movl	$0, -100(%rbp)
LBB12_31:                               ##   Parent Loop BB12_29 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB12_39 Depth 3
	movl	-100(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jae	LBB12_54
## %bb.32:                              ##   in Loop: Header=BB12_31 Depth=2
	movq	-8(%rbp), %rdi
	movl	-96(%rbp), %esi
Ltmp87:
	callq	__ZN6MatrixixEj
Ltmp88:
	movq	%rax, -240(%rbp)        ## 8-byte Spill
	jmp	LBB12_33
LBB12_33:                               ##   in Loop: Header=BB12_31 Depth=2
	movl	-92(%rbp), %esi
Ltmp89:
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp90:
	movq	%rax, -248(%rbp)        ## 8-byte Spill
	jmp	LBB12_34
LBB12_34:                               ##   in Loop: Header=BB12_31 Depth=2
	movq	-248(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movq	-16(%rbp), %rdi
	movl	-92(%rbp), %esi
Ltmp91:
	movl	%ecx, -252(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp92:
	movq	%rax, -264(%rbp)        ## 8-byte Spill
	jmp	LBB12_35
LBB12_35:                               ##   in Loop: Header=BB12_31 Depth=2
	movl	-100(%rbp), %esi
Ltmp93:
	movq	-264(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp94:
	movq	%rax, -272(%rbp)        ## 8-byte Spill
	jmp	LBB12_36
LBB12_36:                               ##   in Loop: Header=BB12_31 Depth=2
	movq	-272(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movl	-252(%rbp), %edx        ## 4-byte Reload
	imull	%ecx, %edx
	movq	-48(%rbp), %rsi
	movl	-96(%rbp), %ecx
	movl	%ecx, %edi
	movl	%edi, %ecx
	movl	(%rsi,%rdi,4), %r8d
	subl	%r8d, %edx
	movq	-80(%rbp), %rsi
	movl	-100(%rbp), %r8d
	movl	%r8d, %edi
	movl	(%rsi,%rdi,4), %r8d
	subl	%r8d, %edx
Ltmp95:
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	movl	%ecx, %esi
	movl	%edx, -276(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp96:
	movq	%rax, -288(%rbp)        ## 8-byte Spill
	jmp	LBB12_37
LBB12_37:                               ##   in Loop: Header=BB12_31 Depth=2
	movl	-100(%rbp), %esi
Ltmp97:
	movq	-288(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp98:
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	jmp	LBB12_38
LBB12_38:                               ##   in Loop: Header=BB12_31 Depth=2
	movq	-296(%rbp), %rax        ## 8-byte Reload
	movl	-276(%rbp), %ecx        ## 4-byte Reload
	movl	%ecx, (%rax)
	movl	$0, -104(%rbp)
LBB12_39:                               ##   Parent Loop BB12_29 Depth=1
                                        ##     Parent Loop BB12_31 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	-104(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jae	LBB12_52
## %bb.40:                              ##   in Loop: Header=BB12_39 Depth=3
	movl	-104(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -104(%rbp)
	movq	-8(%rbp), %rdi
	movl	-96(%rbp), %esi
Ltmp99:
	callq	__ZN6MatrixixEj
Ltmp100:
	movq	%rax, -304(%rbp)        ## 8-byte Spill
	jmp	LBB12_41
LBB12_41:                               ##   in Loop: Header=BB12_39 Depth=3
	movl	-104(%rbp), %esi
Ltmp101:
	movq	-304(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp102:
	movq	%rax, -312(%rbp)        ## 8-byte Spill
	jmp	LBB12_42
LBB12_42:                               ##   in Loop: Header=BB12_39 Depth=3
	movq	-312(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movq	-16(%rbp), %rdi
	movl	-104(%rbp), %edx
	incl	%edx
Ltmp103:
	movl	%edx, %esi
	movl	%ecx, -316(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp104:
	movq	%rax, -328(%rbp)        ## 8-byte Spill
	jmp	LBB12_43
LBB12_43:                               ##   in Loop: Header=BB12_39 Depth=3
	movl	-100(%rbp), %esi
Ltmp105:
	movq	-328(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp106:
	movq	%rax, -336(%rbp)        ## 8-byte Spill
	jmp	LBB12_44
LBB12_44:                               ##   in Loop: Header=BB12_39 Depth=3
	movq	-336(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movl	-316(%rbp), %edx        ## 4-byte Reload
	addl	%ecx, %edx
	movq	-8(%rbp), %rdi
	movl	-96(%rbp), %esi
Ltmp107:
	movl	%edx, -340(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp108:
	movq	%rax, -352(%rbp)        ## 8-byte Spill
	jmp	LBB12_45
LBB12_45:                               ##   in Loop: Header=BB12_39 Depth=3
	movl	-104(%rbp), %eax
	incl	%eax
Ltmp109:
	movq	-352(%rbp), %rdi        ## 8-byte Reload
	movl	%eax, %esi
	callq	__ZN5ArrayixEj
Ltmp110:
	movq	%rax, -360(%rbp)        ## 8-byte Spill
	jmp	LBB12_46
LBB12_46:                               ##   in Loop: Header=BB12_39 Depth=3
	movq	-360(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movq	-16(%rbp), %rdi
	movl	-104(%rbp), %esi
Ltmp111:
	movl	%ecx, -364(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp112:
	movq	%rax, -376(%rbp)        ## 8-byte Spill
	jmp	LBB12_47
LBB12_47:                               ##   in Loop: Header=BB12_39 Depth=3
	movl	-100(%rbp), %esi
Ltmp113:
	movq	-376(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp114:
	movq	%rax, -384(%rbp)        ## 8-byte Spill
	jmp	LBB12_48
LBB12_48:                               ##   in Loop: Header=BB12_39 Depth=3
	movq	-384(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movl	-364(%rbp), %edx        ## 4-byte Reload
	addl	%ecx, %edx
	movl	-340(%rbp), %ecx        ## 4-byte Reload
	imull	%edx, %ecx
	movl	-96(%rbp), %esi
Ltmp115:
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	movl	%ecx, -388(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp116:
	movq	%rax, -400(%rbp)        ## 8-byte Spill
	jmp	LBB12_49
LBB12_49:                               ##   in Loop: Header=BB12_39 Depth=3
	movl	-100(%rbp), %esi
Ltmp117:
	movq	-400(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp118:
	movq	%rax, -408(%rbp)        ## 8-byte Spill
	jmp	LBB12_50
LBB12_50:                               ##   in Loop: Header=BB12_39 Depth=3
	movl	-388(%rbp), %eax        ## 4-byte Reload
	movq	-408(%rbp), %rcx        ## 8-byte Reload
	addl	(%rcx), %eax
	movl	%eax, (%rcx)
## %bb.51:                              ##   in Loop: Header=BB12_39 Depth=3
	movl	-104(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -104(%rbp)
	jmp	LBB12_39
LBB12_52:                               ##   in Loop: Header=BB12_31 Depth=2
	jmp	LBB12_53
LBB12_53:                               ##   in Loop: Header=BB12_31 Depth=2
	movl	-100(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -100(%rbp)
	jmp	LBB12_31
LBB12_54:                               ##   in Loop: Header=BB12_29 Depth=1
	jmp	LBB12_55
LBB12_55:                               ##   in Loop: Header=BB12_29 Depth=1
	movl	-96(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -96(%rbp)
	jmp	LBB12_29
LBB12_56:
	jmp	LBB12_82
LBB12_57:
	movl	$0, -108(%rbp)
LBB12_58:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB12_60 Depth 2
                                        ##       Child Loop BB12_64 Depth 3
	movl	-108(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jae	LBB12_81
## %bb.59:                              ##   in Loop: Header=BB12_58 Depth=1
	movl	$0, -112(%rbp)
LBB12_60:                               ##   Parent Loop BB12_58 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB12_64 Depth 3
	movl	-112(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jae	LBB12_79
## %bb.61:                              ##   in Loop: Header=BB12_60 Depth=2
	movq	-48(%rbp), %rax
	movl	-108(%rbp), %ecx
	movl	%ecx, %edx
	movl	%edx, %ecx
	movl	(%rax,%rdx,4), %esi
	negl	%esi
	movq	-80(%rbp), %rax
	movl	-112(%rbp), %edi
	movl	%edi, %edx
	movl	(%rax,%rdx,4), %edi
	subl	%edi, %esi
Ltmp63:
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	movl	%esi, -412(%rbp)        ## 4-byte Spill
	movl	%ecx, %esi
	callq	__ZN6MatrixixEj
Ltmp64:
	movq	%rax, -424(%rbp)        ## 8-byte Spill
	jmp	LBB12_62
LBB12_62:                               ##   in Loop: Header=BB12_60 Depth=2
	movl	-112(%rbp), %esi
Ltmp65:
	movq	-424(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp66:
	movq	%rax, -432(%rbp)        ## 8-byte Spill
	jmp	LBB12_63
LBB12_63:                               ##   in Loop: Header=BB12_60 Depth=2
	movq	-432(%rbp), %rax        ## 8-byte Reload
	movl	-412(%rbp), %ecx        ## 4-byte Reload
	movl	%ecx, (%rax)
	movl	$0, -116(%rbp)
LBB12_64:                               ##   Parent Loop BB12_58 Depth=1
                                        ##     Parent Loop BB12_60 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	-116(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jae	LBB12_77
## %bb.65:                              ##   in Loop: Header=BB12_64 Depth=3
	movl	-116(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -116(%rbp)
	movq	-8(%rbp), %rdi
	movl	-108(%rbp), %esi
Ltmp67:
	callq	__ZN6MatrixixEj
Ltmp68:
	movq	%rax, -440(%rbp)        ## 8-byte Spill
	jmp	LBB12_66
LBB12_66:                               ##   in Loop: Header=BB12_64 Depth=3
	movl	-116(%rbp), %esi
Ltmp69:
	movq	-440(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp70:
	movq	%rax, -448(%rbp)        ## 8-byte Spill
	jmp	LBB12_67
LBB12_67:                               ##   in Loop: Header=BB12_64 Depth=3
	movq	-448(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movq	-16(%rbp), %rdi
	movl	-116(%rbp), %edx
	incl	%edx
Ltmp71:
	movl	%edx, %esi
	movl	%ecx, -452(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp72:
	movq	%rax, -464(%rbp)        ## 8-byte Spill
	jmp	LBB12_68
LBB12_68:                               ##   in Loop: Header=BB12_64 Depth=3
	movl	-112(%rbp), %esi
Ltmp73:
	movq	-464(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp74:
	movq	%rax, -472(%rbp)        ## 8-byte Spill
	jmp	LBB12_69
LBB12_69:                               ##   in Loop: Header=BB12_64 Depth=3
	movq	-472(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movl	-452(%rbp), %edx        ## 4-byte Reload
	addl	%ecx, %edx
	movq	-8(%rbp), %rdi
	movl	-108(%rbp), %esi
Ltmp75:
	movl	%edx, -476(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp76:
	movq	%rax, -488(%rbp)        ## 8-byte Spill
	jmp	LBB12_70
LBB12_70:                               ##   in Loop: Header=BB12_64 Depth=3
	movl	-116(%rbp), %eax
	incl	%eax
Ltmp77:
	movq	-488(%rbp), %rdi        ## 8-byte Reload
	movl	%eax, %esi
	callq	__ZN5ArrayixEj
Ltmp78:
	movq	%rax, -496(%rbp)        ## 8-byte Spill
	jmp	LBB12_71
LBB12_71:                               ##   in Loop: Header=BB12_64 Depth=3
	movq	-496(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movq	-16(%rbp), %rdi
	movl	-116(%rbp), %esi
Ltmp79:
	movl	%ecx, -500(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp80:
	movq	%rax, -512(%rbp)        ## 8-byte Spill
	jmp	LBB12_72
LBB12_72:                               ##   in Loop: Header=BB12_64 Depth=3
	movl	-112(%rbp), %esi
Ltmp81:
	movq	-512(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp82:
	movq	%rax, -520(%rbp)        ## 8-byte Spill
	jmp	LBB12_73
LBB12_73:                               ##   in Loop: Header=BB12_64 Depth=3
	movq	-520(%rbp), %rax        ## 8-byte Reload
	movl	(%rax), %ecx
	movl	-500(%rbp), %edx        ## 4-byte Reload
	addl	%ecx, %edx
	movl	-476(%rbp), %ecx        ## 4-byte Reload
	imull	%edx, %ecx
	movl	-108(%rbp), %esi
Ltmp83:
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	movl	%ecx, -524(%rbp)        ## 4-byte Spill
	callq	__ZN6MatrixixEj
Ltmp84:
	movq	%rax, -536(%rbp)        ## 8-byte Spill
	jmp	LBB12_74
LBB12_74:                               ##   in Loop: Header=BB12_64 Depth=3
	movl	-112(%rbp), %esi
Ltmp85:
	movq	-536(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN5ArrayixEj
Ltmp86:
	movq	%rax, -544(%rbp)        ## 8-byte Spill
	jmp	LBB12_75
LBB12_75:                               ##   in Loop: Header=BB12_64 Depth=3
	movl	-524(%rbp), %eax        ## 4-byte Reload
	movq	-544(%rbp), %rcx        ## 8-byte Reload
	addl	(%rcx), %eax
	movl	%eax, (%rcx)
## %bb.76:                              ##   in Loop: Header=BB12_64 Depth=3
	movl	-116(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -116(%rbp)
	jmp	LBB12_64
LBB12_77:                               ##   in Loop: Header=BB12_60 Depth=2
	jmp	LBB12_78
LBB12_78:                               ##   in Loop: Header=BB12_60 Depth=2
	movl	-112(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -112(%rbp)
	jmp	LBB12_60
LBB12_79:                               ##   in Loop: Header=BB12_58 Depth=1
	jmp	LBB12_80
LBB12_80:                               ##   in Loop: Header=BB12_58 Depth=1
	movl	-108(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -108(%rbp)
	jmp	LBB12_58
LBB12_81:
	jmp	LBB12_82
LBB12_82:
	movq	-48(%rbp), %rax
	cmpq	$0, %rax
	movq	%rax, -552(%rbp)        ## 8-byte Spill
	je	LBB12_84
## %bb.83:
	movq	-552(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdaPv
LBB12_84:
	movq	-80(%rbp), %rax
	cmpq	$0, %rax
	movq	%rax, -560(%rbp)        ## 8-byte Spill
	je	LBB12_86
## %bb.85:
	movq	-560(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdaPv
LBB12_86:
	movb	$1, -29(%rbp)
	testb	$1, -29(%rbp)
	jne	LBB12_88
## %bb.87:
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	callq	__ZN6MatrixD1Ev
LBB12_88:
	movq	-136(%rbp), %rax        ## 8-byte Reload
	addq	$576, %rsp              ## imm = 0x240
	popq	%rbp
	retq
LBB12_89:
	jmp	LBB12_90
LBB12_90:
	movq	-56(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB12_91:
Ltmp138:
	movq	%rax, %rdi
	movq	%rdx, -568(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table12:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1 ## >> Call Site 1 <<
	.uleb128 Ltmp59-Lfunc_begin1    ##   Call between Lfunc_begin1 and Ltmp59
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp59-Lfunc_begin1    ## >> Call Site 2 <<
	.uleb128 Ltmp134-Ltmp59         ##   Call between Ltmp59 and Ltmp134
	.uleb128 Ltmp135-Lfunc_begin1   ##     jumps to Ltmp135
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp136-Lfunc_begin1   ## >> Call Site 3 <<
	.uleb128 Ltmp137-Ltmp136        ##   Call between Ltmp136 and Ltmp137
	.uleb128 Ltmp138-Lfunc_begin1   ##     jumps to Ltmp138
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp61-Lfunc_begin1    ## >> Call Site 4 <<
	.uleb128 Ltmp86-Ltmp61          ##   Call between Ltmp61 and Ltmp86
	.uleb128 Ltmp135-Lfunc_begin1   ##     jumps to Ltmp135
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp86-Lfunc_begin1    ## >> Call Site 5 <<
	.uleb128 Lfunc_end1-Ltmp86      ##   Call between Ltmp86 and Lfunc_end1
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end1:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase1:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__19nullptr_tC1EMNS0_5__natEi
__ZNSt3__19nullptr_tC1EMNS0_5__natEi:   ## @_ZNSt3__19nullptr_tC1EMNS0_5__natEi
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	__ZNSt3__19nullptr_tC2EMNS0_5__natEi
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__19nullptr_tC2EMNS0_5__natEi
__ZNSt3__19nullptr_tC2EMNS0_5__natEi:   ## @_ZNSt3__19nullptr_tC2EMNS0_5__natEi
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	$0, (%rsi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED2Ev ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED2Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED2Ev
	.p2align	4, 0x90
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED2Ev: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEED2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEED2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEED2Ev ## -- Begin function _ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEED2Ev
	.weak_def_can_be_hidden	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEED2Ev
	.p2align	4, 0x90
__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEED2Ev: ## @_ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEED2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rax
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_I10MultArgs_tEEv
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	cmpq	%rax, %rdi
	je	LBB16_2
## %bb.1:
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE5clearEv
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	(%rdi), %rsi
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	movq	-48(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, %rdx
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE10deallocateERS3_PS2_m
LBB16_2:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__19nullptr_tcvPT_I10MultArgs_tEEv
__ZNKSt3__19nullptr_tcvPT_I10MultArgs_tEEv: ## @_ZNKSt3__19nullptr_tcvPT_I10MultArgs_tEEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
                                        ## kill: def $rax killed $eax
	movq	%rdi, -8(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE5clearEv
__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE5clearEv: ## @_ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE5clearEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rsi
	callq	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE17__destruct_at_endEPS1_
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE10deallocateERS3_PS2_m
__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE10deallocateERS3_PS2_m: ## @_ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE10deallocateERS3_PS2_m
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdx
	callq	__ZNSt3__19allocatorI10MultArgs_tE10deallocateEPS1_m
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv
__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv: ## @_ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	addq	$16, %rdi
	callq	__ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE6secondEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv
__ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv: ## @_ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE9__end_capEv
	movl	$56, %ecx
	movl	%ecx, %edi
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx         ## 8-byte Reload
	movq	(%rdx), %rsi
	subq	%rsi, %rax
	cqto
	idivq	%rdi
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE17__destruct_at_endEPS1_
__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE17__destruct_at_endEPS1_: ## @_ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE17__destruct_at_endEPS1_
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	8(%rsi), %rdi
	movq	%rdi, -24(%rbp)
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
LBB22_1:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	je	LBB22_6
## %bb.2:                               ##   in Loop: Header=BB22_1 Depth=1
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv
	movq	-24(%rbp), %rdi
	addq	$-56, %rdi
	movq	%rdi, -24(%rbp)
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L16__to_raw_pointerI10MultArgs_tEEPT_S3_
Ltmp139:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE7destroyIS2_EEvRS3_PT_
Ltmp140:
	jmp	LBB22_3
LBB22_3:                                ##   in Loop: Header=BB22_1 Depth=1
	jmp	LBB22_1
LBB22_4:
Ltmp141:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
## %bb.5:
	movq	-32(%rbp), %rdi
	callq	___cxa_call_unexpected
LBB22_6:
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 8(%rcx)
	addq	$64, %rsp
	popq	%rbp
	retq
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table22:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase2-Lttbaseref2
Lttbaseref2:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Ltmp139-Lfunc_begin2   ## >> Call Site 1 <<
	.uleb128 Ltmp140-Ltmp139        ##   Call between Ltmp139 and Ltmp140
	.uleb128 Ltmp141-Lfunc_begin2   ##     jumps to Ltmp141
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp140-Lfunc_begin2   ## >> Call Site 2 <<
	.uleb128 Lfunc_end2-Ltmp140     ##   Call between Ltmp140 and Lfunc_end2
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end2:
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
	.p2align	2
Lttbase2:
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE7destroyIS2_EEvRS3_PT_
__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE7destroyIS2_EEvRS3_PT_: ## @_ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE7destroyIS2_EEvRS3_PT_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE9__destroyIS2_EEvNS_17integral_constantIbLb1EEERS3_PT_
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L16__to_raw_pointerI10MultArgs_tEEPT_S3_
__ZNSt3__1L16__to_raw_pointerI10MultArgs_tEEPT_S3_: ## @_ZNSt3__1L16__to_raw_pointerI10MultArgs_tEEPT_S3_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE9__destroyIS2_EEvNS_17integral_constantIbLb1EEERS3_PT_
__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE9__destroyIS2_EEvNS_17integral_constantIbLb1EEERS3_PT_: ## @_ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE9__destroyIS2_EEvNS_17integral_constantIbLb1EEERS3_PT_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	__ZNSt3__19allocatorI10MultArgs_tE7destroyEPS1_
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__19allocatorI10MultArgs_tE7destroyEPS1_
__ZNSt3__19allocatorI10MultArgs_tE7destroyEPS1_: ## @_ZNSt3__19allocatorI10MultArgs_tE7destroyEPS1_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__19allocatorI10MultArgs_tE10deallocateEPS1_m
__ZNSt3__19allocatorI10MultArgs_tE10deallocateEPS1_m: ## @_ZNSt3__19allocatorI10MultArgs_tE10deallocateEPS1_m
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdi
Ltmp142:
	movl	$8, %eax
	movl	%eax, %esi
	callq	__ZNSt3__1L19__libcpp_deallocateEPvm
Ltmp143:
	jmp	LBB27_1
LBB27_1:
	addq	$48, %rsp
	popq	%rbp
	retq
LBB27_2:
Ltmp144:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
## %bb.3:
	movq	-32(%rbp), %rdi
	callq	___cxa_call_unexpected
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table27:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase3-Lttbaseref3
Lttbaseref3:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Ltmp142-Lfunc_begin3   ## >> Call Site 1 <<
	.uleb128 Ltmp143-Ltmp142        ##   Call between Ltmp142 and Ltmp143
	.uleb128 Ltmp144-Lfunc_begin3   ##     jumps to Ltmp144
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp143-Lfunc_begin3   ## >> Call Site 2 <<
	.uleb128 Lfunc_end3-Ltmp143     ##   Call between Ltmp143 and Lfunc_end3
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end3:
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
	.p2align	2
Lttbase3:
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L19__libcpp_deallocateEPvm
__ZNSt3__1L19__libcpp_deallocateEPvm:   ## @_ZNSt3__1L19__libcpp_deallocateEPvm
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZdlPv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE6secondEv
__ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE6secondEv: ## @_ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE6secondEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EE5__getEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EE5__getEv
__ZNSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EE5__getEv: ## @_ZNSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EE5__getEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE9__end_capEv
__ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE9__end_capEv: ## @_ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE9__end_capEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	addq	$16, %rdi
	callq	__ZNKSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE5firstEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE5firstEv
__ZNKSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE5firstEv: ## @_ZNKSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE5firstEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNKSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EE5__getEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EE5__getEv
__ZNKSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EE5__getEv: ## @_ZNKSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EE5__getEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEC2Ev
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEC2Ev: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEEC2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEEC2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEEC2Ev
__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEEC2Ev: ## @_ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEEC2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, %rax
	movq	%rdi, -40(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	__ZNSt3__120__vector_base_commonILb1EEC2Ev
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_I10MultArgs_tEEv
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, (%rdi)
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -24(%rbp)
	leaq	-24(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_I10MultArgs_tEEv
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, 8(%rdi)
	addq	$16, %rdi
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -32(%rbp)
	leaq	-32(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_I10MultArgs_tEEv
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEEC1ES2_
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__120__vector_base_commonILb1EEC2Ev
__ZNSt3__120__vector_base_commonILb1EEC2Ev: ## @_ZNSt3__120__vector_base_commonILb1EEC2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEEC1ES2_
__ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEEC1ES2_: ## @_ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEEC1ES2_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	__ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEEC2ES2_
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEEC2ES2_
__ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEEC2ES2_: ## @_ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEEC2ES2_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, %rdi
	leaq	-16(%rbp), %rax
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L7forwardIP10MultArgs_tEERT_RNS_16remove_referenceIS3_E4typeE
	movq	(%rax), %rsi
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EEC2ES2_
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EEC2Ev
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L7forwardIP10MultArgs_tEERT_RNS_16remove_referenceIS3_E4typeE
__ZNSt3__1L7forwardIP10MultArgs_tEERT_RNS_16remove_referenceIS3_E4typeE: ## @_ZNSt3__1L7forwardIP10MultArgs_tEERT_RNS_16remove_referenceIS3_E4typeE
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EEC2ES2_
__ZNSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EEC2ES2_: ## @_ZNSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EEC2ES2_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	leaq	-16(%rbp), %rdi
	movq	%rsi, -24(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L7forwardIP10MultArgs_tEERT_RNS_16remove_referenceIS3_E4typeE
	movq	(%rax), %rax
	movq	-24(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, (%rsi)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EEC2Ev
__ZNSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EEC2Ev: ## @_ZNSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EEC2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__19allocatorI10MultArgs_tEC2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__19allocatorI10MultArgs_tEC2Ev
__ZNSt3__19allocatorI10MultArgs_tEC2Ev: ## @_ZNSt3__19allocatorI10MultArgs_tEC2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE9__end_capEv
__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE9__end_capEv: ## @_ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE9__end_capEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	addq	$16, %rdi
	callq	__ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE5firstEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotatorC1ERKS4_m
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotatorC1ERKS4_m: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotatorC1ERKS4_m
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdx
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotatorC2ERKS4_m
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE9constructIS2_S2_EEvRS3_PT_RKT0_
__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE9constructIS2_S2_EEvRS3_PT_RKT0_: ## @_ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE9constructIS2_S2_EEvRS3_PT_RKT0_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdx
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE11__constructIS2_S2_EEvNS_17integral_constantIbLb1EEERS3_PT_RKT0_
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotator6__doneEv
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotator6__doneEv: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotator6__doneEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE21__push_back_slow_pathIKS1_EEvRT_ ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE21__push_back_slow_pathIKS1_EEvRT_
	.weak_definition	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE21__push_back_slow_pathIKS1_EEvRT_
	.p2align	4, 0x90
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE21__push_back_slow_pathIKS1_EEvRT_: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE21__push_back_slow_pathIKS1_EEvRT_
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, %rdi
	movq	%rsi, -88(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv
	movq	%rax, -24(%rbp)
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4sizeEv
	incq	%rax
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE11__recommendEm
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4sizeEv
	movq	-24(%rbp), %rcx
	leaq	-64(%rbp), %rdi
	movq	-96(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, %rdx
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC1EmmS4_
	movq	-24(%rbp), %rdi
	movq	-48(%rbp), %rax
	movq	%rdi, -104(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	callq	__ZNSt3__1L16__to_raw_pointerI10MultArgs_tEEPT_S3_
	movq	-16(%rbp), %rdi
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__1L7forwardIK10MultArgs_tEERT_RNS_16remove_referenceIS3_E4typeE
Ltmp145:
	movq	-104(%rbp), %rdi        ## 8-byte Reload
	movq	-112(%rbp), %rsi        ## 8-byte Reload
	movq	%rax, %rdx
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE9constructIS2_S2_EEvRS3_PT_RKT0_
Ltmp146:
	jmp	LBB47_1
LBB47_1:
	movq	-48(%rbp), %rax
	addq	$56, %rax
	movq	%rax, -48(%rbp)
Ltmp147:
	leaq	-64(%rbp), %rsi
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EE
Ltmp148:
	jmp	LBB47_2
LBB47_2:
	leaq	-64(%rbp), %rdi
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED1Ev
	addq	$128, %rsp
	popq	%rbp
	retq
LBB47_3:
Ltmp149:
	movl	%edx, %ecx
	movq	%rax, -72(%rbp)
	movl	%ecx, -76(%rbp)
Ltmp150:
	leaq	-64(%rbp), %rdi
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED1Ev
Ltmp151:
	jmp	LBB47_4
LBB47_4:
	jmp	LBB47_5
LBB47_5:
	movq	-72(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB47_6:
Ltmp152:
	movq	%rax, %rdi
	movq	%rdx, -120(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table47:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase4-Lttbaseref4
Lttbaseref4:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Lfunc_begin4-Lfunc_begin4 ## >> Call Site 1 <<
	.uleb128 Ltmp145-Lfunc_begin4   ##   Call between Lfunc_begin4 and Ltmp145
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp145-Lfunc_begin4   ## >> Call Site 2 <<
	.uleb128 Ltmp148-Ltmp145        ##   Call between Ltmp145 and Ltmp148
	.uleb128 Ltmp149-Lfunc_begin4   ##     jumps to Ltmp149
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp148-Lfunc_begin4   ## >> Call Site 3 <<
	.uleb128 Ltmp150-Ltmp148        ##   Call between Ltmp148 and Ltmp150
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp150-Lfunc_begin4   ## >> Call Site 4 <<
	.uleb128 Ltmp151-Ltmp150        ##   Call between Ltmp150 and Ltmp151
	.uleb128 Ltmp152-Lfunc_begin4   ##     jumps to Ltmp152
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp151-Lfunc_begin4   ## >> Call Site 5 <<
	.uleb128 Lfunc_end4-Ltmp151     ##   Call between Ltmp151 and Lfunc_end4
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end4:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase4:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE5firstEv
__ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE5firstEv: ## @_ZNSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE5firstEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EE5__getEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EE5__getEv
__ZNSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EE5__getEv: ## @_ZNSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EE5__getEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotatorC2ERKS4_m
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotatorC2ERKS4_m: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE24__RAII_IncreaseAnnotatorC2ERKS4_m
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE11__constructIS2_S2_EEvNS_17integral_constantIbLb1EEERS3_PT_RKT0_
__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE11__constructIS2_S2_EEvNS_17integral_constantIbLb1EEERS3_PT_RKT0_: ## @_ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE11__constructIS2_S2_EEvNS_17integral_constantIbLb1EEERS3_PT_RKT0_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movq	-32(%rbp), %rdx
	callq	__ZNSt3__19allocatorI10MultArgs_tE9constructIS1_EEvPS1_RKT_
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__19allocatorI10MultArgs_tE9constructIS1_EEvPS1_RKT_
__ZNSt3__19allocatorI10MultArgs_tE9constructIS1_EEvPS1_RKT_: ## @_ZNSt3__19allocatorI10MultArgs_tE9constructIS1_EEvPS1_RKT_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$56, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	%rdx, %rdi
	movq	%rcx, %rdx
	callq	_memcpy
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE11__recommendEm
__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE11__recommendEm: ## @_ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE11__recommendEm
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rsi
	movq	%rsi, %rdi
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8max_sizeEv
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jbe	LBB53_2
## %bb.1:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv
LBB53_2:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdi
	shrq	$1, %rdi
	cmpq	%rdi, %rax
	jb	LBB53_4
## %bb.3:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB53_5
LBB53_4:
	movq	-40(%rbp), %rax
	shlq	$1, %rax
	movq	%rax, -48(%rbp)
	leaq	-48(%rbp), %rdi
	leaq	-24(%rbp), %rsi
	callq	__ZNSt3__1L3maxImEERKT_S3_S3_
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
LBB53_5:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4sizeEv
__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4sizeEv: ## @_ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4sizeEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$56, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	8(%rdi), %rdx
	movq	(%rdi), %rdi
	subq	%rdi, %rdx
	movq	%rdx, %rax
	cqto
	idivq	%rcx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC1EmmS4_ ## -- Begin function _ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC1EmmS4_
	.weak_def_can_be_hidden	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC1EmmS4_
	.p2align	4, 0x90
__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC1EmmS4_: ## @_ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC1EmmS4_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rcx
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC2EmmS4_
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L7forwardIK10MultArgs_tEERT_RNS_16remove_referenceIS3_E4typeE
__ZNSt3__1L7forwardIK10MultArgs_tEERT_RNS_16remove_referenceIS3_E4typeE: ## @_ZNSt3__1L7forwardIK10MultArgs_tEERT_RNS_16remove_referenceIS3_E4typeE
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EE ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EE
	.weak_definition	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EE
	.p2align	4, 0x90
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EE: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EE
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, %rdi
	movq	%rsi, -24(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE17__annotate_deleteEv
	movq	-24(%rbp), %rsi         ## 8-byte Reload
	movq	%rsi, %rdi
	callq	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv
	movq	-24(%rbp), %rsi         ## 8-byte Reload
	movq	(%rsi), %rsi
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	8(%rdi), %rdx
	movq	-16(%rbp), %rcx
	addq	$8, %rcx
	movq	%rax, %rdi
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE20__construct_backwardIS2_EENS_9enable_ifIXaaooL_ZNS_17integral_constantIbLb1EE5valueEEntsr15__has_constructIS3_PT_S9_EE5valuesr31is_trivially_move_constructibleIS9_EE5valueEvE4typeERS3_SA_SA_RSA_
	movq	-24(%rbp), %rax         ## 8-byte Reload
	movq	-16(%rbp), %rcx
	addq	$8, %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	__ZNSt3__1L4swapIP10MultArgs_tEEvRT_S4_
	movq	-24(%rbp), %rax         ## 8-byte Reload
	addq	$8, %rax
	movq	-16(%rbp), %rcx
	addq	$16, %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	__ZNSt3__1L4swapIP10MultArgs_tEEvRT_S4_
	movq	-24(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE9__end_capEv
	movq	-16(%rbp), %rdi
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE9__end_capEv
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__1L4swapIP10MultArgs_tEEvRT_S4_
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4sizeEv
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE14__annotate_newEm
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE26__invalidate_all_iteratorsEv
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED1Ev ## -- Begin function _ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED1Ev
	.p2align	4, 0x90
__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED1Ev: ## @_ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8max_sizeEv ## -- Begin function _ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8max_sizeEv
	.weak_definition	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8max_sizeEv
	.p2align	4, 0x90
__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8max_sizeEv: ## @_ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8max_sizeEv
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv
	movq	%rax, %rdi
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE8max_sizeERKS3_
	movq	%rax, -16(%rbp)
	callq	__ZNSt3__114numeric_limitsIlE3maxEv
	movq	%rax, -24(%rbp)
Ltmp153:
	leaq	-16(%rbp), %rdi
	leaq	-24(%rbp), %rsi
	callq	__ZNSt3__1L3minImEERKT_S3_S3_
Ltmp154:
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	jmp	LBB59_1
LBB59_1:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
LBB59_2:
Ltmp155:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
## %bb.3:
	movq	-32(%rbp), %rdi
	callq	___cxa_call_unexpected
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table59:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase5-Lttbaseref5
Lttbaseref5:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Ltmp153-Lfunc_begin5   ## >> Call Site 1 <<
	.uleb128 Ltmp154-Ltmp153        ##   Call between Ltmp153 and Ltmp154
	.uleb128 Ltmp155-Lfunc_begin5   ##     jumps to Ltmp155
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp154-Lfunc_begin5   ## >> Call Site 2 <<
	.uleb128 Lfunc_end5-Ltmp154     ##   Call between Ltmp154 and Lfunc_end5
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end5:
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
	.p2align	2
Lttbase5:
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv
__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv: ## @_ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L3maxImEERKT_S3_S3_
__ZNSt3__1L3maxImEERKT_S3_S3_:          ## @_ZNSt3__1L3maxImEERKT_S3_S3_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	__ZNSt3__1L3maxImNS_6__lessImmEEEERKT_S5_S5_T0_
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L3minImEERKT_S3_S3_
__ZNSt3__1L3minImEERKT_S3_S3_:          ## @_ZNSt3__1L3minImEERKT_S3_S3_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	__ZNSt3__1L3minImNS_6__lessImmEEEERKT_S5_S5_T0_
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE8max_sizeERKS3_
__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE8max_sizeERKS3_: ## @_ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE8max_sizeERKS3_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE10__max_sizeENS_17integral_constantIbLb1EEERKS3_
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv
__ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv: ## @_ZNKSt3__113__vector_baseI10MultArgs_tNS_9allocatorIS1_EEE7__allocEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	addq	$16, %rdi
	callq	__ZNKSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE6secondEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__114numeric_limitsIlE3maxEv
__ZNSt3__114numeric_limitsIlE3maxEv:    ## @_ZNSt3__114numeric_limitsIlE3maxEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	callq	__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxEv
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L3minImNS_6__lessImmEEEERKT_S5_S5_T0_
__ZNSt3__1L3minImNS_6__lessImmEEEERKT_S5_S5_T0_: ## @_ZNSt3__1L3minImNS_6__lessImmEEEERKT_S5_S5_T0_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rdx
	leaq	-8(%rbp), %rdi
	callq	__ZNKSt3__16__lessImmEclERKmS3_
	testb	$1, %al
	jne	LBB66_1
	jmp	LBB66_2
LBB66_1:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	jmp	LBB66_3
LBB66_2:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)         ## 8-byte Spill
LBB66_3:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__16__lessImmEclERKmS3_
__ZNKSt3__16__lessImmEclERKmS3_:        ## @_ZNKSt3__16__lessImmEclERKmS3_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	-24(%rbp), %rsi
	cmpq	(%rsi), %rdx
	setb	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE10__max_sizeENS_17integral_constantIbLb1EEERKS3_
__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE10__max_sizeENS_17integral_constantIbLb1EEERKS3_: ## @_ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE10__max_sizeENS_17integral_constantIbLb1EEERKS3_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	__ZNKSt3__19allocatorI10MultArgs_tE8max_sizeEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__19allocatorI10MultArgs_tE8max_sizeEv
__ZNKSt3__19allocatorI10MultArgs_tE8max_sizeEv: ## @_ZNKSt3__19allocatorI10MultArgs_tE8max_sizeEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movabsq	$329406144173384850, %rax ## imm = 0x492492492492492
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE6secondEv
__ZNKSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE6secondEv: ## @_ZNKSt3__117__compressed_pairIP10MultArgs_tNS_9allocatorIS1_EEE6secondEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNKSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EE5__getEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EE5__getEv
__ZNKSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EE5__getEv: ## @_ZNKSt3__122__compressed_pair_elemINS_9allocatorI10MultArgs_tEELi1ELb1EE5__getEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxEv
__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxEv: ## @_ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movabsq	$9223372036854775807, %rax ## imm = 0x7FFFFFFFFFFFFFFF
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L3maxImNS_6__lessImmEEEERKT_S5_S5_T0_
__ZNSt3__1L3maxImNS_6__lessImmEEEERKT_S5_S5_T0_: ## @_ZNSt3__1L3maxImNS_6__lessImmEEEERKT_S5_S5_T0_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdx
	leaq	-8(%rbp), %rdi
	callq	__ZNKSt3__16__lessImmEclERKmS3_
	testb	$1, %al
	jne	LBB73_1
	jmp	LBB73_2
LBB73_1:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	jmp	LBB73_3
LBB73_2:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)         ## 8-byte Spill
LBB73_3:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC2EmmS4_ ## -- Begin function _ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC2EmmS4_
	.weak_def_can_be_hidden	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC2EmmS4_
	.p2align	4, 0x90
__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC2EmmS4_: ## @_ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEEC2EmmS4_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$24, %rdx
	movq	%rcx, -56(%rbp)         ## 8-byte Spill
	movq	%rdx, -64(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -40(%rbp)
	leaq	-40(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_I10MultArgs_tEEv
	movq	-32(%rbp), %rdx
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEEC1ES2_S5_
	cmpq	$0, -16(%rbp)
	je	LBB74_2
## %bb.1:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE7__allocEv
	movq	-16(%rbp), %rsi
	movq	%rax, %rdi
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE8allocateERS3_m
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	jmp	LBB74_3
LBB74_2:
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -48(%rbp)
	leaq	-48(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_I10MultArgs_tEEv
	movq	%rax, -72(%rbp)         ## 8-byte Spill
LBB74_3:
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	movq	(%rcx), %rax
	imulq	$56, -24(%rbp), %rdx
	addq	%rdx, %rax
	movq	%rax, 16(%rcx)
	movq	%rax, 8(%rcx)
	movq	(%rcx), %rax
	imulq	$56, -16(%rbp), %rdx
	addq	%rdx, %rax
	movq	%rcx, %rdi
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE9__end_capEv
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%rax)
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEEC1ES2_S5_
__ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEEC1ES2_S5_: ## @_ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEEC1ES2_S5_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdx
	callq	__ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEEC2ES2_S5_
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE8allocateERS3_m
__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE8allocateERS3_m: ## @_ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE8allocateERS3_m
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	xorl	%eax, %eax
	movl	%eax, %edx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	__ZNSt3__19allocatorI10MultArgs_tE8allocateEmPKv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE7__allocEv
__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE7__allocEv: ## @_ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE7__allocEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	addq	$24, %rdi
	callq	__ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE6secondEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE9__end_capEv
__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE9__end_capEv: ## @_ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE9__end_capEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	addq	$24, %rdi
	callq	__ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE5firstEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEEC2ES2_S5_
__ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEEC2ES2_S5_: ## @_ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEEC2ES2_S5_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	leaq	-16(%rbp), %rdi
	movq	%rdx, -32(%rbp)         ## 8-byte Spill
	movq	%rsi, -40(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L7forwardIP10MultArgs_tEERT_RNS_16remove_referenceIS3_E4typeE
	movq	(%rax), %rsi
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EEC2ES2_
	movq	-32(%rbp), %rax         ## 8-byte Reload
	addq	$8, %rax
	movq	-24(%rbp), %rdi
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L7forwardIRNS_9allocatorI10MultArgs_tEEEERT_RNS_16remove_referenceIS5_E4typeE
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__122__compressed_pair_elemIRNS_9allocatorI10MultArgs_tEELi1ELb0EEC2ES4_
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L7forwardIRNS_9allocatorI10MultArgs_tEEEERT_RNS_16remove_referenceIS5_E4typeE
__ZNSt3__1L7forwardIRNS_9allocatorI10MultArgs_tEEEERT_RNS_16remove_referenceIS5_E4typeE: ## @_ZNSt3__1L7forwardIRNS_9allocatorI10MultArgs_tEEEERT_RNS_16remove_referenceIS5_E4typeE
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemIRNS_9allocatorI10MultArgs_tEELi1ELb0EEC2ES4_
__ZNSt3__122__compressed_pair_elemIRNS_9allocatorI10MultArgs_tEELi1ELb0EEC2ES4_: ## @_ZNSt3__122__compressed_pair_elemIRNS_9allocatorI10MultArgs_tEELi1ELb0EEC2ES4_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdi
	movq	%rsi, -24(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L7forwardIRNS_9allocatorI10MultArgs_tEEEERT_RNS_16remove_referenceIS5_E4typeE
	movq	-24(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, (%rsi)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__19allocatorI10MultArgs_tE8allocateEmPKv
__ZNSt3__19allocatorI10MultArgs_tE8allocateEmPKv: ## @_ZNSt3__19allocatorI10MultArgs_tE8allocateEmPKv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rdx
	movq	%rdx, -32(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__19allocatorI10MultArgs_tE8max_sizeEv
	movq	-32(%rbp), %rdx         ## 8-byte Reload
	cmpq	%rax, %rdx
	jbe	LBB82_2
## %bb.1:
	leaq	L_.str.6(%rip), %rdi
	callq	__ZNSt3__1L20__throw_length_errorEPKc
LBB82_2:
	movl	$8, %eax
	movl	%eax, %esi
	imulq	$56, -16(%rbp), %rdi
	callq	__ZNSt3__1L17__libcpp_allocateEmm
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L20__throw_length_errorEPKc
__ZNSt3__1L20__throw_length_errorEPKc:  ## @_ZNSt3__1L20__throw_length_errorEPKc
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	$16, %eax
	movl	%eax, %edi
	callq	___cxa_allocate_exception
	movq	%rax, %rdi
	movq	-8(%rbp), %rsi
Ltmp156:
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	__ZNSt12length_errorC1EPKc
Ltmp157:
	jmp	LBB83_1
LBB83_1:
	movq	__ZTISt12length_error@GOTPCREL(%rip), %rsi
	movq	__ZNSt12length_errorD1Ev@GOTPCREL(%rip), %rdx
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	callq	___cxa_throw
LBB83_2:
Ltmp158:
	movl	%edx, %ecx
	movq	%rax, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	callq	___cxa_free_exception
## %bb.3:
	movq	-16(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table83:
Lexception6:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Lfunc_begin6-Lfunc_begin6 ## >> Call Site 1 <<
	.uleb128 Ltmp156-Lfunc_begin6   ##   Call between Lfunc_begin6 and Ltmp156
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp156-Lfunc_begin6   ## >> Call Site 2 <<
	.uleb128 Ltmp157-Ltmp156        ##   Call between Ltmp156 and Ltmp157
	.uleb128 Ltmp158-Lfunc_begin6   ##     jumps to Ltmp158
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp157-Lfunc_begin6   ## >> Call Site 3 <<
	.uleb128 Lfunc_end6-Ltmp157     ##   Call between Ltmp157 and Lfunc_end6
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end6:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L17__libcpp_allocateEmm
__ZNSt3__1L17__libcpp_allocateEmm:      ## @_ZNSt3__1L17__libcpp_allocateEmm
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	__Znwm
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt12length_errorC1EPKc
__ZNSt12length_errorC1EPKc:             ## @_ZNSt12length_errorC1EPKc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	__ZNSt12length_errorC2EPKc
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt12length_errorC2EPKc
__ZNSt12length_errorC2EPKc:             ## @_ZNSt12length_errorC2EPKc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, %rdi
	movq	-16(%rbp), %rax
	movq	%rsi, -24(%rbp)         ## 8-byte Spill
	movq	%rax, %rsi
	callq	__ZNSt11logic_errorC2EPKc
	movq	__ZTVSt12length_error@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	-24(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, (%rsi)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE6secondEv
__ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE6secondEv: ## @_ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE6secondEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	addq	$8, %rdi
	callq	__ZNSt3__122__compressed_pair_elemIRNS_9allocatorI10MultArgs_tEELi1ELb0EE5__getEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemIRNS_9allocatorI10MultArgs_tEELi1ELb0EE5__getEv
__ZNSt3__122__compressed_pair_elemIRNS_9allocatorI10MultArgs_tEELi1ELb0EE5__getEv: ## @_ZNSt3__122__compressed_pair_elemIRNS_9allocatorI10MultArgs_tEELi1ELb0EE5__getEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE5firstEv
__ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE5firstEv: ## @_ZNSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE5firstEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EE5__getEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE17__annotate_deleteEv
__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE17__annotate_deleteEv: ## @_ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE17__annotate_deleteEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4dataEv
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4dataEv
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv
	imulq	$56, %rax, %rax
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	addq	%rax, %rdi
	movq	-16(%rbp), %rax         ## 8-byte Reload
	movq	%rdi, -40(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4dataEv
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4sizeEv
	imulq	$56, %rax, %rax
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	addq	%rax, %rdi
	movq	-16(%rbp), %rax         ## 8-byte Reload
	movq	%rdi, -56(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4dataEv
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv
	imulq	$56, %rax, %rax
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	addq	%rax, %rdi
	movq	-16(%rbp), %rax         ## 8-byte Reload
	movq	%rdi, -72(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	-24(%rbp), %rsi         ## 8-byte Reload
	movq	-40(%rbp), %rdx         ## 8-byte Reload
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	-72(%rbp), %r8          ## 8-byte Reload
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE31__annotate_contiguous_containerEPKvS6_S6_S6_
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE20__construct_backwardIS2_EENS_9enable_ifIXaaooL_ZNS_17integral_constantIbLb1EE5valueEEntsr15__has_constructIS3_PT_S9_EE5valuesr31is_trivially_move_constructibleIS9_EE5valueEvE4typeERS3_SA_SA_RSA_
__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE20__construct_backwardIS2_EENS_9enable_ifIXaaooL_ZNS_17integral_constantIbLb1EE5valueEEntsr15__has_constructIS3_PT_S9_EE5valuesr31is_trivially_move_constructibleIS9_EE5valueEvE4typeERS3_SA_SA_RSA_: ## @_ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE20__construct_backwardIS2_EENS_9enable_ifIXaaooL_ZNS_17integral_constantIbLb1EE5valueEEntsr15__has_constructIS3_PT_S9_EE5valuesr31is_trivially_move_constructibleIS9_EE5valueEvE4typeERS3_SA_SA_RSA_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	xorl	%eax, %eax
	movl	%eax, %r8d
	movl	$56, %eax
	movl	%eax, %r9d
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	subq	%rdx, %rcx
	movq	%rcx, %rax
	cqto
	idivq	%r9
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	(%rcx), %rsi
	subq	%rax, %r8
	imulq	$56, %r8, %rax
	addq	%rax, %rsi
	movq	%rsi, (%rcx)
	cmpq	$0, -40(%rbp)
	jle	LBB91_2
## %bb.1:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	imulq	$56, -40(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_memcpy
LBB91_2:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L4swapIP10MultArgs_tEEvRT_S4_
__ZNSt3__1L4swapIP10MultArgs_tEEvRT_S4_: ## @_ZNSt3__1L4swapIP10MultArgs_tEEvRT_S4_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__1L4moveIP10MultArgs_tEERT_S4_
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	__ZNSt3__1L4moveIP10MultArgs_tEERT_S4_
	movq	(%rax), %rax
	movq	-8(%rbp), %rsi
	movq	%rax, (%rsi)
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__1L4moveIP10MultArgs_tEERT_S4_
	movq	(%rax), %rax
	movq	-16(%rbp), %rsi
	movq	%rax, (%rsi)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE14__annotate_newEm
__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE14__annotate_newEm: ## @_ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE14__annotate_newEm
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, %rdi
	movq	%rsi, -24(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4dataEv
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4dataEv
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv
	imulq	$56, %rax, %rax
	movq	-40(%rbp), %rsi         ## 8-byte Reload
	addq	%rax, %rsi
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4dataEv
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE8capacityEv
	imulq	$56, %rax, %rax
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	addq	%rax, %rsi
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	%rsi, -64(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4dataEv
	imulq	$56, -16(%rbp), %rsi
	addq	%rsi, %rax
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	-32(%rbp), %rsi         ## 8-byte Reload
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, %r8
	callq	__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE31__annotate_contiguous_containerEPKvS6_S6_S6_
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE26__invalidate_all_iteratorsEv
__ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE26__invalidate_all_iteratorsEv: ## @_ZNSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE26__invalidate_all_iteratorsEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE31__annotate_contiguous_containerEPKvS6_S6_S6_
__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE31__annotate_contiguous_containerEPKvS6_S6_S6_: ## @_ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE31__annotate_contiguous_containerEPKvS6_S6_S6_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4dataEv
__ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4dataEv: ## @_ZNKSt3__16vectorI10MultArgs_tNS_9allocatorIS1_EEE4dataEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rdi
	callq	__ZNSt3__1L16__to_raw_pointerI10MultArgs_tEEPT_S3_
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L4moveIP10MultArgs_tEERT_S4_
__ZNSt3__1L4moveIP10MultArgs_tEERT_S4_: ## @_ZNSt3__1L4moveIP10MultArgs_tEERT_S4_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED2Ev ## -- Begin function _ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED2Ev
	.weak_def_can_be_hidden	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED2Ev
	.p2align	4, 0x90
__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED2Ev: ## @_ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEED2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE5clearEv
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	cmpq	$0, (%rdi)
	je	LBB98_2
## %bb.1:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE7__allocEv
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movq	(%rdi), %rsi
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	movq	%rsi, -32(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE8capacityEv
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	-32(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, %rdx
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE10deallocateERS3_PS2_m
LBB98_2:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE5clearEv
__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE5clearEv: ## @_ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE5clearEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	8(%rdi), %rsi
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE17__destruct_at_endEPS1_
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE8capacityEv
__ZNKSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE8capacityEv: ## @_ZNKSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE8capacityEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE9__end_capEv
	movl	$56, %ecx
	movl	%ecx, %edi
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx         ## 8-byte Reload
	movq	(%rdx), %rsi
	subq	%rsi, %rax
	cqto
	idivq	%rdi
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE17__destruct_at_endEPS1_
__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE17__destruct_at_endEPS1_: ## @_ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE17__destruct_at_endEPS1_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE17__destruct_at_endEPS1_NS_17integral_constantIbLb0EEE
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE17__destruct_at_endEPS1_NS_17integral_constantIbLb0EEE
__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE17__destruct_at_endEPS1_NS_17integral_constantIbLb0EEE: ## @_ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE17__destruct_at_endEPS1_NS_17integral_constantIbLb0EEE
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rsi
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
LBB102_1:                               ## =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	cmpq	16(%rcx), %rax
	je	LBB102_6
## %bb.2:                               ##   in Loop: Header=BB102_1 Depth=1
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE7__allocEv
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	16(%rdi), %rcx
	addq	$-56, %rcx
	movq	%rcx, 16(%rdi)
	movq	%rcx, %rdi
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L16__to_raw_pointerI10MultArgs_tEEPT_S3_
Ltmp159:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__116allocator_traitsINS_9allocatorI10MultArgs_tEEE7destroyIS2_EEvRS3_PT_
Ltmp160:
	jmp	LBB102_3
LBB102_3:                               ##   in Loop: Header=BB102_1 Depth=1
	jmp	LBB102_1
LBB102_4:
Ltmp161:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
## %bb.5:
	movq	-32(%rbp), %rdi
	callq	___cxa_call_unexpected
LBB102_6:
	addq	$64, %rsp
	popq	%rbp
	retq
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table102:
Lexception7:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase6-Lttbaseref6
Lttbaseref6:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Ltmp159-Lfunc_begin7   ## >> Call Site 1 <<
	.uleb128 Ltmp160-Ltmp159        ##   Call between Ltmp159 and Ltmp160
	.uleb128 Ltmp161-Lfunc_begin7   ##     jumps to Ltmp161
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp160-Lfunc_begin7   ## >> Call Site 2 <<
	.uleb128 Lfunc_end7-Ltmp160     ##   Call between Ltmp160 and Lfunc_end7
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end7:
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
	.p2align	2
Lttbase6:
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE9__end_capEv
__ZNKSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE9__end_capEv: ## @_ZNKSt3__114__split_bufferI10MultArgs_tRNS_9allocatorIS1_EEE9__end_capEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	addq	$24, %rdi
	callq	__ZNKSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE5firstEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE5firstEv
__ZNKSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE5firstEv: ## @_ZNKSt3__117__compressed_pairIP10MultArgs_tRNS_9allocatorIS1_EEE5firstEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNKSt3__122__compressed_pair_elemIP10MultArgs_tLi0ELb0EE5__getEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Can't create thread for MulH, status = %d\n"

L_.str.1:                               ## @.str.1
	.asciz	"Can't create thread for MulV, status = %d\n"

L_.str.2:                               ## @.str.2
	.asciz	"Can't join thread thr_MulH, status = %d\n"

L_.str.3:                               ## @.str.3
	.asciz	"Can't join thread thr_MulV, status = %d\n"

L_.str.4:                               ## @.str.4
	.asciz	"Can't create thread %u, status = %d\n"

L_.str.5:                               ## @.str.5
	.asciz	"Can't join thread %u, status = %d\n"

L_.str.6:                               ## @.str.6
	.asciz	"allocator<T>::allocate(size_t n) 'n' exceeds maximum supported size"


.subsections_via_symbols
