	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	__ZN5ArrayC2Ev          ## -- Begin function _ZN5ArrayC2Ev
	.p2align	4, 0x90
__ZN5ArrayC2Ev:                         ## @_ZN5ArrayC2Ev
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
	movl	$0, 8(%rdi)
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_IiEEv
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, (%rdi)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
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
	.globl	__ZN5ArrayC1Ev          ## -- Begin function _ZN5ArrayC1Ev
	.p2align	4, 0x90
__ZN5ArrayC1Ev:                         ## @_ZN5ArrayC1Ev
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
	callq	__ZN5ArrayC2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN5ArrayC2Ej          ## -- Begin function _ZN5ArrayC2Ej
	.p2align	4, 0x90
__ZN5ArrayC2Ej:                         ## @_ZN5ArrayC2Ej
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$4, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %eax
	movl	%eax, 8(%rdi)
	movl	8(%rdi), %eax
                                        ## kill: def $rax killed $eax
	mulq	%rcx
	seto	%r8b
	movq	$-1, %rcx
	cmovoq	%rcx, %rax
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movb	%r8b, -25(%rbp)         ## 1-byte Spill
	callq	__Znam
	movq	-24(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	movl	$0, -16(%rbp)
LBB4_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	movq	-24(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB4_4
## %bb.2:                               ##   in Loop: Header=BB4_1 Depth=1
	movq	-24(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-16(%rbp), %edx
	movl	%edx, %esi
	movl	$0, (%rcx,%rsi,4)
## %bb.3:                               ##   in Loop: Header=BB4_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	LBB4_1
LBB4_4:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN5ArrayC1Ej          ## -- Begin function _ZN5ArrayC1Ej
	.p2align	4, 0x90
__ZN5ArrayC1Ej:                         ## @_ZN5ArrayC1Ej
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	__ZN5ArrayC2Ej
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN5ArrayD2Ev          ## -- Begin function _ZN5ArrayD2Ev
	.p2align	4, 0x90
__ZN5ArrayD2Ev:                         ## @_ZN5ArrayD2Ev
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
	cmpq	$0, %rdi
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	je	LBB6_2
## %bb.1:
	movq	-16(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdaPv
LBB6_2:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN5ArrayD1Ev          ## -- Begin function _ZN5ArrayD1Ev
	.p2align	4, 0x90
__ZN5ArrayD1Ev:                         ## @_ZN5ArrayD1Ev
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
	callq	__ZN5ArrayD2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN5Array5allocEj      ## -- Begin function _ZN5Array5allocEj
	.p2align	4, 0x90
__ZN5Array5allocEj:                     ## @_ZN5Array5allocEj
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rdi
	cmpq	$0, (%rdi)
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	jne	LBB8_7
## %bb.1:
	movq	-24(%rbp), %rax         ## 8-byte Reload
	cmpl	$0, 8(%rax)
	jne	LBB8_7
## %bb.2:
	movl	$4, %eax
	movl	%eax, %ecx
	movl	-12(%rbp), %eax
	movq	-24(%rbp), %rdx         ## 8-byte Reload
	movl	%eax, 8(%rdx)
	movl	8(%rdx), %eax
                                        ## kill: def $rax killed $eax
	mulq	%rcx
	seto	%sil
	movq	$-1, %rcx
	cmovoq	%rcx, %rax
	movq	%rax, %rdi
	movb	%sil, -25(%rbp)         ## 1-byte Spill
	callq	__Znam
	movq	-24(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	movl	$0, -16(%rbp)
LBB8_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	movq	-24(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB8_6
## %bb.4:                               ##   in Loop: Header=BB8_3 Depth=1
	movq	-24(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-16(%rbp), %edx
	movl	%edx, %esi
	movl	$0, (%rcx,%rsi,4)
## %bb.5:                               ##   in Loop: Header=BB8_3 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	LBB8_3
LBB8_6:
	jmp	LBB8_7
LBB8_7:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN5Array4readERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE ## -- Begin function _ZN5Array4readERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE
	.p2align	4, 0x90
__ZN5Array4readERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE: ## @_ZN5Array4readERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE
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
	movl	$0, -20(%rbp)
	movq	%rsi, -32(%rbp)         ## 8-byte Spill
LBB9_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB9_4
## %bb.2:                               ##   in Loop: Header=BB9_1 Depth=1
	movq	-16(%rbp), %rdi
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-20(%rbp), %edx
	movl	%edx, %esi
	shlq	$2, %rsi
	addq	%rsi, %rcx
	movq	%rcx, %rsi
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi
	movq	%rax, -40(%rbp)         ## 8-byte Spill
## %bb.3:                               ##   in Loop: Header=BB9_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB9_1
LBB9_4:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN5Array5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE ## -- Begin function _ZN5Array5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE
	.p2align	4, 0x90
__ZN5Array5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE: ## @_ZN5Array5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE
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
	movl	$0, -20(%rbp)
	movq	%rsi, -32(%rbp)         ## 8-byte Spill
LBB10_1:                                ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB10_4
## %bb.2:                               ##   in Loop: Header=BB10_1 Depth=1
	movq	-16(%rbp), %rdi
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-20(%rbp), %edx
	movl	%edx, %esi
	movl	(%rcx,%rsi,4), %esi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	movq	%rax, %rdi
	movl	$32, %esi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	movq	%rax, -40(%rbp)         ## 8-byte Spill
## %bb.3:                               ##   in Loop: Header=BB10_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB10_1
LBB10_4:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c ## -- Begin function _ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	.weak_definition	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	.p2align	4, 0x90
__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c: ## @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movb	%sil, %al
	movl	$1, %esi
	movl	%esi, %edx
	movq	%rdi, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rdi
	leaq	-9(%rbp), %rsi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN5ArrayixEj          ## -- Begin function _ZN5ArrayixEj
	.p2align	4, 0x90
__ZN5ArrayixEj:                         ## @_ZN5ArrayixEj
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rdi
	movl	-12(%rbp), %esi
	movl	%esi, %eax
	shlq	$2, %rax
	addq	%rax, %rdi
	movq	%rdi, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6MatrixC2Ejj        ## -- Begin function _ZN6MatrixC2Ejj
	.p2align	4, 0x90
__ZN6MatrixC2Ejj:                       ## @_ZN6MatrixC2Ejj
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
	subq	$112, %rsp
	movl	$16, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %eax
	movl	%eax, 8(%rdi)
	movl	-16(%rbp), %eax
	movl	%eax, 12(%rdi)
	movl	8(%rdi), %eax
	movl	%eax, %r8d
	movq	%r8, %rax
	mulq	%rcx
	seto	%r9b
	addq	$8, %rax
	setb	%r10b
	orb	%r10b, %r9b
	testb	$1, %r9b
	movq	$-1, %rcx
	cmovneq	%rcx, %rax
	movq	%rdi, -40(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	%r8, -48(%rbp)          ## 8-byte Spill
	callq	__Znam
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%rax)
	movq	%rax, %rdi
	addq	$8, %rdi
	cmpq	$0, %rcx
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	je	LBB13_4
## %bb.1:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	shlq	$4, %rax
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	addq	%rax, %rcx
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	%rcx, -72(%rbp)         ## 8-byte Spill
	movq	%rax, -80(%rbp)         ## 8-byte Spill
LBB13_2:                                ## =>This Inner Loop Header: Depth=1
Ltmp0:
	movq	-80(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	callq	__ZN5ArrayC1Ev
Ltmp1:
	jmp	LBB13_3
LBB13_3:                                ##   in Loop: Header=BB13_2 Depth=1
	movq	-88(%rbp), %rax         ## 8-byte Reload
	addq	$16, %rax
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	jne	LBB13_2
LBB13_4:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%rax)
	movl	$0, -32(%rbp)
LBB13_5:                                ## =>This Inner Loop Header: Depth=1
	movl	-32(%rbp), %eax
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB13_12
## %bb.6:                               ##   in Loop: Header=BB13_5 Depth=1
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-32(%rbp), %edx
	movl	%edx, %esi
	shlq	$4, %rsi
	addq	%rsi, %rcx
	movl	12(%rax), %esi
	movq	%rcx, %rdi
	callq	__ZN5Array5allocEj
## %bb.7:                               ##   in Loop: Header=BB13_5 Depth=1
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB13_5
LBB13_8:
Ltmp2:
	movl	%edx, %ecx
	movq	%rax, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	-88(%rbp), %rdx         ## 8-byte Reload
	cmpq	%rdx, %rax
	movq	%rdx, -96(%rbp)         ## 8-byte Spill
	je	LBB13_11
LBB13_9:                                ## =>This Inner Loop Header: Depth=1
	movq	-96(%rbp), %rax         ## 8-byte Reload
	addq	$-16, %rax
Ltmp3:
	movq	%rax, %rdi
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	callq	__ZN5ArrayD1Ev
Ltmp4:
	jmp	LBB13_10
LBB13_10:                               ##   in Loop: Header=BB13_9 Depth=1
	movq	-104(%rbp), %rax        ## 8-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	jne	LBB13_9
LBB13_11:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
	jmp	LBB13_13
LBB13_12:
	addq	$112, %rsp
	popq	%rbp
	retq
LBB13_13:
	movq	-24(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB13_14:
Ltmp5:
	movq	%rax, %rdi
	movq	%rdx, -112(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table13:
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
	.uleb128 Ltmp1-Ltmp0            ##   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0     ##     jumps to Ltmp2
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp1-Lfunc_begin0     ## >> Call Site 3 <<
	.uleb128 Ltmp3-Ltmp1            ##   Call between Ltmp1 and Ltmp3
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0     ## >> Call Site 4 <<
	.uleb128 Ltmp4-Ltmp3            ##   Call between Ltmp3 and Ltmp4
	.uleb128 Ltmp5-Lfunc_begin0     ##     jumps to Ltmp5
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp4-Lfunc_begin0     ## >> Call Site 5 <<
	.uleb128 Lfunc_end0-Ltmp4       ##   Call between Ltmp4 and Lfunc_end0
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
	.globl	__ZN6MatrixC1Ejj        ## -- Begin function _ZN6MatrixC1Ejj
	.p2align	4, 0x90
__ZN6MatrixC1Ejj:                       ## @_ZN6MatrixC1Ejj
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	movl	-16(%rbp), %edx
	callq	__ZN6MatrixC2Ejj
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6MatrixC2ERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE ## -- Begin function _ZN6MatrixC2ERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE
	.p2align	4, 0x90
__ZN6MatrixC2ERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE: ## @_ZN6MatrixC2ERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE
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
	subq	$128, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdi
	movq	%rsi, %rax
	addq	$8, %rax
	movq	%rsi, -40(%rbp)         ## 8-byte Spill
	movq	%rax, %rsi
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERj
	movq	-16(%rbp), %rdi
	movq	-40(%rbp), %rsi         ## 8-byte Reload
	addq	$12, %rsi
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERj
	movl	$16, %ecx
	movl	%ecx, %esi
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	movl	8(%rdi), %ecx
	movl	%ecx, %edx
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	%rdx, %rax
	movq	%rdx, -64(%rbp)         ## 8-byte Spill
	mulq	%rsi
	seto	%r8b
	addq	$8, %rax
	setb	%r9b
	orb	%r9b, %r8b
	testb	$1, %r8b
	movq	$-1, %rsi
	cmovneq	%rsi, %rax
	movq	%rax, %rdi
	callq	__Znam
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	movq	%rsi, (%rax)
	movq	%rax, %rdi
	addq	$8, %rdi
	cmpq	$0, %rsi
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	movq	%rdi, -80(%rbp)         ## 8-byte Spill
	je	LBB16_4
## %bb.1:
	movq	-64(%rbp), %rax         ## 8-byte Reload
	shlq	$4, %rax
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	addq	%rax, %rcx
	movq	-80(%rbp), %rax         ## 8-byte Reload
	movq	%rcx, -88(%rbp)         ## 8-byte Spill
	movq	%rax, -96(%rbp)         ## 8-byte Spill
LBB16_2:                                ## =>This Inner Loop Header: Depth=1
Ltmp6:
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	callq	__ZN5ArrayC1Ev
Ltmp7:
	jmp	LBB16_3
LBB16_3:                                ##   in Loop: Header=BB16_2 Depth=1
	movq	-104(%rbp), %rax        ## 8-byte Reload
	addq	$16, %rax
	movq	-88(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	jne	LBB16_2
LBB16_4:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%rax)
	movl	$0, -32(%rbp)
LBB16_5:                                ## =>This Inner Loop Header: Depth=1
	movl	-32(%rbp), %eax
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB16_12
## %bb.6:                               ##   in Loop: Header=BB16_5 Depth=1
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-32(%rbp), %edx
	movl	%edx, %esi
	shlq	$4, %rsi
	addq	%rsi, %rcx
	movl	12(%rax), %esi
	movq	%rcx, %rdi
	callq	__ZN5Array5allocEj
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-32(%rbp), %edx
	movl	%edx, %edi
	shlq	$4, %rdi
	addq	%rdi, %rcx
	movq	-16(%rbp), %rsi
	movq	%rcx, %rdi
	callq	__ZN5Array4readERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE
## %bb.7:                               ##   in Loop: Header=BB16_5 Depth=1
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB16_5
LBB16_8:
Ltmp8:
	movl	%edx, %ecx
	movq	%rax, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movq	-80(%rbp), %rax         ## 8-byte Reload
	movq	-104(%rbp), %rdx        ## 8-byte Reload
	cmpq	%rdx, %rax
	movq	%rdx, -112(%rbp)        ## 8-byte Spill
	je	LBB16_11
LBB16_9:                                ## =>This Inner Loop Header: Depth=1
	movq	-112(%rbp), %rax        ## 8-byte Reload
	addq	$-16, %rax
Ltmp9:
	movq	%rax, %rdi
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	callq	__ZN5ArrayD1Ev
Ltmp10:
	jmp	LBB16_10
LBB16_10:                               ##   in Loop: Header=BB16_9 Depth=1
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	jne	LBB16_9
LBB16_11:
	movq	-72(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
	jmp	LBB16_13
LBB16_12:
	addq	$128, %rsp
	popq	%rbp
	retq
LBB16_13:
	movq	-24(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB16_14:
Ltmp11:
	movq	%rax, %rdi
	movq	%rdx, -128(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table16:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1 ## >> Call Site 1 <<
	.uleb128 Ltmp6-Lfunc_begin1     ##   Call between Lfunc_begin1 and Ltmp6
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin1     ## >> Call Site 2 <<
	.uleb128 Ltmp7-Ltmp6            ##   Call between Ltmp6 and Ltmp7
	.uleb128 Ltmp8-Lfunc_begin1     ##     jumps to Ltmp8
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp7-Lfunc_begin1     ## >> Call Site 3 <<
	.uleb128 Ltmp9-Ltmp7            ##   Call between Ltmp7 and Ltmp9
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp9-Lfunc_begin1     ## >> Call Site 4 <<
	.uleb128 Ltmp10-Ltmp9           ##   Call between Ltmp9 and Ltmp10
	.uleb128 Ltmp11-Lfunc_begin1    ##     jumps to Ltmp11
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp10-Lfunc_begin1    ## >> Call Site 5 <<
	.uleb128 Lfunc_end1-Ltmp10      ##   Call between Ltmp10 and Lfunc_end1
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
	.globl	__ZN6MatrixC1ERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE ## -- Begin function _ZN6MatrixC1ERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE
	.p2align	4, 0x90
__ZN6MatrixC1ERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE: ## @_ZN6MatrixC1ERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE
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
	callq	__ZN6MatrixC2ERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6MatrixC2ERKS_      ## -- Begin function _ZN6MatrixC2ERKS_
	.p2align	4, 0x90
__ZN6MatrixC2ERKS_:                     ## @_ZN6MatrixC2ERKS_
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
	subq	$128, %rsp
	movl	$16, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdi
	movl	8(%rdi), %eax
	movl	%eax, 8(%rsi)
	movq	-16(%rbp), %rdi
	movl	12(%rdi), %eax
	movl	%eax, 12(%rsi)
	movl	8(%rsi), %eax
	movl	%eax, %edi
	movq	%rdi, %rax
	mulq	%rcx
	seto	%r8b
	addq	$8, %rax
	setb	%r9b
	orb	%r9b, %r8b
	testb	$1, %r8b
	movq	$-1, %rcx
	cmovneq	%rcx, %rax
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	callq	__Znam
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%rax)
	movq	%rax, %rsi
	addq	$8, %rsi
	cmpq	$0, %rcx
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	movq	%rsi, -72(%rbp)         ## 8-byte Spill
	je	LBB18_4
## %bb.1:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	shlq	$4, %rax
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	addq	%rax, %rcx
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	%rcx, -80(%rbp)         ## 8-byte Spill
	movq	%rax, -88(%rbp)         ## 8-byte Spill
LBB18_2:                                ## =>This Inner Loop Header: Depth=1
Ltmp12:
	movq	-88(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	callq	__ZN5ArrayC1Ev
Ltmp13:
	jmp	LBB18_3
LBB18_3:                                ##   in Loop: Header=BB18_2 Depth=1
	movq	-96(%rbp), %rax         ## 8-byte Reload
	addq	$16, %rax
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	jne	LBB18_2
LBB18_4:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%rax)
	movl	$0, -32(%rbp)
LBB18_5:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB18_7 Depth 2
	movl	-32(%rbp), %eax
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB18_16
## %bb.6:                               ##   in Loop: Header=BB18_5 Depth=1
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-32(%rbp), %edx
	movl	%edx, %esi
	shlq	$4, %rsi
	addq	%rsi, %rcx
	movl	12(%rax), %esi
	movq	%rcx, %rdi
	callq	__ZN5Array5allocEj
	movl	$0, -36(%rbp)
LBB18_7:                                ##   Parent Loop BB18_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-36(%rbp), %eax
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	cmpl	12(%rcx), %eax
	jae	LBB18_14
## %bb.8:                               ##   in Loop: Header=BB18_7 Depth=2
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movl	-32(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$4, %rdx
	addq	%rdx, %rax
	movl	-36(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	(%rax), %ecx
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdx
	movl	-32(%rbp), %esi
	movl	%esi, %edi
	shlq	$4, %rdi
	addq	%rdi, %rdx
	movl	-36(%rbp), %esi
	movq	%rdx, %rdi
	movl	%ecx, -100(%rbp)        ## 4-byte Spill
	callq	__ZN5ArrayixEj
	movl	-100(%rbp), %ecx        ## 4-byte Reload
	movl	%ecx, (%rax)
## %bb.9:                               ##   in Loop: Header=BB18_7 Depth=2
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB18_7
LBB18_10:
Ltmp14:
	movl	%edx, %ecx
	movq	%rax, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	-96(%rbp), %rdx         ## 8-byte Reload
	cmpq	%rdx, %rax
	movq	%rdx, -112(%rbp)        ## 8-byte Spill
	je	LBB18_13
LBB18_11:                               ## =>This Inner Loop Header: Depth=1
	movq	-112(%rbp), %rax        ## 8-byte Reload
	addq	$-16, %rax
Ltmp15:
	movq	%rax, %rdi
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	callq	__ZN5ArrayD1Ev
Ltmp16:
	jmp	LBB18_12
LBB18_12:                               ##   in Loop: Header=BB18_11 Depth=1
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	jne	LBB18_11
LBB18_13:
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
	jmp	LBB18_17
LBB18_14:                               ##   in Loop: Header=BB18_5 Depth=1
	jmp	LBB18_15
LBB18_15:                               ##   in Loop: Header=BB18_5 Depth=1
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB18_5
LBB18_16:
	addq	$128, %rsp
	popq	%rbp
	retq
LBB18_17:
	movq	-24(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB18_18:
Ltmp17:
	movq	%rax, %rdi
	movq	%rdx, -128(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table18:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase2-Lttbaseref2
Lttbaseref2:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Lfunc_begin2-Lfunc_begin2 ## >> Call Site 1 <<
	.uleb128 Ltmp12-Lfunc_begin2    ##   Call between Lfunc_begin2 and Ltmp12
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp12-Lfunc_begin2    ## >> Call Site 2 <<
	.uleb128 Ltmp13-Ltmp12          ##   Call between Ltmp12 and Ltmp13
	.uleb128 Ltmp14-Lfunc_begin2    ##     jumps to Ltmp14
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp13-Lfunc_begin2    ## >> Call Site 3 <<
	.uleb128 Ltmp15-Ltmp13          ##   Call between Ltmp13 and Ltmp15
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp15-Lfunc_begin2    ## >> Call Site 4 <<
	.uleb128 Ltmp16-Ltmp15          ##   Call between Ltmp15 and Ltmp16
	.uleb128 Ltmp17-Lfunc_begin2    ##     jumps to Ltmp17
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp16-Lfunc_begin2    ## >> Call Site 5 <<
	.uleb128 Lfunc_end2-Ltmp16      ##   Call between Ltmp16 and Lfunc_end2
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end2:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase2:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6MatrixC1ERKS_      ## -- Begin function _ZN6MatrixC1ERKS_
	.p2align	4, 0x90
__ZN6MatrixC1ERKS_:                     ## @_ZN6MatrixC1ERKS_
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
	callq	__ZN6MatrixC2ERKS_
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6MatrixD2Ev         ## -- Begin function _ZN6MatrixD2Ev
	.p2align	4, 0x90
__ZN6MatrixD2Ev:                        ## @_ZN6MatrixD2Ev
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
	subq	$80, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rdi
	cmpq	$0, %rdi
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	je	LBB20_5
## %bb.1:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	addq	$-8, %rax
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	movq	-8(%rcx), %rdx
	shlq	$4, %rdx
	addq	%rdx, %rcx
	movq	-32(%rbp), %rdx         ## 8-byte Reload
	cmpq	%rcx, %rdx
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	je	LBB20_4
LBB20_2:                                ## =>This Inner Loop Header: Depth=1
	movq	-48(%rbp), %rax         ## 8-byte Reload
	addq	$-16, %rax
Ltmp18:
	movq	%rax, %rdi
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	__ZN5ArrayD1Ev
Ltmp19:
	jmp	LBB20_3
LBB20_3:                                ##   in Loop: Header=BB20_2 Depth=1
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	jne	LBB20_2
LBB20_4:
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
LBB20_5:
	addq	$80, %rsp
	popq	%rbp
	retq
LBB20_6:
Ltmp20:
	movl	%edx, %ecx
	movq	%rax, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	cmpq	%rdx, %rax
	movq	%rdx, -64(%rbp)         ## 8-byte Spill
	je	LBB20_9
LBB20_7:                                ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	addq	$-16, %rax
Ltmp21:
	movq	%rax, %rdi
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	callq	__ZN5ArrayD1Ev
Ltmp22:
	jmp	LBB20_8
LBB20_8:                                ##   in Loop: Header=BB20_7 Depth=1
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	jne	LBB20_7
LBB20_9:
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
## %bb.10:
	movq	-16(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB20_11:
Ltmp23:
	movq	%rax, %rdi
	movq	%rdx, -80(%rbp)         ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table20:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase3-Lttbaseref3
Lttbaseref3:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Ltmp18-Lfunc_begin3    ## >> Call Site 1 <<
	.uleb128 Ltmp19-Ltmp18          ##   Call between Ltmp18 and Ltmp19
	.uleb128 Ltmp20-Lfunc_begin3    ##     jumps to Ltmp20
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp21-Lfunc_begin3    ## >> Call Site 2 <<
	.uleb128 Ltmp22-Ltmp21          ##   Call between Ltmp21 and Ltmp22
	.uleb128 Ltmp23-Lfunc_begin3    ##     jumps to Ltmp23
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp22-Lfunc_begin3    ## >> Call Site 3 <<
	.uleb128 Lfunc_end3-Ltmp22      ##   Call between Ltmp22 and Lfunc_end3
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end3:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase3:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN6MatrixD1Ev         ## -- Begin function _ZN6MatrixD1Ev
	.p2align	4, 0x90
__ZN6MatrixD1Ev:                        ## @_ZN6MatrixD1Ev
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
	callq	__ZN6MatrixD2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6Matrix4readERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE ## -- Begin function _ZN6Matrix4readERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE
	.p2align	4, 0x90
__ZN6Matrix4readERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE: ## @_ZN6Matrix4readERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE
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
	movl	$0, -20(%rbp)
	movq	%rsi, -32(%rbp)         ## 8-byte Spill
LBB22_1:                                ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB22_4
## %bb.2:                               ##   in Loop: Header=BB22_1 Depth=1
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-20(%rbp), %edx
	movl	%edx, %esi
	shlq	$4, %rsi
	addq	%rsi, %rcx
	movq	-16(%rbp), %rsi
	movq	%rcx, %rdi
	callq	__ZN5Array4readERNSt3__113basic_istreamIcNS0_11char_traitsIcEEEE
## %bb.3:                               ##   in Loop: Header=BB22_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB22_1
LBB22_4:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6Matrix5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE ## -- Begin function _ZN6Matrix5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE
	.p2align	4, 0x90
__ZN6Matrix5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE: ## @_ZN6Matrix5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE
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
	movl	$0, -20(%rbp)
	movq	%rsi, -32(%rbp)         ## 8-byte Spill
LBB23_1:                                ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB23_4
## %bb.2:                               ##   in Loop: Header=BB23_1 Depth=1
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-20(%rbp), %edx
	movl	%edx, %esi
	shlq	$4, %rsi
	addq	%rsi, %rcx
	movq	-16(%rbp), %rsi
	movq	%rcx, %rdi
	callq	__ZN5Array5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE
	movq	-16(%rbp), %rdi
	leaq	__ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
	movq	%rax, -40(%rbp)         ## 8-byte Spill
## %bb.3:                               ##   in Loop: Header=BB23_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB23_1
LBB23_4:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E: ## @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
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
	callq	*-16(%rbp)
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
__ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_: ## @_ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
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
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rax
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movl	$10, %esi
	callq	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movsbl	%al, %esi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	-8(%rbp), %rdi
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	movq	-8(%rbp), %rcx
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	movq	%rcx, %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6Matrix9randomizeEii ## -- Begin function _ZN6Matrix9randomizeEii
	.p2align	4, 0x90
__ZN6Matrix9randomizeEii:               ## @_ZN6Matrix9randomizeEii
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rdi
	movl	$0, -20(%rbp)
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
LBB26_1:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB26_3 Depth 2
	movl	-20(%rbp), %eax
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB26_8
## %bb.2:                               ##   in Loop: Header=BB26_1 Depth=1
	movl	$0, -24(%rbp)
LBB26_3:                                ##   Parent Loop BB26_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-24(%rbp), %eax
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	cmpl	12(%rcx), %eax
	jae	LBB26_6
## %bb.4:                               ##   in Loop: Header=BB26_3 Depth=2
	callq	_rand
	movl	-16(%rbp), %ecx
	subl	-12(%rbp), %ecx
	addl	$1, %ecx
	cltd
	idivl	%ecx
	addl	-12(%rbp), %edx
	movq	-32(%rbp), %rsi         ## 8-byte Reload
	movq	(%rsi), %rdi
	movl	-20(%rbp), %ecx
	movl	%ecx, %r8d
	shlq	$4, %r8
	addq	%r8, %rdi
	movl	-24(%rbp), %esi
	movl	%edx, -36(%rbp)         ## 4-byte Spill
	callq	__ZN5ArrayixEj
	movl	-36(%rbp), %ecx         ## 4-byte Reload
	movl	%ecx, (%rax)
## %bb.5:                               ##   in Loop: Header=BB26_3 Depth=2
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB26_3
LBB26_6:                                ##   in Loop: Header=BB26_1 Depth=1
	jmp	LBB26_7
LBB26_7:                                ##   in Loop: Header=BB26_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB26_1
LBB26_8:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6MatrixaSERS_       ## -- Begin function _ZN6MatrixaSERS_
	.p2align	4, 0x90
__ZN6MatrixaSERS_:                      ## @_ZN6MatrixaSERS_
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
	subq	$192, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rsi
	cmpq	-24(%rbp), %rsi
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	jne	LBB27_2
## %bb.1:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -8(%rbp)
	jmp	LBB27_30
LBB27_2:
	movq	-24(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movl	%ecx, 8(%rax)
	movq	-24(%rbp), %rdx
	movl	12(%rdx), %ecx
	movl	%ecx, 12(%rax)
	cmpq	$0, (%rax)
	je	LBB27_13
## %bb.3:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	cmpq	$0, %rcx
	movq	%rcx, -64(%rbp)         ## 8-byte Spill
	je	LBB27_8
## %bb.4:
	movq	-64(%rbp), %rax         ## 8-byte Reload
	addq	$-8, %rax
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	-8(%rcx), %rdx
	shlq	$4, %rdx
	addq	%rdx, %rcx
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	cmpq	%rcx, %rdx
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	movq	%rcx, -80(%rbp)         ## 8-byte Spill
	je	LBB27_7
LBB27_5:                                ## =>This Inner Loop Header: Depth=1
	movq	-80(%rbp), %rax         ## 8-byte Reload
	addq	$-16, %rax
Ltmp24:
	movq	%rax, %rdi
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	callq	__ZN5ArrayD1Ev
Ltmp25:
	jmp	LBB27_6
LBB27_6:                                ##   in Loop: Header=BB27_5 Depth=1
	movq	-88(%rbp), %rax         ## 8-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	jne	LBB27_5
LBB27_7:
	movq	-72(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
LBB27_8:
	jmp	LBB27_13
LBB27_9:
Ltmp26:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	-88(%rbp), %rdx         ## 8-byte Reload
	cmpq	%rdx, %rax
	movq	%rdx, -96(%rbp)         ## 8-byte Spill
	je	LBB27_12
LBB27_10:                               ## =>This Inner Loop Header: Depth=1
	movq	-96(%rbp), %rax         ## 8-byte Reload
	addq	$-16, %rax
Ltmp27:
	movq	%rax, %rdi
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	callq	__ZN5ArrayD1Ev
Ltmp28:
	jmp	LBB27_11
LBB27_11:                               ##   in Loop: Header=BB27_10 Depth=1
	movq	-104(%rbp), %rax        ## 8-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	jne	LBB27_10
LBB27_12:
	movq	-72(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
	jmp	LBB27_31
LBB27_13:
	movl	$16, %eax
	movl	%eax, %ecx
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	movl	8(%rdx), %eax
	movl	%eax, %esi
	movq	%rsi, %rax
	mulq	%rcx
	seto	%dil
	addq	$8, %rax
	setb	%r8b
	orb	%r8b, %dil
	testb	$1, %dil
	movq	$-1, %rcx
	cmovneq	%rcx, %rax
	movq	%rax, %rdi
	movq	%rsi, -112(%rbp)        ## 8-byte Spill
	callq	__Znam
	movq	-112(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, (%rax)
	movq	%rax, %rsi
	addq	$8, %rsi
	cmpq	$0, %rcx
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	movq	%rsi, -128(%rbp)        ## 8-byte Spill
	je	LBB27_17
## %bb.14:
	movq	-112(%rbp), %rax        ## 8-byte Reload
	shlq	$4, %rax
	movq	-128(%rbp), %rcx        ## 8-byte Reload
	addq	%rax, %rcx
	movq	-128(%rbp), %rax        ## 8-byte Reload
	movq	%rcx, -136(%rbp)        ## 8-byte Spill
	movq	%rax, -144(%rbp)        ## 8-byte Spill
LBB27_15:                               ## =>This Inner Loop Header: Depth=1
Ltmp29:
	movq	-144(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	callq	__ZN5ArrayC1Ev
Ltmp30:
	jmp	LBB27_16
LBB27_16:                               ##   in Loop: Header=BB27_15 Depth=1
	movq	-152(%rbp), %rax        ## 8-byte Reload
	addq	$16, %rax
	movq	-136(%rbp), %rcx        ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	jne	LBB27_15
LBB27_17:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	-128(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, (%rax)
	movl	$0, -40(%rbp)
LBB27_18:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB27_20 Depth 2
	movl	-40(%rbp), %eax
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB27_29
## %bb.19:                              ##   in Loop: Header=BB27_18 Depth=1
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-40(%rbp), %edx
	movl	%edx, %esi
	shlq	$4, %rsi
	addq	%rsi, %rcx
	movl	12(%rax), %esi
	movq	%rcx, %rdi
	callq	__ZN5Array5allocEj
	movl	$0, -44(%rbp)
LBB27_20:                               ##   Parent Loop BB27_18 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-44(%rbp), %eax
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	cmpl	12(%rcx), %eax
	jae	LBB27_27
## %bb.21:                              ##   in Loop: Header=BB27_20 Depth=2
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-40(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$4, %rdx
	addq	%rdx, %rax
	movl	-44(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZN5ArrayixEj
	movl	(%rax), %ecx
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdx
	movl	-40(%rbp), %esi
	movl	%esi, %edi
	shlq	$4, %rdi
	addq	%rdi, %rdx
	movl	-44(%rbp), %esi
	movq	%rdx, %rdi
	movl	%ecx, -156(%rbp)        ## 4-byte Spill
	callq	__ZN5ArrayixEj
	movl	-156(%rbp), %ecx        ## 4-byte Reload
	movl	%ecx, (%rax)
## %bb.22:                              ##   in Loop: Header=BB27_20 Depth=2
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	LBB27_20
LBB27_23:
Ltmp31:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movq	-128(%rbp), %rax        ## 8-byte Reload
	movq	-152(%rbp), %rdx        ## 8-byte Reload
	cmpq	%rdx, %rax
	movq	%rdx, -168(%rbp)        ## 8-byte Spill
	je	LBB27_26
LBB27_24:                               ## =>This Inner Loop Header: Depth=1
	movq	-168(%rbp), %rax        ## 8-byte Reload
	addq	$-16, %rax
Ltmp32:
	movq	%rax, %rdi
	movq	%rax, -176(%rbp)        ## 8-byte Spill
	callq	__ZN5ArrayD1Ev
Ltmp33:
	jmp	LBB27_25
LBB27_25:                               ##   in Loop: Header=BB27_24 Depth=1
	movq	-176(%rbp), %rax        ## 8-byte Reload
	movq	-128(%rbp), %rcx        ## 8-byte Reload
	cmpq	%rcx, %rax
	movq	%rax, -168(%rbp)        ## 8-byte Spill
	jne	LBB27_24
LBB27_26:
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	callq	__ZdaPv
	jmp	LBB27_31
LBB27_27:                               ##   in Loop: Header=BB27_18 Depth=1
	jmp	LBB27_28
LBB27_28:                               ##   in Loop: Header=BB27_18 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	LBB27_18
LBB27_29:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -8(%rbp)
LBB27_30:
	movq	-8(%rbp), %rax
	addq	$192, %rsp
	popq	%rbp
	retq
LBB27_31:
	movq	-32(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB27_32:
Ltmp34:
	movq	%rax, %rdi
	movq	%rdx, -184(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table27:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase4-Lttbaseref4
Lttbaseref4:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Ltmp24-Lfunc_begin4    ## >> Call Site 1 <<
	.uleb128 Ltmp25-Ltmp24          ##   Call between Ltmp24 and Ltmp25
	.uleb128 Ltmp26-Lfunc_begin4    ##     jumps to Ltmp26
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp27-Lfunc_begin4    ## >> Call Site 2 <<
	.uleb128 Ltmp28-Ltmp27          ##   Call between Ltmp27 and Ltmp28
	.uleb128 Ltmp34-Lfunc_begin4    ##     jumps to Ltmp34
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp28-Lfunc_begin4    ## >> Call Site 3 <<
	.uleb128 Ltmp29-Ltmp28          ##   Call between Ltmp28 and Ltmp29
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp29-Lfunc_begin4    ## >> Call Site 4 <<
	.uleb128 Ltmp30-Ltmp29          ##   Call between Ltmp29 and Ltmp30
	.uleb128 Ltmp31-Lfunc_begin4    ##     jumps to Ltmp31
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp30-Lfunc_begin4    ## >> Call Site 5 <<
	.uleb128 Ltmp32-Ltmp30          ##   Call between Ltmp30 and Ltmp32
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp32-Lfunc_begin4    ## >> Call Site 6 <<
	.uleb128 Ltmp33-Ltmp32          ##   Call between Ltmp32 and Ltmp33
	.uleb128 Ltmp34-Lfunc_begin4    ##     jumps to Ltmp34
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp33-Lfunc_begin4    ## >> Call Site 7 <<
	.uleb128 Lfunc_end4-Ltmp33      ##   Call between Ltmp33 and Lfunc_end4
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
	.globl	__ZN6MatrixeqERKS_      ## -- Begin function _ZN6MatrixeqERKS_
	.p2align	4, 0x90
__ZN6MatrixeqERKS_:                     ## @_ZN6MatrixeqERKS_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rsi
	movl	8(%rsi), %eax
	movq	-24(%rbp), %rdi
	cmpl	8(%rdi), %eax
	movq	%rsi, -40(%rbp)         ## 8-byte Spill
	jne	LBB28_2
## %bb.1:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movl	12(%rax), %ecx
	movq	-24(%rbp), %rdx
	cmpl	12(%rdx), %ecx
	je	LBB28_3
LBB28_2:
	movb	$0, -1(%rbp)
	jmp	LBB28_14
LBB28_3:
	movl	$0, -28(%rbp)
LBB28_4:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB28_6 Depth 2
	movl	-28(%rbp), %eax
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	cmpl	8(%rcx), %eax
	jae	LBB28_13
## %bb.5:                               ##   in Loop: Header=BB28_4 Depth=1
	movl	$0, -32(%rbp)
LBB28_6:                                ##   Parent Loop BB28_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-32(%rbp), %eax
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	cmpl	12(%rcx), %eax
	jae	LBB28_11
## %bb.7:                               ##   in Loop: Header=BB28_6 Depth=2
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movl	-28(%rbp), %edx
	movl	%edx, %esi
	shlq	$4, %rsi
	addq	%rsi, %rcx
	movl	-32(%rbp), %esi
	movq	%rcx, %rdi
	callq	__ZN5ArrayixEj
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-28(%rbp), %esi
	movl	%esi, %ecx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movl	-32(%rbp), %esi
	movq	%rax, %rdi
	movl	%edx, -44(%rbp)         ## 4-byte Spill
	callq	__ZN5ArrayixEj
	movl	-44(%rbp), %edx         ## 4-byte Reload
	cmpl	(%rax), %edx
	je	LBB28_9
## %bb.8:
	movb	$0, -1(%rbp)
	jmp	LBB28_14
LBB28_9:                                ##   in Loop: Header=BB28_6 Depth=2
	jmp	LBB28_10
LBB28_10:                               ##   in Loop: Header=BB28_6 Depth=2
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	LBB28_6
LBB28_11:                               ##   in Loop: Header=BB28_4 Depth=1
	jmp	LBB28_12
LBB28_12:                               ##   in Loop: Header=BB28_4 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB28_4
LBB28_13:
	movb	$1, -1(%rbp)
LBB28_14:
	movb	-1(%rbp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6MatrixneERKS_      ## -- Begin function _ZN6MatrixneERKS_
	.p2align	4, 0x90
__ZN6MatrixneERKS_:                     ## @_ZN6MatrixneERKS_
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
	callq	__ZN6MatrixeqERKS_
	xorb	$-1, %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6Matrix8get_rowsEv  ## -- Begin function _ZN6Matrix8get_rowsEv
	.p2align	4, 0x90
__ZN6Matrix8get_rowsEv:                 ## @_ZN6Matrix8get_rowsEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movl	8(%rdi), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6Matrix8get_colsEv  ## -- Begin function _ZN6Matrix8get_colsEv
	.p2align	4, 0x90
__ZN6Matrix8get_colsEv:                 ## @_ZN6Matrix8get_colsEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movl	12(%rdi), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN6MatrixixEj         ## -- Begin function _ZN6MatrixixEj
	.p2align	4, 0x90
__ZN6MatrixixEj:                        ## @_ZN6MatrixixEj
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rdi
	movl	-12(%rbp), %esi
	movl	%esi, %eax
	shlq	$4, %rax
	addq	%rax, %rdi
	movq	%rdi, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
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
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ## -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_definition	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
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
	subq	$160, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rsi
Ltmp35:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp36:
	jmp	LBB35_1
LBB35_1:
Ltmp37:
	leaq	-40(%rbp), %rdi
	callq	__ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbEv
Ltmp38:
	movb	%al, -73(%rbp)          ## 1-byte Spill
	jmp	LBB35_2
LBB35_2:
	movb	-73(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB35_3
	jmp	LBB35_15
LBB35_3:
	movq	-8(%rbp), %rsi
	leaq	-72(%rbp), %rdi
	callq	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1ERNS_13basic_ostreamIcS2_EE
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	addq	%rax, %rdi
Ltmp39:
	movq	%rsi, -88(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__18ios_base5flagsEv
Ltmp40:
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	jmp	LBB35_4
LBB35_4:
	movl	-92(%rbp), %eax         ## 4-byte Reload
	andl	$176, %eax
	cmpl	$32, %eax
	jne	LBB35_6
## %bb.5:
	movq	-16(%rbp), %rax
	addq	-24(%rbp), %rax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	jmp	LBB35_7
LBB35_6:
	movq	-16(%rbp), %rax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
LBB35_7:
	movq	-104(%rbp), %rax        ## 8-byte Reload
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rdx
	addq	%rdx, %rcx
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	-24(%rsi), %rsi
	addq	%rsi, %rdx
Ltmp41:
	movq	%rdx, %rdi
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	movq	%rcx, -120(%rbp)        ## 8-byte Spill
	movq	%rdx, -128(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv
Ltmp42:
	movb	%al, -129(%rbp)         ## 1-byte Spill
	jmp	LBB35_8
LBB35_8:
	movq	-72(%rbp), %rdi
Ltmp43:
	movb	-129(%rbp), %al         ## 1-byte Reload
	movsbl	%al, %r9d
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	movq	-112(%rbp), %rdx        ## 8-byte Reload
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	-128(%rbp), %r8         ## 8-byte Reload
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp44:
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	jmp	LBB35_9
LBB35_9:
	movq	-144(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -64(%rbp)
	leaq	-64(%rbp), %rdi
	callq	__ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedEv
	testb	$1, %al
	jne	LBB35_10
	jmp	LBB35_14
LBB35_10:
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rax
Ltmp45:
	movl	$5, %esi
	movq	%rax, %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj
Ltmp46:
	jmp	LBB35_11
LBB35_11:
	jmp	LBB35_14
LBB35_12:
Ltmp52:
	movl	%edx, %ecx
	movq	%rax, -48(%rbp)
	movl	%ecx, -52(%rbp)
	jmp	LBB35_18
LBB35_13:
Ltmp47:
	movl	%edx, %ecx
	movq	%rax, -48(%rbp)
	movl	%ecx, -52(%rbp)
Ltmp48:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp49:
	jmp	LBB35_17
LBB35_14:
	jmp	LBB35_15
LBB35_15:
Ltmp50:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp51:
	jmp	LBB35_16
LBB35_16:
	jmp	LBB35_20
LBB35_17:
	jmp	LBB35_18
LBB35_18:
	movq	-48(%rbp), %rdi
	callq	___cxa_begin_catch
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rdi
Ltmp53:
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp54:
	jmp	LBB35_19
LBB35_19:
	callq	___cxa_end_catch
LBB35_20:
	movq	-8(%rbp), %rax
	addq	$160, %rsp
	popq	%rbp
	retq
LBB35_21:
Ltmp55:
	movl	%edx, %ecx
	movq	%rax, -48(%rbp)
	movl	%ecx, -52(%rbp)
Ltmp56:
	callq	___cxa_end_catch
Ltmp57:
	jmp	LBB35_22
LBB35_22:
	jmp	LBB35_23
LBB35_23:
	movq	-48(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB35_24:
Ltmp58:
	movq	%rax, %rdi
	movq	%rdx, -160(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table35:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase5-Lttbaseref5
Lttbaseref5:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Ltmp35-Lfunc_begin5    ## >> Call Site 1 <<
	.uleb128 Ltmp36-Ltmp35          ##   Call between Ltmp35 and Ltmp36
	.uleb128 Ltmp52-Lfunc_begin5    ##     jumps to Ltmp52
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp37-Lfunc_begin5    ## >> Call Site 2 <<
	.uleb128 Ltmp46-Ltmp37          ##   Call between Ltmp37 and Ltmp46
	.uleb128 Ltmp47-Lfunc_begin5    ##     jumps to Ltmp47
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp48-Lfunc_begin5    ## >> Call Site 3 <<
	.uleb128 Ltmp49-Ltmp48          ##   Call between Ltmp48 and Ltmp49
	.uleb128 Ltmp58-Lfunc_begin5    ##     jumps to Ltmp58
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp50-Lfunc_begin5    ## >> Call Site 4 <<
	.uleb128 Ltmp51-Ltmp50          ##   Call between Ltmp50 and Ltmp51
	.uleb128 Ltmp52-Lfunc_begin5    ##     jumps to Ltmp52
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp51-Lfunc_begin5    ## >> Call Site 5 <<
	.uleb128 Ltmp53-Ltmp51          ##   Call between Ltmp51 and Ltmp53
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp53-Lfunc_begin5    ## >> Call Site 6 <<
	.uleb128 Ltmp54-Ltmp53          ##   Call between Ltmp53 and Ltmp54
	.uleb128 Ltmp55-Lfunc_begin5    ##     jumps to Ltmp55
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp54-Lfunc_begin5    ## >> Call Site 7 <<
	.uleb128 Ltmp56-Ltmp54          ##   Call between Ltmp54 and Ltmp56
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp56-Lfunc_begin5    ## >> Call Site 8 <<
	.uleb128 Ltmp57-Ltmp56          ##   Call between Ltmp56 and Ltmp57
	.uleb128 Ltmp58-Lfunc_begin5    ##     jumps to Ltmp58
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp57-Lfunc_begin5    ## >> Call Site 9 <<
	.uleb128 Lfunc_end5-Ltmp57      ##   Call between Ltmp57 and Lfunc_end5
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end5:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase5:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbEv
__ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbEv: ## @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movb	(%rdi), %al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_ ## -- Begin function _ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_definition	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.p2align	4, 0x90
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ## @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
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
	subq	$240, %rsp
	movb	%r9b, %al
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	movq	%r8, -48(%rbp)
	movb	%al, -49(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rcx, -168(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -64(%rbp)
	leaq	-64(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
	movq	-168(%rbp), %rcx        ## 8-byte Reload
	cmpq	%rax, %rcx
	jne	LBB37_2
## %bb.1:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB37_25
LBB37_2:
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -72(%rbp)
	movq	-48(%rbp), %rdi
	callq	__ZNKSt3__18ios_base5widthEv
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	cmpq	-72(%rbp), %rax
	jle	LBB37_4
## %bb.3:
	movq	-72(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	%rax, %rcx
	movq	%rcx, -80(%rbp)
	jmp	LBB37_5
LBB37_4:
	movq	$0, -80(%rbp)
LBB37_5:
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jle	LBB37_9
## %bb.6:
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movq	-88(%rbp), %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl
	cmpq	-88(%rbp), %rax
	je	LBB37_8
## %bb.7:
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -96(%rbp)
	leaq	-96(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB37_25
LBB37_8:
	jmp	LBB37_9
LBB37_9:
	cmpq	$0, -80(%rbp)
	jle	LBB37_20
## %bb.10:
	movq	-80(%rbp), %rsi
	movsbl	-49(%rbp), %edx
	leaq	-120(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -176(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc
	movq	-16(%rbp), %rdi
	movq	-176(%rbp), %rax        ## 8-byte Reload
	movq	%rdi, -184(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv
	movq	-80(%rbp), %rdx
Ltmp59:
	movq	-184(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl
Ltmp60:
	movq	%rax, -192(%rbp)        ## 8-byte Spill
	jmp	LBB37_11
LBB37_11:
	movq	-192(%rbp), %rax        ## 8-byte Reload
	cmpq	-80(%rbp), %rax
	je	LBB37_16
## %bb.12:
Ltmp61:
	callq	__ZNSt3__1L15__get_nullptr_tEv
Ltmp62:
	movq	%rax, -200(%rbp)        ## 8-byte Spill
	jmp	LBB37_13
LBB37_13:
	movq	-200(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -144(%rbp)
Ltmp63:
	leaq	-144(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
Ltmp64:
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	jmp	LBB37_14
LBB37_14:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movl	$1, -148(%rbp)
	jmp	LBB37_17
LBB37_15:
Ltmp65:
	movl	%edx, %ecx
	movq	%rax, -128(%rbp)
	movl	%ecx, -132(%rbp)
Ltmp66:
	leaq	-120(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp67:
	jmp	LBB37_19
LBB37_16:
	movl	$0, -148(%rbp)
LBB37_17:
	leaq	-120(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	movl	-148(%rbp), %eax
	testl	%eax, %eax
	movl	%eax, -212(%rbp)        ## 4-byte Spill
	je	LBB37_18
	jmp	LBB37_29
LBB37_29:
	movl	-212(%rbp), %eax        ## 4-byte Reload
	subl	$1, %eax
	movl	%eax, -216(%rbp)        ## 4-byte Spill
	je	LBB37_25
	jmp	LBB37_28
LBB37_18:
	jmp	LBB37_20
LBB37_19:
	jmp	LBB37_26
LBB37_20:
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jle	LBB37_24
## %bb.21:
	movq	-16(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movq	-88(%rbp), %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl
	cmpq	-88(%rbp), %rax
	je	LBB37_23
## %bb.22:
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -160(%rbp)
	leaq	-160(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB37_25
LBB37_23:
	jmp	LBB37_24
LBB37_24:
	xorl	%eax, %eax
	movl	%eax, %esi
	movq	-48(%rbp), %rdi
	callq	__ZNSt3__18ios_base5widthEl
	movq	-16(%rbp), %rsi
	movq	%rsi, -8(%rbp)
	movq	%rax, -224(%rbp)        ## 8-byte Spill
LBB37_25:
	movq	-8(%rbp), %rax
	addq	$240, %rsp
	popq	%rbp
	retq
LBB37_26:
	movq	-128(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB37_27:
Ltmp68:
	movq	%rax, %rdi
	movq	%rdx, -232(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
LBB37_28:
	ud2
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table37:
Lexception6:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase6-Lttbaseref6
Lttbaseref6:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Lfunc_begin6-Lfunc_begin6 ## >> Call Site 1 <<
	.uleb128 Ltmp59-Lfunc_begin6    ##   Call between Lfunc_begin6 and Ltmp59
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp59-Lfunc_begin6    ## >> Call Site 2 <<
	.uleb128 Ltmp64-Ltmp59          ##   Call between Ltmp59 and Ltmp64
	.uleb128 Ltmp65-Lfunc_begin6    ##     jumps to Ltmp65
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp66-Lfunc_begin6    ## >> Call Site 3 <<
	.uleb128 Ltmp67-Ltmp66          ##   Call between Ltmp66 and Ltmp67
	.uleb128 Ltmp68-Lfunc_begin6    ##     jumps to Ltmp68
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp67-Lfunc_begin6    ## >> Call Site 4 <<
	.uleb128 Lfunc_end6-Ltmp67      ##   Call between Ltmp67 and Lfunc_end6
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end6:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase6:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1ERNS_13basic_ostreamIcS2_EE
__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1ERNS_13basic_ostreamIcS2_EE: ## @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1ERNS_13basic_ostreamIcS2_EE
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
	callq	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2ERNS_13basic_ostreamIcS2_EE
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__18ios_base5flagsEv
__ZNKSt3__18ios_base5flagsEv:           ## @_ZNKSt3__18ios_base5flagsEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movl	8(%rdi), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv
__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv: ## @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv
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
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movl	144(%rdi), %esi
	movl	%eax, %edi
	callq	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	testb	$1, %al
	jne	LBB40_1
	jmp	LBB40_2
LBB40_1:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movl	$32, %esi
	callq	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc
	movsbl	%al, %esi
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movl	%esi, 144(%rdi)
LBB40_2:
	movq	-16(%rbp), %rax         ## 8-byte Reload
	movl	144(%rax), %ecx
	movb	%cl, %dl
	movsbl	%dl, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedEv
__ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedEv: ## @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	cmpq	$0, (%rdi)
	sete	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj
__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj: ## @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	callq	__ZNSt3__18ios_base8setstateEj
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
__ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv: ## @_ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
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
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__18ios_base5widthEv
__ZNKSt3__18ios_base5widthEv:           ## @_ZNKSt3__18ios_base5widthEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	24(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl
__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl: ## @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl
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
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdi
	movq	(%rdx), %rax
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	movq	%rdx, %rdi
	movq	-32(%rbp), %rdx         ## 8-byte Reload
	callq	*96(%rax)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc: ## @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1Emc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movb	%dl, %al
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movb	%al, -17(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movsbl	-17(%rbp), %edx
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2Emc
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv: ## @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataEv
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
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerEv
	movq	%rax, %rdi
	callq	__ZNSt3__1L16__to_raw_pointerIKcEEPT_S3_
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__18ios_base5widthEl
__ZNSt3__18ios_base5widthEl:            ## @_ZNSt3__18ios_base5widthEl
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
	movq	24(%rsi), %rdi
	movq	%rdi, -24(%rbp)
	movq	-16(%rbp), %rdi
	movq	%rdi, 24(%rsi)
	movq	-24(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2Emc
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2Emc: ## @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2Emc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movb	%dl, %al
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movb	%al, -17(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, %rdi
	movq	%rsi, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1Ev
	movq	-16(%rbp), %rsi
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	movsbl	-17(%rbp), %edx
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1Ev
__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1Ev: ## @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1Ev
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
	callq	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2Ev
__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2Ev: ## @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2Ev
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
	movq	%rdi, %rax
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2Ev
	movq	-16(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2Ev
__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2Ev: ## @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	xorl	%esi, %esi
	movl	$24, %eax
	movl	%eax, %edx
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_memset
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2Ev
__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2Ev: ## @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2Ev
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
	callq	__ZNSt3__19allocatorIcEC2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__19allocatorIcEC2Ev
__ZNSt3__19allocatorIcEC2Ev:            ## @_ZNSt3__19allocatorIcEC2Ev
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L16__to_raw_pointerIKcEEPT_S3_
__ZNSt3__1L16__to_raw_pointerIKcEEPT_S3_: ## @_ZNSt3__1L16__to_raw_pointerIKcEEPT_S3_
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
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerEv
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerEv: ## @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerEv
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
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv
	testb	$1, %al
	jne	LBB56_1
	jmp	LBB56_2
LBB56_1:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	jmp	LBB56_3
LBB56_2:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv
	movq	%rax, -24(%rbp)         ## 8-byte Spill
LBB56_3:
	movq	-24(%rbp), %rax         ## 8-byte Reload
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv: ## @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longEv
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
	callq	__ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv
	movzbl	(%rax), %ecx
	movl	%ecx, %eax
	andq	$1, %rax
	cmpq	$0, %rax
	setne	%dl
	andb	$1, %dl
	movzbl	%dl, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv: ## @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv
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
	callq	__ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv
	movq	16(%rax), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv: ## @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv
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
	callq	__ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv
	addq	$1, %rax
	movq	%rax, %rdi
	callq	__ZNSt3__114pointer_traitsIPKcE10pointer_toERS1_
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv
__ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv: ## @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstEv
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
	callq	__ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv
__ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv: ## @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getEv
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__114pointer_traitsIPKcE10pointer_toERS1_
__ZNSt3__114pointer_traitsIPKcE10pointer_toERS1_: ## @_ZNSt3__114pointer_traitsIPKcE10pointer_toERS1_
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
	callq	__ZNSt3__1L9addressofIKcEEPT_RS2_
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L9addressofIKcEEPT_RS2_
__ZNSt3__1L9addressofIKcEEPT_RS2_:      ## @_ZNSt3__1L9addressofIKcEEPT_RS2_
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2ERNS_13basic_ostreamIcS2_EE
__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2ERNS_13basic_ostreamIcS2_EE: ## @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2ERNS_13basic_ostreamIcS2_EE
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
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdi
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	addq	%rax, %rdi
Ltmp69:
	movq	%rsi, -40(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv
Ltmp70:
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	jmp	LBB64_1
LBB64_1:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%rax)
	addq	$48, %rsp
	popq	%rbp
	retq
LBB64_2:
Ltmp71:
	movl	%edx, %ecx
	movq	%rax, -24(%rbp)
	movl	%ecx, -28(%rbp)
## %bb.3:
	movq	-24(%rbp), %rdi
	callq	___cxa_call_unexpected
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table64:
Lexception7:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase7-Lttbaseref7
Lttbaseref7:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Ltmp69-Lfunc_begin7    ## >> Call Site 1 <<
	.uleb128 Ltmp70-Ltmp69          ##   Call between Ltmp69 and Ltmp70
	.uleb128 Ltmp71-Lfunc_begin7    ##     jumps to Ltmp71
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp70-Lfunc_begin7    ## >> Call Site 2 <<
	.uleb128 Lfunc_end7-Ltmp70      ##   Call between Ltmp70 and Lfunc_end7
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end7:
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
	.p2align	2
Lttbase7:
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv
__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv: ## @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv
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
	callq	__ZNKSt3__18ios_base5rdbufEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__18ios_base5rdbufEv
__ZNKSt3__18ios_base5rdbufEv:           ## @_ZNKSt3__18ios_base5rdbufEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	40(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__111char_traitsIcE11eq_int_typeEii ## -- Begin function _ZNSt3__111char_traitsIcE11eq_int_typeEii
	.weak_definition	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	.p2align	4, 0x90
__ZNSt3__111char_traitsIcE11eq_int_typeEii: ## @_ZNSt3__111char_traitsIcE11eq_int_typeEii
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %esi
	cmpl	-8(%rbp), %esi
	sete	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__111char_traitsIcE3eofEv ## -- Begin function _ZNSt3__111char_traitsIcE3eofEv
	.weak_definition	__ZNSt3__111char_traitsIcE3eofEv
	.p2align	4, 0x90
__ZNSt3__111char_traitsIcE3eofEv:       ## @_ZNSt3__111char_traitsIcE3eofEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$4294967295, %eax       ## imm = 0xFFFFFFFF
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc
__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc: ## @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc
Lfunc_begin8:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception8
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movb	%sil, %al
	movq	%rdi, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rsi
	leaq	-24(%rbp), %rdi
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp72:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE
Ltmp73:
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	jmp	LBB69_1
LBB69_1:
	movsbl	-9(%rbp), %esi
Ltmp74:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__15ctypeIcE5widenEc
Ltmp75:
	movb	%al, -57(%rbp)          ## 1-byte Spill
	jmp	LBB69_2
LBB69_2:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movb	-57(%rbp), %al          ## 1-byte Reload
	movsbl	%al, %eax
	addq	$80, %rsp
	popq	%rbp
	retq
LBB69_3:
Ltmp76:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
Ltmp77:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp78:
	jmp	LBB69_4
LBB69_4:
	jmp	LBB69_5
LBB69_5:
	movq	-32(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB69_6:
Ltmp79:
	movq	%rax, %rdi
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end8:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table69:
Lexception8:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase8-Lttbaseref8
Lttbaseref8:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end8-Lcst_begin8
Lcst_begin8:
	.uleb128 Lfunc_begin8-Lfunc_begin8 ## >> Call Site 1 <<
	.uleb128 Ltmp72-Lfunc_begin8    ##   Call between Lfunc_begin8 and Ltmp72
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp72-Lfunc_begin8    ## >> Call Site 2 <<
	.uleb128 Ltmp75-Ltmp72          ##   Call between Ltmp72 and Ltmp75
	.uleb128 Ltmp76-Lfunc_begin8    ##     jumps to Ltmp76
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp75-Lfunc_begin8    ## >> Call Site 3 <<
	.uleb128 Ltmp77-Ltmp75          ##   Call between Ltmp75 and Ltmp77
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp77-Lfunc_begin8    ## >> Call Site 4 <<
	.uleb128 Ltmp78-Ltmp77          ##   Call between Ltmp77 and Ltmp78
	.uleb128 Ltmp79-Lfunc_begin8    ##     jumps to Ltmp79
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp78-Lfunc_begin8    ## >> Call Site 5 <<
	.uleb128 Lfunc_end8-Ltmp78      ##   Call between Ltmp78 and Lfunc_end8
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end8:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase8:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE
__ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE: ## @_ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__15ctypeIcE5widenEc
__ZNKSt3__15ctypeIcE5widenEc:           ## @_ZNKSt3__15ctypeIcE5widenEc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movb	%sil, %al
	movq	%rdi, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rdi
	movb	-9(%rbp), %al
	movq	(%rdi), %rcx
	movsbl	%al, %esi
	callq	*56(%rcx)
	movsbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__18ios_base8setstateEj
__ZNSt3__18ios_base8setstateEj:         ## @_ZNSt3__18ios_base8setstateEj
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rdi
	movl	32(%rdi), %esi
	orl	-12(%rbp), %esi
	callq	__ZNSt3__18ios_base5clearEj
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
