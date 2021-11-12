	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	__Z5rdtscv              ## -- Begin function _Z5rdtscv
	.p2align	4, 0x90
__Z5rdtscv:                             ## @_Z5rdtscv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	## InlineAsm Start
	rdtsc
	## InlineAsm End
	movl	%eax, -4(%rbp)
	movl	%edx, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %ecx
	shlq	$32, %rcx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	orq	%rsi, %rcx
	movq	%rcx, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z12time_measureRNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEEjjj ## -- Begin function _Z12time_measureRNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEEjjj
	.p2align	4, 0x90
__Z12time_measureRNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEEjjj: ## @_Z12time_measureRNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEEjjj
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
	subq	$288, %rsp              ## imm = 0x120
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -40(%rbp)
	movl	$100, -44(%rbp)
	movq	-8(%rbp), %rdi
	leaq	L_.str(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movl	$2, -48(%rbp)
	movq	%rax, -208(%rbp)        ## 8-byte Spill
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$8, -48(%rbp)
	ja	LBB1_4
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movl	-48(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
	movq	%rax, -216(%rbp)        ## 8-byte Spill
## %bb.3:                               ##   in Loop: Header=BB1_1 Depth=1
	movl	-48(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -48(%rbp)
	jmp	LBB1_1
LBB1_4:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	leaq	L_.str.2(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movq	%rax, %rdi
	leaq	__ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
	movl	-12(%rbp), %ecx
	movl	%ecx, -52(%rbp)
	movq	%rax, -224(%rbp)        ## 8-byte Spill
LBB1_5:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_7 Depth 2
                                        ##       Child Loop BB1_9 Depth 3
                                        ##     Child Loop BB1_31 Depth 2
	movl	-52(%rbp), %eax
	cmpl	-16(%rbp), %eax
	ja	LBB1_52
## %bb.6:                               ##   in Loop: Header=BB1_5 Depth=1
	movq	-8(%rbp), %rax
	movl	-52(%rbp), %esi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
	movl	$2, -56(%rbp)
	movq	%rax, -232(%rbp)        ## 8-byte Spill
LBB1_7:                                 ##   Parent Loop BB1_5 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_9 Depth 3
	cmpl	$8, -56(%rbp)
	ja	LBB1_30
## %bb.8:                               ##   in Loop: Header=BB1_7 Depth=2
	movq	$0, -64(%rbp)
	movl	$0, -68(%rbp)
LBB1_9:                                 ##   Parent Loop BB1_5 Depth=1
                                        ##     Parent Loop BB1_7 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	-68(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jae	LBB1_28
## %bb.10:                              ##   in Loop: Header=BB1_9 Depth=3
	movl	-52(%rbp), %eax
	leaq	-88(%rbp), %rdi
	movl	%eax, %esi
	movl	%eax, %edx
	callq	__ZN6MatrixC1Ejj
	movl	-52(%rbp), %eax
Ltmp25:
	leaq	-104(%rbp), %rdi
	movl	%eax, %esi
	movl	%eax, %edx
	callq	__ZN6MatrixC1Ejj
Ltmp26:
	jmp	LBB1_11
LBB1_11:                                ##   in Loop: Header=BB1_9 Depth=3
Ltmp27:
	leaq	-88(%rbp), %rdi
	movl	$-10, %esi
	movl	$10, %edx
	callq	__ZN6Matrix9randomizeEii
Ltmp28:
	jmp	LBB1_12
LBB1_12:                                ##   in Loop: Header=BB1_9 Depth=3
Ltmp29:
	leaq	-104(%rbp), %rdi
	movl	$-10, %esi
	movl	$10, %edx
	callq	__ZN6Matrix9randomizeEii
Ltmp30:
	jmp	LBB1_13
LBB1_13:                                ##   in Loop: Header=BB1_9 Depth=3
Ltmp31:
	callq	__Z5rdtscv
Ltmp32:
	movq	%rax, -240(%rbp)        ## 8-byte Spill
	jmp	LBB1_14
LBB1_14:                                ##   in Loop: Header=BB1_9 Depth=3
	movq	-240(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -32(%rbp)
	movl	-56(%rbp), %ecx
Ltmp33:
	leaq	-136(%rbp), %rdi
	leaq	-88(%rbp), %rsi
	leaq	-104(%rbp), %rdx
	callq	__Z24multiply_vinograd_threadR6MatrixS0_j
Ltmp34:
	jmp	LBB1_15
LBB1_15:                                ##   in Loop: Header=BB1_9 Depth=3
Ltmp35:
	callq	__Z5rdtscv
Ltmp36:
	movq	%rax, -248(%rbp)        ## 8-byte Spill
	jmp	LBB1_16
LBB1_16:                                ##   in Loop: Header=BB1_9 Depth=3
	movq	-248(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	subq	%rdx, %rcx
	movq	-64(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, -64(%rbp)
Ltmp40:
	leaq	-136(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp41:
	jmp	LBB1_17
LBB1_17:                                ##   in Loop: Header=BB1_9 Depth=3
Ltmp45:
	leaq	-104(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp46:
	jmp	LBB1_18
LBB1_18:                                ##   in Loop: Header=BB1_9 Depth=3
	leaq	-88(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
## %bb.19:                              ##   in Loop: Header=BB1_9 Depth=3
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	LBB1_9
LBB1_20:
Ltmp47:
	movl	%edx, %ecx
	movq	%rax, -112(%rbp)
	movl	%ecx, -116(%rbp)
	jmp	LBB1_26
LBB1_21:
Ltmp42:
	movl	%edx, %ecx
	movq	%rax, -112(%rbp)
	movl	%ecx, -116(%rbp)
	jmp	LBB1_24
LBB1_22:
Ltmp37:
	movl	%edx, %ecx
	movq	%rax, -112(%rbp)
	movl	%ecx, -116(%rbp)
Ltmp38:
	leaq	-136(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp39:
	jmp	LBB1_23
LBB1_23:
	jmp	LBB1_24
LBB1_24:
Ltmp43:
	leaq	-104(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp44:
	jmp	LBB1_25
LBB1_25:
	jmp	LBB1_26
LBB1_26:
Ltmp48:
	leaq	-88(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp49:
	jmp	LBB1_27
LBB1_27:
	jmp	LBB1_53
LBB1_28:                                ##   in Loop: Header=BB1_7 Depth=2
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	movq	-64(%rbp), %rax
	xorl	%edx, %edx
                                        ## kill: def $rdx killed $edx
	divq	%rcx
	movq	%rax, -64(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movq	-64(%rbp), %rsi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEy
	movq	%rax, -256(%rbp)        ## 8-byte Spill
## %bb.29:                              ##   in Loop: Header=BB1_7 Depth=2
	movl	-56(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -56(%rbp)
	jmp	LBB1_7
LBB1_30:                                ##   in Loop: Header=BB1_5 Depth=1
	movq	$0, -144(%rbp)
	movl	$0, -148(%rbp)
LBB1_31:                                ##   Parent Loop BB1_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-148(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jae	LBB1_50
## %bb.32:                              ##   in Loop: Header=BB1_31 Depth=2
	movl	-52(%rbp), %eax
	leaq	-168(%rbp), %rdi
	movl	%eax, %esi
	movl	%eax, %edx
	callq	__ZN6MatrixC1Ejj
	movl	-52(%rbp), %eax
Ltmp0:
	leaq	-184(%rbp), %rdi
	movl	%eax, %esi
	movl	%eax, %edx
	callq	__ZN6MatrixC1Ejj
Ltmp1:
	jmp	LBB1_33
LBB1_33:                                ##   in Loop: Header=BB1_31 Depth=2
Ltmp2:
	leaq	-168(%rbp), %rdi
	movl	$-10, %esi
	movl	$10, %edx
	callq	__ZN6Matrix9randomizeEii
Ltmp3:
	jmp	LBB1_34
LBB1_34:                                ##   in Loop: Header=BB1_31 Depth=2
Ltmp4:
	leaq	-184(%rbp), %rdi
	movl	$-10, %esi
	movl	$10, %edx
	callq	__ZN6Matrix9randomizeEii
Ltmp5:
	jmp	LBB1_35
LBB1_35:                                ##   in Loop: Header=BB1_31 Depth=2
Ltmp6:
	callq	__Z5rdtscv
Ltmp7:
	movq	%rax, -264(%rbp)        ## 8-byte Spill
	jmp	LBB1_36
LBB1_36:                                ##   in Loop: Header=BB1_31 Depth=2
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -32(%rbp)
Ltmp8:
	leaq	-200(%rbp), %rdi
	leaq	-168(%rbp), %rsi
	leaq	-184(%rbp), %rdx
	callq	__Z26multiply_vinograd_nothreadR6MatrixS0_
Ltmp9:
	jmp	LBB1_37
LBB1_37:                                ##   in Loop: Header=BB1_31 Depth=2
Ltmp10:
	callq	__Z5rdtscv
Ltmp11:
	movq	%rax, -272(%rbp)        ## 8-byte Spill
	jmp	LBB1_38
LBB1_38:                                ##   in Loop: Header=BB1_31 Depth=2
	movq	-272(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	subq	%rdx, %rcx
	movq	-144(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rdx, -144(%rbp)
Ltmp15:
	leaq	-200(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp16:
	jmp	LBB1_39
LBB1_39:                                ##   in Loop: Header=BB1_31 Depth=2
Ltmp20:
	leaq	-184(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp21:
	jmp	LBB1_40
LBB1_40:                                ##   in Loop: Header=BB1_31 Depth=2
	leaq	-168(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
## %bb.41:                              ##   in Loop: Header=BB1_31 Depth=2
	movl	-148(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -148(%rbp)
	jmp	LBB1_31
LBB1_42:
Ltmp22:
	movl	%edx, %ecx
	movq	%rax, -112(%rbp)
	movl	%ecx, -116(%rbp)
	jmp	LBB1_48
LBB1_43:
Ltmp17:
	movl	%edx, %ecx
	movq	%rax, -112(%rbp)
	movl	%ecx, -116(%rbp)
	jmp	LBB1_46
LBB1_44:
Ltmp12:
	movl	%edx, %ecx
	movq	%rax, -112(%rbp)
	movl	%ecx, -116(%rbp)
Ltmp13:
	leaq	-200(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp14:
	jmp	LBB1_45
LBB1_45:
	jmp	LBB1_46
LBB1_46:
Ltmp18:
	leaq	-184(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp19:
	jmp	LBB1_47
LBB1_47:
	jmp	LBB1_48
LBB1_48:
Ltmp23:
	leaq	-168(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp24:
	jmp	LBB1_49
LBB1_49:
	jmp	LBB1_53
LBB1_50:                                ##   in Loop: Header=BB1_5 Depth=1
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	movq	-144(%rbp), %rax
	xorl	%edx, %edx
                                        ## kill: def $rdx killed $edx
	divq	%rcx
	movq	%rax, -144(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movq	-144(%rbp), %rsi
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEy
	movq	%rax, %rdi
	leaq	__ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
	movq	%rax, -280(%rbp)        ## 8-byte Spill
## %bb.51:                              ##   in Loop: Header=BB1_5 Depth=1
	movl	-20(%rbp), %eax
	addl	-52(%rbp), %eax
	movl	%eax, -52(%rbp)
	jmp	LBB1_5
LBB1_52:
	addq	$288, %rsp              ## imm = 0x120
	popq	%rbp
	retq
LBB1_53:
	movq	-112(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB1_54:
Ltmp50:
	movq	%rax, %rdi
	movq	%rdx, -288(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table1:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0 ## >> Call Site 1 <<
	.uleb128 Ltmp25-Lfunc_begin0    ##   Call between Lfunc_begin0 and Ltmp25
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp25-Lfunc_begin0    ## >> Call Site 2 <<
	.uleb128 Ltmp26-Ltmp25          ##   Call between Ltmp25 and Ltmp26
	.uleb128 Ltmp47-Lfunc_begin0    ##     jumps to Ltmp47
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp27-Lfunc_begin0    ## >> Call Site 3 <<
	.uleb128 Ltmp34-Ltmp27          ##   Call between Ltmp27 and Ltmp34
	.uleb128 Ltmp42-Lfunc_begin0    ##     jumps to Ltmp42
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp35-Lfunc_begin0    ## >> Call Site 4 <<
	.uleb128 Ltmp36-Ltmp35          ##   Call between Ltmp35 and Ltmp36
	.uleb128 Ltmp37-Lfunc_begin0    ##     jumps to Ltmp37
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp40-Lfunc_begin0    ## >> Call Site 5 <<
	.uleb128 Ltmp41-Ltmp40          ##   Call between Ltmp40 and Ltmp41
	.uleb128 Ltmp42-Lfunc_begin0    ##     jumps to Ltmp42
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp45-Lfunc_begin0    ## >> Call Site 6 <<
	.uleb128 Ltmp46-Ltmp45          ##   Call between Ltmp45 and Ltmp46
	.uleb128 Ltmp47-Lfunc_begin0    ##     jumps to Ltmp47
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp46-Lfunc_begin0    ## >> Call Site 7 <<
	.uleb128 Ltmp38-Ltmp46          ##   Call between Ltmp46 and Ltmp38
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp38-Lfunc_begin0    ## >> Call Site 8 <<
	.uleb128 Ltmp49-Ltmp38          ##   Call between Ltmp38 and Ltmp49
	.uleb128 Ltmp50-Lfunc_begin0    ##     jumps to Ltmp50
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp49-Lfunc_begin0    ## >> Call Site 9 <<
	.uleb128 Ltmp0-Ltmp49           ##   Call between Ltmp49 and Ltmp0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0     ## >> Call Site 10 <<
	.uleb128 Ltmp1-Ltmp0            ##   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp22-Lfunc_begin0    ##     jumps to Ltmp22
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp2-Lfunc_begin0     ## >> Call Site 11 <<
	.uleb128 Ltmp9-Ltmp2            ##   Call between Ltmp2 and Ltmp9
	.uleb128 Ltmp17-Lfunc_begin0    ##     jumps to Ltmp17
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp10-Lfunc_begin0    ## >> Call Site 12 <<
	.uleb128 Ltmp11-Ltmp10          ##   Call between Ltmp10 and Ltmp11
	.uleb128 Ltmp12-Lfunc_begin0    ##     jumps to Ltmp12
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp15-Lfunc_begin0    ## >> Call Site 13 <<
	.uleb128 Ltmp16-Ltmp15          ##   Call between Ltmp15 and Ltmp16
	.uleb128 Ltmp17-Lfunc_begin0    ##     jumps to Ltmp17
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp20-Lfunc_begin0    ## >> Call Site 14 <<
	.uleb128 Ltmp21-Ltmp20          ##   Call between Ltmp20 and Ltmp21
	.uleb128 Ltmp22-Lfunc_begin0    ##     jumps to Ltmp22
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp21-Lfunc_begin0    ## >> Call Site 15 <<
	.uleb128 Ltmp13-Ltmp21          ##   Call between Ltmp21 and Ltmp13
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp13-Lfunc_begin0    ## >> Call Site 16 <<
	.uleb128 Ltmp24-Ltmp13          ##   Call between Ltmp13 and Ltmp24
	.uleb128 Ltmp50-Lfunc_begin0    ##     jumps to Ltmp50
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp24-Lfunc_begin0    ## >> Call Site 17 <<
	.uleb128 Lfunc_end0-Ltmp24      ##   Call between Ltmp24 and Lfunc_end0
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
	.globl	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc ## -- Begin function _ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.weak_definition	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.p2align	4, 0x90
__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc: ## @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
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
	movq	-16(%rbp), %rax
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__111char_traitsIcE6lengthEPKc
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	-32(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, %rdx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	addq	$32, %rsp
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
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
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
	subq	$1232, %rsp             ## imm = 0x4D0
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -1148(%rbp)
	xorl	%ecx, %ecx
	movl	%ecx, %edi
	callq	_time
	movl	%eax, %ecx
	movl	%ecx, %edi
	callq	_srand
	leaq	L_.str.3(%rip), %rsi
	leaq	-576(%rbp), %rax
	movl	$16, %edx
	movq	%rax, %rdi
	movq	%rax, -1176(%rbp)       ## 8-byte Spill
	callq	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEC1EPKcj
Ltmp51:
	movq	-1176(%rbp), %rdi       ## 8-byte Reload
	callq	__ZNKSt3__114basic_ofstreamIcNS_11char_traitsIcEEE7is_openEv
Ltmp52:
	movb	%al, -1177(%rbp)        ## 1-byte Spill
	jmp	LBB6_1
LBB6_1:
	movb	-1177(%rbp), %al        ## 1-byte Reload
	testb	$1, %al
	jne	LBB6_5
	jmp	LBB6_2
LBB6_2:
Ltmp53:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.4(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
Ltmp54:
	movq	%rax, -1192(%rbp)       ## 8-byte Spill
	jmp	LBB6_3
LBB6_3:
	movl	$-1, -1148(%rbp)
	movl	$1, -1168(%rbp)
	jmp	LBB6_19
LBB6_4:
Ltmp74:
	movl	%edx, %ecx
	movq	%rax, -1160(%rbp)
	movl	%ecx, -1164(%rbp)
	jmp	LBB6_21
LBB6_5:
Ltmp55:
	leaq	-576(%rbp), %rdi
	movl	$1000, %edx             ## imm = 0x3E8
	movl	$100, %eax
	movl	%eax, %esi
	movl	%eax, %ecx
	callq	__Z12time_measureRNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEEjjj
Ltmp56:
	jmp	LBB6_6
LBB6_6:
Ltmp57:
	leaq	-576(%rbp), %rdi
	callq	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEE5closeEv
Ltmp58:
	jmp	LBB6_7
LBB6_7:
Ltmp59:
	leaq	L_.str.5(%rip), %rsi
	leaq	-1144(%rbp), %rdi
	movl	$16, %edx
	callq	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEC1EPKcj
Ltmp60:
	jmp	LBB6_8
LBB6_8:
Ltmp61:
	leaq	-1144(%rbp), %rdi
	callq	__ZNKSt3__114basic_ofstreamIcNS_11char_traitsIcEEE7is_openEv
Ltmp62:
	movb	%al, -1193(%rbp)        ## 1-byte Spill
	jmp	LBB6_9
LBB6_9:
	movb	-1193(%rbp), %al        ## 1-byte Reload
	testb	$1, %al
	jne	LBB6_13
	jmp	LBB6_10
LBB6_10:
Ltmp63:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.4(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
Ltmp64:
	movq	%rax, -1208(%rbp)       ## 8-byte Spill
	jmp	LBB6_11
LBB6_11:
	movl	$-1, -1148(%rbp)
	movl	$1, -1168(%rbp)
	jmp	LBB6_16
LBB6_12:
Ltmp69:
	movl	%edx, %ecx
	movq	%rax, -1160(%rbp)
	movl	%ecx, -1164(%rbp)
Ltmp70:
	leaq	-1144(%rbp), %rdi
	callq	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
Ltmp71:
	jmp	LBB6_18
LBB6_13:
Ltmp65:
	leaq	-1144(%rbp), %rdi
	movl	$101, %esi
	movl	$1010, %edx             ## imm = 0x3F2
	movl	$100, %ecx
	callq	__Z12time_measureRNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEEjjj
Ltmp66:
	jmp	LBB6_14
LBB6_14:
Ltmp67:
	leaq	-1144(%rbp), %rdi
	callq	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEE5closeEv
Ltmp68:
	jmp	LBB6_15
LBB6_15:
	movl	$0, -1148(%rbp)
	movl	$1, -1168(%rbp)
LBB6_16:
Ltmp72:
	leaq	-1144(%rbp), %rdi
	callq	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
Ltmp73:
	jmp	LBB6_17
LBB6_17:
	jmp	LBB6_19
LBB6_18:
	jmp	LBB6_21
LBB6_19:
	leaq	-576(%rbp), %rdi
	callq	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
	movl	-1148(%rbp), %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rdi
	movq	(%rdi), %rdi
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rdi
	movl	%eax, -1212(%rbp)       ## 4-byte Spill
	jne	LBB6_25
## %bb.20:
	movl	-1212(%rbp), %eax       ## 4-byte Reload
	addq	$1232, %rsp             ## imm = 0x4D0
	popq	%rbp
	retq
LBB6_21:
Ltmp75:
	leaq	-576(%rbp), %rdi
	callq	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
Ltmp76:
	jmp	LBB6_22
LBB6_22:
	jmp	LBB6_23
LBB6_23:
	movq	-1160(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB6_24:
Ltmp77:
	movq	%rax, %rdi
	movq	%rdx, -1224(%rbp)       ## 8-byte Spill
	callq	___clang_call_terminate
LBB6_25:
	callq	___stack_chk_fail
	ud2
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table6:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1 ## >> Call Site 1 <<
	.uleb128 Ltmp51-Lfunc_begin1    ##   Call between Lfunc_begin1 and Ltmp51
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp51-Lfunc_begin1    ## >> Call Site 2 <<
	.uleb128 Ltmp60-Ltmp51          ##   Call between Ltmp51 and Ltmp60
	.uleb128 Ltmp74-Lfunc_begin1    ##     jumps to Ltmp74
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp61-Lfunc_begin1    ## >> Call Site 3 <<
	.uleb128 Ltmp64-Ltmp61          ##   Call between Ltmp61 and Ltmp64
	.uleb128 Ltmp69-Lfunc_begin1    ##     jumps to Ltmp69
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp70-Lfunc_begin1    ## >> Call Site 4 <<
	.uleb128 Ltmp71-Ltmp70          ##   Call between Ltmp70 and Ltmp71
	.uleb128 Ltmp77-Lfunc_begin1    ##     jumps to Ltmp77
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp65-Lfunc_begin1    ## >> Call Site 5 <<
	.uleb128 Ltmp68-Ltmp65          ##   Call between Ltmp65 and Ltmp68
	.uleb128 Ltmp69-Lfunc_begin1    ##     jumps to Ltmp69
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp72-Lfunc_begin1    ## >> Call Site 6 <<
	.uleb128 Ltmp73-Ltmp72          ##   Call between Ltmp72 and Ltmp73
	.uleb128 Ltmp74-Lfunc_begin1    ##     jumps to Ltmp74
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp73-Lfunc_begin1    ## >> Call Site 7 <<
	.uleb128 Ltmp75-Ltmp73          ##   Call between Ltmp73 and Ltmp75
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp75-Lfunc_begin1    ## >> Call Site 8 <<
	.uleb128 Ltmp76-Ltmp75          ##   Call between Ltmp75 and Ltmp76
	.uleb128 Ltmp77-Lfunc_begin1    ##     jumps to Ltmp77
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp76-Lfunc_begin1    ## >> Call Site 9 <<
	.uleb128 Lfunc_end1-Ltmp76      ##   Call between Ltmp76 and Lfunc_end1
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEC1EPKcj
__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEC1EPKcj: ## @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEC1EPKcj
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
	subq	$80, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, %rdi
	addq	$416, %rdi              ## imm = 0x1A0
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEEC2Ev
	movq	__ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE@GOTPCREL(%rip), %rsi
	movq	%rsi, %rdi
	addq	$24, %rdi
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	%rdi, (%rax)
	addq	$64, %rsi
	movq	%rsi, 416(%rax)
	addq	$8, %rax
Ltmp78:
	movq	__ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rdx
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEEC2EPNS_15basic_streambufIcS2_EE
Ltmp79:
	jmp	LBB7_1
LBB7_1:
	movq	__ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE@GOTPCREL(%rip), %rax
	movq	%rax, %rcx
	addq	$24, %rcx
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	movq	%rcx, (%rdx)
	addq	$64, %rax
	movq	%rax, 416(%rdx)
	addq	$8, %rdx
Ltmp81:
	movq	%rdx, %rdi
	movq	%rdx, -56(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC1Ev
Ltmp82:
	jmp	LBB7_2
LBB7_2:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	addq	$8, %rax
	movq	-16(%rbp), %rsi
	movl	-20(%rbp), %ecx
	orl	$16, %ecx
Ltmp84:
	movq	%rax, %rdi
	movl	%ecx, %edx
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openEPKcj
Ltmp85:
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	jmp	LBB7_3
LBB7_3:
	movq	-64(%rbp), %rax         ## 8-byte Reload
	cmpq	$0, %rax
	jne	LBB7_9
## %bb.4:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rax
Ltmp86:
	movl	$4, %esi
	movq	%rax, %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj
Ltmp87:
	jmp	LBB7_5
LBB7_5:
	jmp	LBB7_9
LBB7_6:
Ltmp80:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
	jmp	LBB7_13
LBB7_7:
Ltmp83:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
	jmp	LBB7_11
LBB7_8:
Ltmp88:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
Ltmp89:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev
Ltmp90:
	jmp	LBB7_10
LBB7_9:
	addq	$80, %rsp
	popq	%rbp
	retq
LBB7_10:
	jmp	LBB7_11
LBB7_11:
Ltmp91:
	movq	__ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE@GOTPCREL(%rip), %rax
	addq	$8, %rax
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
Ltmp92:
	jmp	LBB7_12
LBB7_12:
	jmp	LBB7_13
LBB7_13:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	addq	$416, %rax              ## imm = 0x1A0
Ltmp93:
	movq	%rax, %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
Ltmp94:
	jmp	LBB7_14
LBB7_14:
	jmp	LBB7_15
LBB7_15:
	movq	-32(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB7_16:
Ltmp95:
	movq	%rax, %rdi
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table7:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase2-Lttbaseref2
Lttbaseref2:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Lfunc_begin2-Lfunc_begin2 ## >> Call Site 1 <<
	.uleb128 Ltmp78-Lfunc_begin2    ##   Call between Lfunc_begin2 and Ltmp78
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp78-Lfunc_begin2    ## >> Call Site 2 <<
	.uleb128 Ltmp79-Ltmp78          ##   Call between Ltmp78 and Ltmp79
	.uleb128 Ltmp80-Lfunc_begin2    ##     jumps to Ltmp80
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp81-Lfunc_begin2    ## >> Call Site 3 <<
	.uleb128 Ltmp82-Ltmp81          ##   Call between Ltmp81 and Ltmp82
	.uleb128 Ltmp83-Lfunc_begin2    ##     jumps to Ltmp83
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp84-Lfunc_begin2    ## >> Call Site 4 <<
	.uleb128 Ltmp87-Ltmp84          ##   Call between Ltmp84 and Ltmp87
	.uleb128 Ltmp88-Lfunc_begin2    ##     jumps to Ltmp88
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp89-Lfunc_begin2    ## >> Call Site 5 <<
	.uleb128 Ltmp94-Ltmp89          ##   Call between Ltmp89 and Ltmp94
	.uleb128 Ltmp95-Lfunc_begin2    ##     jumps to Ltmp95
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp94-Lfunc_begin2    ## >> Call Site 6 <<
	.uleb128 Lfunc_end2-Ltmp94      ##   Call between Ltmp94 and Lfunc_end2
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
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__114basic_ofstreamIcNS_11char_traitsIcEEE7is_openEv
__ZNKSt3__114basic_ofstreamIcNS_11char_traitsIcEEE7is_openEv: ## @_ZNKSt3__114basic_ofstreamIcNS_11char_traitsIcEEE7is_openEv
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
	callq	__ZNKSt3__113basic_filebufIcNS_11char_traitsIcEEE7is_openEv
	andb	$1, %al
	movzbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEE5closeEv
__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEE5closeEv: ## @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEE5closeEv
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
	addq	$8, %rax
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv
	cmpq	$0, %rax
	jne	LBB9_2
## %bb.1:
	movq	-16(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rax
	movq	%rax, %rdi
	movl	$4, %esi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj
LBB9_2:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev ## -- Begin function _ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
	.p2align	4, 0x90
__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev: ## @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
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
	movq	-8(%rbp), %rdi
Ltmp96:
	movq	__ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE@GOTPCREL(%rip), %rsi
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED2Ev
Ltmp97:
	jmp	LBB10_1
LBB10_1:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	addq	$416, %rax              ## imm = 0x1A0
	movq	%rax, %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	addq	$48, %rsp
	popq	%rbp
	retq
LBB10_2:
Ltmp98:
	movl	%edx, %ecx
	movq	%rax, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movq	-32(%rbp), %rax         ## 8-byte Reload
	addq	$416, %rax              ## imm = 0x1A0
Ltmp99:
	movq	%rax, %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
Ltmp100:
	jmp	LBB10_3
LBB10_3:
	jmp	LBB10_4
LBB10_4:
	movq	-16(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB10_5:
Ltmp101:
	movq	%rax, %rdi
	movq	%rdx, -40(%rbp)         ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table10:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase3-Lttbaseref3
Lttbaseref3:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Ltmp96-Lfunc_begin3    ## >> Call Site 1 <<
	.uleb128 Ltmp97-Ltmp96          ##   Call between Ltmp96 and Ltmp97
	.uleb128 Ltmp98-Lfunc_begin3    ##     jumps to Ltmp98
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp97-Lfunc_begin3    ## >> Call Site 2 <<
	.uleb128 Ltmp99-Ltmp97          ##   Call between Ltmp97 and Ltmp99
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp99-Lfunc_begin3    ## >> Call Site 3 <<
	.uleb128 Ltmp100-Ltmp99         ##   Call between Ltmp99 and Ltmp100
	.uleb128 Ltmp101-Lfunc_begin3   ##     jumps to Ltmp101
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp100-Lfunc_begin3   ## >> Call Site 4 <<
	.uleb128 Lfunc_end3-Ltmp100     ##   Call between Ltmp100 and Lfunc_end3
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
	.globl	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED2Ev ## -- Begin function _ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED2Ev
	.weak_def_can_be_hidden	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED2Ev
	.p2align	4, 0x90
__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED2Ev: ## @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED2Ev
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
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdi
	movq	(%rdi), %rax
	movq	%rax, (%rsi)
	movq	24(%rdi), %rax
	movq	(%rsi), %rcx
	movq	-24(%rcx), %rcx
	movq	%rax, (%rsi,%rcx)
	movq	%rsi, %rax
	addq	$8, %rax
Ltmp102:
	movq	%rdi, -40(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev
Ltmp103:
	jmp	LBB11_1
LBB11_1:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	addq	$8, %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
	addq	$64, %rsp
	popq	%rbp
	retq
LBB11_2:
Ltmp104:
	movl	%edx, %ecx
	movq	%rax, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movq	-40(%rbp), %rax         ## 8-byte Reload
	addq	$8, %rax
Ltmp105:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
Ltmp106:
	jmp	LBB11_3
LBB11_3:
	jmp	LBB11_4
LBB11_4:
	movq	-24(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB11_5:
Ltmp107:
	movq	%rax, %rdi
	movq	%rdx, -56(%rbp)         ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table11:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase4-Lttbaseref4
Lttbaseref4:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Ltmp102-Lfunc_begin4   ## >> Call Site 1 <<
	.uleb128 Ltmp103-Ltmp102        ##   Call between Ltmp102 and Ltmp103
	.uleb128 Ltmp104-Lfunc_begin4   ##     jumps to Ltmp104
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp103-Lfunc_begin4   ## >> Call Site 2 <<
	.uleb128 Ltmp105-Ltmp103        ##   Call between Ltmp103 and Ltmp105
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp105-Lfunc_begin4   ## >> Call Site 3 <<
	.uleb128 Ltmp106-Ltmp105        ##   Call between Ltmp105 and Ltmp106
	.uleb128 Ltmp107-Lfunc_begin4   ##     jumps to Ltmp107
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp106-Lfunc_begin4   ## >> Call Site 4 <<
	.uleb128 Lfunc_end4-Ltmp106     ##   Call between Ltmp106 and Lfunc_end4
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
	.globl	__ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev ## -- Begin function _ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
	.weak_def_can_be_hidden	__ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
	.p2align	4, 0x90
__ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev: ## @_ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
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
	movq	-24(%rax), %rax
	addq	%rax, %rdi
	popq	%rbp
	jmp	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev ## -- Begin function _ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev
	.weak_def_can_be_hidden	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev
	.p2align	4, 0x90
__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev: ## @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev
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
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
Ltmp108:
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
Ltmp109:
	jmp	LBB13_1
LBB13_1:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	addq	$32, %rsp
	popq	%rbp
	retq
LBB13_2:
Ltmp110:
	movl	%edx, %ecx
	movq	%rax, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
## %bb.3:
	movq	-16(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table13:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Ltmp108-Lfunc_begin5   ## >> Call Site 1 <<
	.uleb128 Ltmp109-Ltmp108        ##   Call between Ltmp108 and Ltmp109
	.uleb128 Ltmp110-Lfunc_begin5   ##     jumps to Ltmp110
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp109-Lfunc_begin5   ## >> Call Site 2 <<
	.uleb128 Lfunc_end5-Ltmp109     ##   Call between Ltmp109 and Lfunc_end5
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end5:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev ## -- Begin function _ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev
	.weak_def_can_be_hidden	__ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev
	.p2align	4, 0x90
__ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev: ## @_ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev
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
	movq	-24(%rax), %rax
	addq	%rax, %rdi
	popq	%rbp
	jmp	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev
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
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
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
	subq	$80, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	__ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rax, (%rdi)
Ltmp111:
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv
Ltmp112:
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	jmp	LBB16_1
LBB16_1:
	jmp	LBB16_5
LBB16_2:
Ltmp113:
	movl	%edx, %ecx
	movq	%rax, -16(%rbp)
	movl	%ecx, -20(%rbp)
## %bb.3:
	movq	-16(%rbp), %rdi
	callq	___cxa_begin_catch
Ltmp114:
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	callq	___cxa_end_catch
Ltmp115:
	jmp	LBB16_4
LBB16_4:
	jmp	LBB16_5
LBB16_5:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	testb	$1, 400(%rax)
	je	LBB16_10
## %bb.6:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	64(%rax), %rcx
	cmpq	$0, %rcx
	movq	%rcx, -56(%rbp)         ## 8-byte Spill
	je	LBB16_8
## %bb.7:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
LBB16_8:
	jmp	LBB16_10
LBB16_9:
Ltmp116:
	movl	%edx, %ecx
	movq	%rax, -16(%rbp)
	movl	%ecx, -20(%rbp)
Ltmp117:
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
Ltmp118:
	jmp	LBB16_15
LBB16_10:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	testb	$1, 401(%rax)
	je	LBB16_14
## %bb.11:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	104(%rax), %rcx
	cmpq	$0, %rcx
	movq	%rcx, -64(%rbp)         ## 8-byte Spill
	je	LBB16_13
## %bb.12:
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
LBB16_13:
	jmp	LBB16_14
LBB16_14:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
	addq	$80, %rsp
	popq	%rbp
	retq
LBB16_15:
	jmp	LBB16_16
LBB16_16:
	movq	-16(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB16_17:
Ltmp119:
	movq	%rax, %rdi
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table16:
Lexception6:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase5-Lttbaseref5
Lttbaseref5:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Ltmp111-Lfunc_begin6   ## >> Call Site 1 <<
	.uleb128 Ltmp112-Ltmp111        ##   Call between Ltmp111 and Ltmp112
	.uleb128 Ltmp113-Lfunc_begin6   ##     jumps to Ltmp113
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp112-Lfunc_begin6   ## >> Call Site 2 <<
	.uleb128 Ltmp114-Ltmp112        ##   Call between Ltmp112 and Ltmp114
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp114-Lfunc_begin6   ## >> Call Site 3 <<
	.uleb128 Ltmp115-Ltmp114        ##   Call between Ltmp114 and Ltmp115
	.uleb128 Ltmp116-Lfunc_begin6   ##     jumps to Ltmp116
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp117-Lfunc_begin6   ## >> Call Site 4 <<
	.uleb128 Ltmp118-Ltmp117        ##   Call between Ltmp117 and Ltmp118
	.uleb128 Ltmp119-Lfunc_begin6   ##     jumps to Ltmp119
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp118-Lfunc_begin6   ## >> Call Site 5 <<
	.uleb128 Lfunc_end6-Ltmp118     ##   Call between Ltmp118 and Lfunc_end6
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end6:
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
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv
	.weak_definition	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv
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
	subq	$80, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	$0, -16(%rbp)
	cmpq	$0, 120(%rdi)
	movq	%rdi, -56(%rbp)         ## 8-byte Spill
	je	LBB17_11
## %bb.1:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -16(%rbp)
	movq	120(%rax), %rsi
	movq	_fclose@GOTPCREL(%rip), %rdx
	leaq	-32(%rbp), %rdi
	callq	__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EEC1ES2_S4_
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdx
	movq	48(%rdx), %rdx
Ltmp120:
	movq	%rax, %rdi
	callq	*%rdx
Ltmp121:
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	jmp	LBB17_2
LBB17_2:
	movl	-60(%rbp), %eax         ## 4-byte Reload
	cmpl	$0, %eax
	je	LBB17_5
## %bb.3:
	movq	$0, -16(%rbp)
	jmp	LBB17_5
LBB17_4:
Ltmp124:
	movl	%edx, %ecx
	movq	%rax, -40(%rbp)
	movl	%ecx, -44(%rbp)
Ltmp125:
	leaq	-32(%rbp), %rdi
	callq	__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EED1Ev
Ltmp126:
	jmp	LBB17_10
LBB17_5:
	leaq	-32(%rbp), %rdi
	callq	__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EE7releaseEv
Ltmp122:
	movq	%rax, %rdi
	callq	_fclose
Ltmp123:
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	jmp	LBB17_6
LBB17_6:
	movl	-64(%rbp), %eax         ## 4-byte Reload
	cmpl	$0, %eax
	jne	LBB17_8
## %bb.7:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	$0, 120(%rax)
	jmp	LBB17_9
LBB17_8:
	movq	$0, -16(%rbp)
LBB17_9:
	leaq	-32(%rbp), %rdi
	callq	__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EED1Ev
	jmp	LBB17_11
LBB17_10:
	jmp	LBB17_12
LBB17_11:
	movq	-16(%rbp), %rax
	addq	$80, %rsp
	popq	%rbp
	retq
LBB17_12:
	movq	-40(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB17_13:
Ltmp127:
	movq	%rax, %rdi
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table17:
Lexception7:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase6-Lttbaseref6
Lttbaseref6:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Lfunc_begin7-Lfunc_begin7 ## >> Call Site 1 <<
	.uleb128 Ltmp120-Lfunc_begin7   ##   Call between Lfunc_begin7 and Ltmp120
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp120-Lfunc_begin7   ## >> Call Site 2 <<
	.uleb128 Ltmp121-Ltmp120        ##   Call between Ltmp120 and Ltmp121
	.uleb128 Ltmp124-Lfunc_begin7   ##     jumps to Ltmp124
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp125-Lfunc_begin7   ## >> Call Site 3 <<
	.uleb128 Ltmp126-Ltmp125        ##   Call between Ltmp125 and Ltmp126
	.uleb128 Ltmp127-Lfunc_begin7   ##     jumps to Ltmp127
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp122-Lfunc_begin7   ## >> Call Site 4 <<
	.uleb128 Ltmp123-Ltmp122        ##   Call between Ltmp122 and Ltmp123
	.uleb128 Ltmp124-Lfunc_begin7   ##     jumps to Ltmp124
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp123-Lfunc_begin7   ## >> Call Site 5 <<
	.uleb128 Lfunc_end7-Ltmp123     ##   Call between Ltmp123 and Lfunc_end7
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end7:
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
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev
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
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
Ltmp128:
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev
Ltmp129:
	jmp	LBB18_1
LBB18_1:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
	addq	$32, %rsp
	popq	%rbp
	retq
LBB18_2:
Ltmp130:
	movl	%edx, %ecx
	movq	%rax, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZdlPv
## %bb.3:
	movq	-16(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end8:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table18:
Lexception8:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	255                     ## @TType Encoding = omit
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end8-Lcst_begin8
Lcst_begin8:
	.uleb128 Ltmp128-Lfunc_begin8   ## >> Call Site 1 <<
	.uleb128 Ltmp129-Ltmp128        ##   Call between Ltmp128 and Ltmp129
	.uleb128 Ltmp130-Lfunc_begin8   ##     jumps to Ltmp130
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp129-Lfunc_begin8   ## >> Call Site 2 <<
	.uleb128 Lfunc_end8-Ltmp129     ##   Call between Ltmp129 and Lfunc_end8
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end8:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE
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
	movq	(%rsi), %rdi
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	movq	%rsi, %rdi
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	%rsi, -40(%rbp)         ## 8-byte Spill
	callq	*48(%rax)
	movq	-16(%rbp), %rdi
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	callq	__ZNSt3__1L9use_facetINS_7codecvtIcc11__mbstate_tEEEERKT_RKNS_6localeE
	movq	-40(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, 128(%rsi)
	movb	402(%rsi), %cl
	andb	$1, %cl
	movb	%cl, -17(%rbp)
	movq	128(%rsi), %rdi
	callq	__ZNKSt3__17codecvtIcc11__mbstate_tE13always_noconvEv
	andb	$1, %al
	movq	-40(%rbp), %rsi         ## 8-byte Reload
	movb	%al, 402(%rsi)
	movb	-17(%rbp), %al
	andb	$1, %al
	movzbl	%al, %edx
	movb	402(%rsi), %al
	andb	$1, %al
	movzbl	%al, %r8d
	cmpl	%r8d, %edx
	je	LBB19_13
## %bb.1:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-40(%rbp), %rdx         ## 8-byte Reload
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%rcx, %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-40(%rbp), %rdx         ## 8-byte Reload
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%rcx, %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	testb	$1, 402(%rcx)
	je	LBB19_7
## %bb.2:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	testb	$1, 400(%rax)
	je	LBB19_6
## %bb.3:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	64(%rax), %rcx
	cmpq	$0, %rcx
	movq	%rcx, -56(%rbp)         ## 8-byte Spill
	je	LBB19_5
## %bb.4:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
LBB19_5:
	jmp	LBB19_6
LBB19_6:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movb	401(%rax), %cl
	andb	$1, %cl
	movb	%cl, 400(%rax)
	movq	112(%rax), %rdx
	movq	%rdx, 96(%rax)
	movq	104(%rax), %rdx
	movq	%rdx, 64(%rax)
	movq	$0, 112(%rax)
	movq	$0, 104(%rax)
	movb	$0, 401(%rax)
	jmp	LBB19_12
LBB19_7:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	testb	$1, 400(%rax)
	jne	LBB19_10
## %bb.8:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	64(%rax), %rcx
	addq	$88, %rax
	cmpq	%rax, %rcx
	je	LBB19_10
## %bb.9:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	96(%rax), %rcx
	movq	%rcx, 112(%rax)
	movq	64(%rax), %rcx
	movq	%rcx, 104(%rax)
	movb	$0, 401(%rax)
	movq	96(%rax), %rdi
	callq	__Znam
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 64(%rcx)
	movb	$1, 400(%rcx)
	jmp	LBB19_11
LBB19_10:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	96(%rax), %rcx
	movq	%rcx, 112(%rax)
	movq	112(%rax), %rdi
	callq	__Znam
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 104(%rcx)
	movb	$1, 401(%rcx)
LBB19_11:
	jmp	LBB19_12
LBB19_12:
	jmp	LBB19_13
LBB19_13:
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rsi, %rdi
	movq	%rcx, %rsi
	movq	%rdx, -40(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-40(%rbp), %rdx         ## 8-byte Reload
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%rcx, %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	testb	$1, 400(%rcx)
	je	LBB20_4
## %bb.1:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	64(%rax), %rcx
	cmpq	$0, %rcx
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	je	LBB20_3
## %bb.2:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
LBB20_3:
	jmp	LBB20_4
LBB20_4:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	testb	$1, 401(%rax)
	je	LBB20_8
## %bb.5:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	104(%rax), %rcx
	cmpq	$0, %rcx
	movq	%rcx, -56(%rbp)         ## 8-byte Spill
	je	LBB20_7
## %bb.6:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZdaPv
LBB20_7:
	jmp	LBB20_8
LBB20_8:
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 96(%rcx)
	cmpq	$8, 96(%rcx)
	jbe	LBB20_14
## %bb.9:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	testb	$1, 402(%rax)
	je	LBB20_12
## %bb.10:
	cmpq	$0, -16(%rbp)
	je	LBB20_12
## %bb.11:
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 64(%rcx)
	movb	$0, 400(%rcx)
	jmp	LBB20_13
LBB20_12:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	96(%rax), %rdi
	callq	__Znam
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, 64(%rdi)
	movb	$1, 400(%rdi)
LBB20_13:
	jmp	LBB20_15
LBB20_14:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	addq	$88, %rax
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 64(%rcx)
	movq	$8, 96(%rcx)
	movb	$0, 400(%rcx)
LBB20_15:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	testb	$1, 402(%rax)
	jne	LBB20_21
## %bb.16:
	movq	$8, -32(%rbp)
	leaq	-24(%rbp), %rdi
	leaq	-32(%rbp), %rsi
	callq	__ZNSt3__1L3maxIlEERKT_S3_S3_
	movq	(%rax), %rax
	movq	-40(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, 112(%rsi)
	cmpq	$0, -16(%rbp)
	je	LBB20_19
## %bb.17:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	cmpq	$8, 112(%rax)
	jb	LBB20_19
## %bb.18:
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, 104(%rcx)
	movb	$0, 401(%rcx)
	jmp	LBB20_20
LBB20_19:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	112(%rax), %rdi
	callq	__Znam
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, 104(%rdi)
	movb	$1, 401(%rdi)
LBB20_20:
	jmp	LBB20_22
LBB20_21:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	$0, 112(%rax)
	movq	$0, 104(%rax)
	movb	$0, 401(%rax)
LBB20_22:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$496, %rsp              ## imm = 0x1F0
	movq	%rdi, %rax
	movq	___stack_chk_guard@GOTPCREL(%rip), %r9
	movq	(%r9), %r9
	movq	%r9, -8(%rbp)
	movq	%rsi, -280(%rbp)
	movq	%rdx, -288(%rbp)
	movl	%ecx, -292(%rbp)
	movl	%r8d, -296(%rbp)
	movq	-280(%rbp), %rdx
	cmpq	$0, 128(%rdx)
	movq	%rax, -312(%rbp)        ## 8-byte Spill
	movq	%rdi, -320(%rbp)        ## 8-byte Spill
	movq	%rdx, -328(%rbp)        ## 8-byte Spill
	jne	LBB21_2
## %bb.1:
	callq	__ZNSt3__1L16__throw_bad_castEv
LBB21_2:
	movq	-328(%rbp), %rax        ## 8-byte Reload
	movq	128(%rax), %rdi
	callq	__ZNKSt3__17codecvtIcc11__mbstate_tE8encodingEv
	movl	%eax, -300(%rbp)
	movq	-328(%rbp), %rdi        ## 8-byte Reload
	cmpq	$0, 120(%rdi)
	je	LBB21_6
## %bb.3:
	cmpl	$0, -300(%rbp)
	jg	LBB21_5
## %bb.4:
	cmpq	$0, -288(%rbp)
	jne	LBB21_6
LBB21_5:
	movq	-328(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rcx
	movq	%rax, %rdi
	callq	*48(%rcx)
	cmpl	$0, %eax
	je	LBB21_7
LBB21_6:
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movq	$-1, %rsi
	callq	__ZNSt3__14fposI11__mbstate_tEC1Ex
	jmp	LBB21_18
LBB21_7:
	movl	-292(%rbp), %eax
	testl	%eax, %eax
	movl	%eax, -332(%rbp)        ## 4-byte Spill
	je	LBB21_8
	jmp	LBB21_21
LBB21_21:
	movl	-332(%rbp), %eax        ## 4-byte Reload
	subl	$1, %eax
	movl	%eax, -336(%rbp)        ## 4-byte Spill
	je	LBB21_9
	jmp	LBB21_22
LBB21_22:
	movl	-332(%rbp), %eax        ## 4-byte Reload
	subl	$2, %eax
	movl	%eax, -340(%rbp)        ## 4-byte Spill
	je	LBB21_10
	jmp	LBB21_11
LBB21_8:
	movl	$0, -304(%rbp)
	jmp	LBB21_12
LBB21_9:
	movl	$1, -304(%rbp)
	jmp	LBB21_12
LBB21_10:
	movl	$2, -304(%rbp)
	jmp	LBB21_12
LBB21_11:
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movq	$-1, %rsi
	callq	__ZNSt3__14fposI11__mbstate_tEC1Ex
	jmp	LBB21_18
LBB21_12:
	movq	-328(%rbp), %rax        ## 8-byte Reload
	movq	120(%rax), %rdi
	cmpl	$0, -300(%rbp)
	movq	%rdi, -352(%rbp)        ## 8-byte Spill
	jle	LBB21_14
## %bb.13:
	movslq	-300(%rbp), %rax
	imulq	-288(%rbp), %rax
	movq	%rax, -360(%rbp)        ## 8-byte Spill
	jmp	LBB21_15
LBB21_14:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	%rcx, -360(%rbp)        ## 8-byte Spill
	jmp	LBB21_15
LBB21_15:
	movq	-360(%rbp), %rax        ## 8-byte Reload
	movl	-304(%rbp), %edx
	movq	-352(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, %rsi
	callq	_fseeko
	cmpl	$0, %eax
	je	LBB21_17
## %bb.16:
	movq	-320(%rbp), %rdi        ## 8-byte Reload
	movq	$-1, %rsi
	callq	__ZNSt3__14fposI11__mbstate_tEC1Ex
	jmp	LBB21_18
LBB21_17:
	movq	-328(%rbp), %rax        ## 8-byte Reload
	movq	120(%rax), %rdi
	callq	_ftello
	leaq	-144(%rbp), %rdi
	movq	%rax, %rsi
	callq	__ZNSt3__14fposI11__mbstate_tEC1Ex
	movl	$128, %ecx
	movl	%ecx, %edx
	movq	-328(%rbp), %rax        ## 8-byte Reload
	addq	$136, %rax
	leaq	-272(%rbp), %rsi
	movq	%rsi, %rdi
	movq	%rax, %rsi
	callq	_memcpy
	movq	%rsp, %rax
	movl	$16, %ecx
                                        ## kill: def $rcx killed $ecx
	leaq	-272(%rbp), %rsi
	movq	%rax, %rdi
	rep;movsq
	leaq	-144(%rbp), %rdi
	callq	__ZNSt3__14fposI11__mbstate_tE5stateES1_
	movl	$136, %r8d
	movl	%r8d, %edx
	movq	-320(%rbp), %rax        ## 8-byte Reload
	leaq	-144(%rbp), %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_memcpy
LBB21_18:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB21_20
## %bb.19:
	movq	-312(%rbp), %rax        ## 8-byte Reload
	addq	$496, %rsp              ## imm = 0x1F0
	popq	%rbp
	retq
LBB21_20:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$208, %rsp
	movq	%rdi, %rax
	leaq	16(%rbp), %rcx
	movq	___stack_chk_guard@GOTPCREL(%rip), %r8
	movq	(%r8), %r8
	movq	%r8, -8(%rbp)
	movq	%rsi, -144(%rbp)
	movl	%edx, -148(%rbp)
	movq	-144(%rbp), %rsi
	cmpq	$0, 120(%rsi)
	movq	%rax, -160(%rbp)        ## 8-byte Spill
	movq	%rcx, -168(%rbp)        ## 8-byte Spill
	movq	%rdi, -176(%rbp)        ## 8-byte Spill
	movq	%rsi, -184(%rbp)        ## 8-byte Spill
	je	LBB22_2
## %bb.1:
	movq	-184(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rcx
	movq	%rax, %rdi
	callq	*48(%rcx)
	cmpl	$0, %eax
	je	LBB22_3
LBB22_2:
	movq	-176(%rbp), %rdi        ## 8-byte Reload
	movq	$-1, %rsi
	callq	__ZNSt3__14fposI11__mbstate_tEC1Ex
	jmp	LBB22_6
LBB22_3:
	movq	-184(%rbp), %rax        ## 8-byte Reload
	movq	120(%rax), %rdi
	movq	-168(%rbp), %rcx        ## 8-byte Reload
	movq	%rdi, -192(%rbp)        ## 8-byte Spill
	movq	%rcx, %rdi
	callq	__ZNKSt3__14fposI11__mbstate_tEcvxEv
	xorl	%edx, %edx
	movq	-192(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, %rsi
	callq	_fseeko
	cmpl	$0, %eax
	je	LBB22_5
## %bb.4:
	movq	-176(%rbp), %rdi        ## 8-byte Reload
	movq	$-1, %rsi
	callq	__ZNSt3__14fposI11__mbstate_tEC1Ex
	jmp	LBB22_6
LBB22_5:
	leaq	-136(%rbp), %rdi
	movq	-168(%rbp), %rsi        ## 8-byte Reload
	callq	__ZNKSt3__14fposI11__mbstate_tE5stateEv
	movl	$136, %eax
	movl	%eax, %edx
	movl	$128, %eax
	movl	%eax, %esi
	movq	-184(%rbp), %rdi        ## 8-byte Reload
	addq	$136, %rdi
	leaq	-136(%rbp), %rcx
	movq	%rsi, -200(%rbp)        ## 8-byte Spill
	movq	%rcx, %rsi
	movq	-200(%rbp), %rcx        ## 8-byte Reload
	movq	%rdx, -208(%rbp)        ## 8-byte Spill
	movq	%rcx, %rdx
	callq	_memcpy
	movq	-176(%rbp), %rcx        ## 8-byte Reload
	movq	-168(%rbp), %rdx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	callq	_memcpy
LBB22_6:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB22_8
## %bb.7:
	movq	-160(%rbp), %rax        ## 8-byte Reload
	addq	$208, %rsp
	popq	%rbp
	retq
LBB22_8:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$320, %rsp              ## imm = 0x140
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -152(%rbp)
	movq	-152(%rbp), %rax
	cmpq	$0, 120(%rax)
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	jne	LBB23_2
## %bb.1:
	movl	$0, -140(%rbp)
	jmp	LBB23_35
LBB23_2:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	cmpq	$0, 128(%rax)
	jne	LBB23_4
## %bb.3:
	callq	__ZNSt3__1L16__throw_bad_castEv
LBB23_4:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movl	396(%rax), %ecx
	andl	$16, %ecx
	cmpl	$0, %ecx
	je	LBB23_19
## %bb.5:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrEv
	movq	-208(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, -216(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
	movq	-216(%rbp), %rdi        ## 8-byte Reload
	cmpq	%rax, %rdi
	je	LBB23_9
## %bb.6:
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	movq	(%rcx), %rdx
	movq	%rcx, %rdi
	movl	%eax, %esi
	callq	*104(%rdx)
	movl	%eax, -220(%rbp)        ## 4-byte Spill
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	-220(%rbp), %esi        ## 4-byte Reload
	cmpl	%eax, %esi
	jne	LBB23_8
## %bb.7:
	movl	$-1, -140(%rbp)
	jmp	LBB23_35
LBB23_8:
	jmp	LBB23_9
LBB23_9:
	jmp	LBB23_10
LBB23_10:                               ## =>This Inner Loop Header: Depth=1
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movq	128(%rax), %rdi
	addq	$136, %rax
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	movq	64(%rcx), %rdx
	movq	64(%rcx), %rsi
	addq	96(%rcx), %rsi
	movq	%rsi, -232(%rbp)        ## 8-byte Spill
	movq	%rax, %rsi
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	leaq	-168(%rbp), %r8
	callq	__ZNKSt3__17codecvtIcc11__mbstate_tE7unshiftERS1_PcS4_RS4_
	movl	$1, %r9d
	movl	%r9d, %esi
	movl	%eax, -156(%rbp)
	movq	-168(%rbp), %rcx
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	movq	64(%rdx), %rdi
	subq	%rdi, %rcx
	movq	%rcx, -176(%rbp)
	movq	64(%rdx), %rdi
	movq	-176(%rbp), %rdx
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	movq	120(%rcx), %rcx
	callq	_fwrite
	cmpq	-176(%rbp), %rax
	je	LBB23_12
## %bb.11:
	movl	$-1, -140(%rbp)
	jmp	LBB23_35
LBB23_12:                               ##   in Loop: Header=BB23_10 Depth=1
	jmp	LBB23_13
LBB23_13:                               ##   in Loop: Header=BB23_10 Depth=1
	cmpl	$1, -156(%rbp)
	je	LBB23_10
## %bb.14:
	cmpl	$2, -156(%rbp)
	jne	LBB23_16
## %bb.15:
	movl	$-1, -140(%rbp)
	jmp	LBB23_35
LBB23_16:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movq	120(%rax), %rdi
	callq	_fflush
	cmpl	$0, %eax
	je	LBB23_18
## %bb.17:
	movl	$-1, -140(%rbp)
	jmp	LBB23_35
LBB23_18:
	jmp	LBB23_34
LBB23_19:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movl	396(%rax), %ecx
	andl	$8, %ecx
	cmpl	$0, %ecx
	je	LBB23_33
## %bb.20:
	movl	$128, %eax
	movl	%eax, %edx
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	addq	$264, %rcx              ## imm = 0x108
	leaq	-136(%rbp), %rsi
	movq	%rsi, %rdi
	movq	%rcx, %rsi
	callq	_memcpy
	movb	$0, -185(%rbp)
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	testb	$1, 402(%rcx)
	je	LBB23_22
## %bb.21:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrEv
	movq	-208(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, -240(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	subq	%rax, %rdi
	movq	%rdi, -184(%rbp)
	jmp	LBB23_28
LBB23_22:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movq	128(%rax), %rdi
	callq	__ZNKSt3__17codecvtIcc11__mbstate_tE8encodingEv
	movl	%eax, -192(%rbp)
	movq	-208(%rbp), %rdi        ## 8-byte Reload
	movq	80(%rdi), %rcx
	movq	72(%rdi), %rdx
	subq	%rdx, %rcx
	movq	%rcx, -184(%rbp)
	cmpl	$0, -192(%rbp)
	jle	LBB23_24
## %bb.23:
	movslq	-192(%rbp), %rax
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -248(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrEv
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -256(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movq	-256(%rbp), %rcx        ## 8-byte Reload
	subq	%rax, %rcx
	movq	-248(%rbp), %rax        ## 8-byte Reload
	imulq	%rcx, %rax
	addq	-184(%rbp), %rax
	movq	%rax, -184(%rbp)
	jmp	LBB23_27
LBB23_24:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movq	-208(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, -264(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrEv
	movq	-264(%rbp), %rdi        ## 8-byte Reload
	cmpq	%rax, %rdi
	je	LBB23_26
## %bb.25:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movq	128(%rax), %rdi
	movq	64(%rax), %rdx
	movq	72(%rax), %rcx
	movq	%rdi, -272(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	movq	%rcx, -280(%rbp)        ## 8-byte Spill
	movq	%rdx, -288(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	movq	-296(%rbp), %rcx        ## 8-byte Reload
	subq	%rax, %rcx
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	leaq	-136(%rbp), %rsi
	movq	-288(%rbp), %rdx        ## 8-byte Reload
	movq	-280(%rbp), %rax        ## 8-byte Reload
	movq	%rcx, -304(%rbp)        ## 8-byte Spill
	movq	%rax, %rcx
	movq	-304(%rbp), %r8         ## 8-byte Reload
	callq	__ZNKSt3__17codecvtIcc11__mbstate_tE6lengthERS1_PKcS5_m
	movl	%eax, -196(%rbp)
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	movq	72(%rcx), %rdx
	movq	64(%rcx), %rsi
	subq	%rsi, %rdx
	movslq	-196(%rbp), %rsi
	subq	%rsi, %rdx
	addq	-184(%rbp), %rdx
	movq	%rdx, -184(%rbp)
	movb	$1, -185(%rbp)
LBB23_26:
	jmp	LBB23_27
LBB23_27:
	jmp	LBB23_28
LBB23_28:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	movq	120(%rdx), %rdi
	subq	-184(%rbp), %rcx
	movq	%rcx, %rsi
	movl	$1, %edx
	callq	_fseeko
	cmpl	$0, %eax
	je	LBB23_30
## %bb.29:
	movl	$-1, -140(%rbp)
	jmp	LBB23_35
LBB23_30:
	testb	$1, -185(%rbp)
	je	LBB23_32
## %bb.31:
	movl	$128, %eax
	movl	%eax, %edx
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	addq	$136, %rcx
	leaq	-136(%rbp), %rsi
	movq	%rcx, %rdi
	callq	_memcpy
LBB23_32:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	movq	64(%rdx), %rsi
	movq	%rsi, 80(%rdx)
	movq	%rsi, 72(%rdx)
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%rcx, %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	movl	$0, 396(%rcx)
LBB23_33:
	jmp	LBB23_34
LBB23_34:
	movl	$0, -140(%rbp)
LBB23_35:
	movl	-140(%rbp), %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movl	%eax, -308(%rbp)        ## 4-byte Spill
	jne	LBB23_37
## %bb.36:
	movl	-308(%rbp), %eax        ## 4-byte Reload
	addq	$320, %rsp              ## imm = 0x140
	popq	%rbp
	retq
LBB23_37:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$336, %rsp              ## imm = 0x150
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	cmpq	$0, 120(%rdi)
	movq	%rdi, -120(%rbp)        ## 8-byte Spill
	jne	LBB24_2
## %bb.1:
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	%eax, -4(%rbp)
	jmp	LBB24_32
LBB24_2:
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE11__read_modeEv
	andb	$1, %al
	movb	%al, -17(%rbp)
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	cmpq	$0, %rax
	jne	LBB24_4
## %bb.3:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	leaq	-18(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rcx, %rsi
	addq	$1, %rsi
	movq	%rax, %rdi
	movq	%rsi, -128(%rbp)        ## 8-byte Spill
	movq	%rcx, %rsi
	movq	-128(%rbp), %rcx        ## 8-byte Reload
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
LBB24_4:
	testb	$1, -17(%rbp)
	je	LBB24_6
## %bb.5:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	%rcx, -136(%rbp)        ## 8-byte Spill
	jmp	LBB24_7
LBB24_6:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrEv
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	movl	$2, %ecx
	movl	%ecx, %edi
	movq	-144(%rbp), %rdx        ## 8-byte Reload
	subq	%rax, %rdx
	movq	%rdx, %rax
	cqto
	idivq	%rdi
	movq	%rax, -40(%rbp)
	movq	$4, -48(%rbp)
	leaq	-40(%rbp), %rdi
	leaq	-48(%rbp), %rsi
	callq	__ZNSt3__1L3minImEERKT_S3_S3_
	movq	(%rax), %rax
	movq	%rax, -136(%rbp)        ## 8-byte Spill
LBB24_7:
	movq	-136(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -32(%rbp)
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	%eax, -52(%rbp)
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrEv
	movq	-152(%rbp), %rcx        ## 8-byte Reload
	cmpq	%rax, %rcx
	jne	LBB24_28
## %bb.8:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, -160(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrEv
	xorl	%ecx, %ecx
	movl	%ecx, %edi
	subq	-32(%rbp), %rdi
	addq	%rdi, %rax
	movq	-32(%rbp), %rdi
	shlq	$0, %rdi
	movq	-160(%rbp), %rdx        ## 8-byte Reload
	movq	%rdi, -168(%rbp)        ## 8-byte Spill
	movq	%rdx, %rdi
	movq	%rax, %rsi
	movq	-168(%rbp), %rdx        ## 8-byte Reload
	callq	_memmove
	movq	-120(%rbp), %rdx        ## 8-byte Reload
	testb	$1, 402(%rdx)
	movq	%rax, -176(%rbp)        ## 8-byte Spill
	je	LBB24_12
## %bb.9:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrEv
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, -184(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	movq	-184(%rbp), %rdi        ## 8-byte Reload
	subq	%rax, %rdi
	subq	-32(%rbp), %rdi
	movq	%rdi, -64(%rbp)
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	movl	$1, %ecx
	movl	%ecx, %esi
	addq	-32(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	movq	120(%rdi), %rcx
	movq	%rax, %rdi
	callq	_fread
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	je	LBB24_11
## %bb.10:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -192(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -200(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	addq	-32(%rbp), %rax
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	addq	-32(%rbp), %rax
	addq	-64(%rbp), %rax
	movq	-192(%rbp), %rdi        ## 8-byte Reload
	movq	-200(%rbp), %rsi        ## 8-byte Reload
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	movq	%rax, %rcx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movsbl	(%rax), %edi
	callq	__ZNSt3__111char_traitsIcE11to_int_typeEc
	movl	%eax, -52(%rbp)
LBB24_11:
	jmp	LBB24_27
LBB24_12:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	80(%rax), %rcx
	cmpq	72(%rax), %rcx
	je	LBB24_14
## %bb.13:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rdi
	movq	72(%rax), %rsi
	movq	80(%rax), %rcx
	movq	72(%rax), %rdx
	subq	%rdx, %rcx
	movq	%rcx, %rdx
	callq	_memmove
	movq	%rax, -216(%rbp)        ## 8-byte Spill
LBB24_14:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	64(%rax), %rcx
	movq	80(%rax), %rdx
	movq	72(%rax), %rsi
	subq	%rsi, %rdx
	addq	%rdx, %rcx
	movq	%rcx, 72(%rax)
	movq	64(%rax), %rcx
	movq	64(%rax), %rdx
	addq	$88, %rax
	cmpq	%rax, %rdx
	movq	%rcx, -224(%rbp)        ## 8-byte Spill
	jne	LBB24_16
## %bb.15:
	movl	$8, %eax
	movl	%eax, %ecx
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	jmp	LBB24_17
LBB24_16:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	96(%rax), %rcx
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
LBB24_17:
	movq	-232(%rbp), %rax        ## 8-byte Reload
	movq	-224(%rbp), %rcx        ## 8-byte Reload
	addq	%rax, %rcx
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	%rcx, 80(%rax)
	movq	112(%rax), %rcx
	subq	-32(%rbp), %rcx
	movq	%rcx, -80(%rbp)
	movq	80(%rax), %rcx
	movq	72(%rax), %rdx
	subq	%rdx, %rcx
	movq	%rcx, -88(%rbp)
	leaq	-80(%rbp), %rdi
	leaq	-88(%rbp), %rsi
	callq	__ZNSt3__1L3minImEERKT_S3_S3_
	movl	$1, %r8d
	movl	%r8d, %esi
	movl	$128, %r8d
	movl	%r8d, %edx
	movq	(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-120(%rbp), %rax        ## 8-byte Reload
	addq	$136, %rax
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	addq	$264, %rcx              ## imm = 0x108
	movq	%rcx, %rdi
	movq	%rsi, -240(%rbp)        ## 8-byte Spill
	movq	%rax, %rsi
	callq	_memcpy
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	72(%rax), %rdi
	movq	-72(%rbp), %rdx
	movq	120(%rax), %rcx
	movq	-240(%rbp), %rsi        ## 8-byte Reload
	callq	_fread
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	je	LBB24_26
## %bb.18:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	cmpq	$0, 128(%rax)
	jne	LBB24_20
## %bb.19:
	callq	__ZNSt3__1L16__throw_bad_castEv
LBB24_20:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	72(%rax), %rcx
	addq	-104(%rbp), %rcx
	movq	%rcx, 80(%rax)
	movq	128(%rax), %rdi
	addq	$136, %rax
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	64(%rcx), %rdx
	movq	80(%rcx), %rcx
	movq	-120(%rbp), %rsi        ## 8-byte Reload
	addq	$72, %rsi
	movq	-120(%rbp), %r8         ## 8-byte Reload
	movq	%rdi, -248(%rbp)        ## 8-byte Spill
	movq	%r8, %rdi
	movq	%rax, -256(%rbp)        ## 8-byte Spill
	movq	%rsi, -264(%rbp)        ## 8-byte Spill
	movq	%rcx, -272(%rbp)        ## 8-byte Spill
	movq	%rdx, -280(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	addq	-32(%rbp), %rax
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -288(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	addq	112(%rcx), %rax
	movq	-248(%rbp), %rdi        ## 8-byte Reload
	movq	-256(%rbp), %rsi        ## 8-byte Reload
	movq	-280(%rbp), %rdx        ## 8-byte Reload
	movq	-272(%rbp), %rcx        ## 8-byte Reload
	movq	-264(%rbp), %r8         ## 8-byte Reload
	movq	-288(%rbp), %r9         ## 8-byte Reload
	movq	%rax, (%rsp)
	leaq	-112(%rbp), %rax
	movq	%rax, 8(%rsp)
	callq	__ZNKSt3__17codecvtIcc11__mbstate_tE2inERS1_PKcS5_RS5_PcS7_RS7_
	movl	%eax, -92(%rbp)
	cmpl	$3, -92(%rbp)
	jne	LBB24_22
## %bb.21:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	64(%rcx), %rsi
	movq	64(%rcx), %rdx
	movq	80(%rcx), %rcx
	movq	%rax, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movsbl	(%rax), %edi
	callq	__ZNSt3__111char_traitsIcE11to_int_typeEc
	movl	%eax, -52(%rbp)
	jmp	LBB24_25
LBB24_22:
	movq	-112(%rbp), %rax
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	addq	-32(%rbp), %rax
	movq	-296(%rbp), %rcx        ## 8-byte Reload
	cmpq	%rax, %rcx
	je	LBB24_24
## %bb.23:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -304(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -312(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	addq	-32(%rbp), %rax
	movq	-112(%rbp), %rcx
	movq	-304(%rbp), %rdi        ## 8-byte Reload
	movq	-312(%rbp), %rsi        ## 8-byte Reload
	movq	%rax, %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movsbl	(%rax), %edi
	callq	__ZNSt3__111char_traitsIcE11to_int_typeEc
	movl	%eax, -52(%rbp)
LBB24_24:
	jmp	LBB24_25
LBB24_25:
	jmp	LBB24_26
LBB24_26:
	jmp	LBB24_27
LBB24_27:
	jmp	LBB24_29
LBB24_28:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movsbl	(%rax), %edi
	callq	__ZNSt3__111char_traitsIcE11to_int_typeEc
	movl	%eax, -52(%rbp)
LBB24_29:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	leaq	-18(%rbp), %rdi
	cmpq	%rdi, %rax
	jne	LBB24_31
## %bb.30:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-120(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%rcx, %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
LBB24_31:
	movl	-52(%rbp), %eax
	movl	%eax, -4(%rbp)
LBB24_32:
	movl	-4(%rbp), %eax
	addq	$336, %rsp              ## imm = 0x150
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	-16(%rbp), %rdi
	cmpq	$0, 120(%rdi)
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	je	LBB25_8
## %bb.1:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	cmpq	%rax, %rdi
	jae	LBB25_8
## %bb.2:
	movl	-20(%rbp), %edi
	movl	%edi, -44(%rbp)         ## 4-byte Spill
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	-44(%rbp), %edi         ## 4-byte Reload
	movl	%eax, %esi
	callq	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	testb	$1, %al
	jne	LBB25_3
	jmp	LBB25_4
LBB25_3:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5gbumpEi
	movl	-20(%rbp), %edi
	callq	__ZNSt3__111char_traitsIcE7not_eofEi
	movl	%eax, -4(%rbp)
	jmp	LBB25_9
LBB25_4:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movl	392(%rax), %ecx
	andl	$16, %ecx
	cmpl	$0, %ecx
	jne	LBB25_6
## %bb.5:
	movl	-20(%rbp), %edi
	callq	__ZNSt3__111char_traitsIcE12to_char_typeEi
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, %rdi
	movb	%al, -45(%rbp)          ## 1-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movb	-45(%rbp), %dl          ## 1-byte Reload
	movsbl	%dl, %edi
	movsbl	-1(%rax), %esi
	callq	__ZNSt3__111char_traitsIcE2eqEcc
	testb	$1, %al
	jne	LBB25_6
	jmp	LBB25_7
LBB25_6:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	movl	$4294967295, %esi       ## imm = 0xFFFFFFFF
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5gbumpEi
	movl	-20(%rbp), %edi
	callq	__ZNSt3__111char_traitsIcE12to_char_typeEi
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, %rdi
	movb	%al, -46(%rbp)          ## 1-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
	movb	-46(%rbp), %dl          ## 1-byte Reload
	movb	%dl, (%rax)
	movl	-20(%rbp), %esi
	movl	%esi, -4(%rbp)
	jmp	LBB25_9
LBB25_7:
	jmp	LBB25_8
LBB25_8:
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	%eax, -4(%rbp)
LBB25_9:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$224, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	-16(%rbp), %rdi
	cmpq	$0, 120(%rdi)
	movq	%rdi, -96(%rbp)         ## 8-byte Spill
	jne	LBB26_2
## %bb.1:
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	%eax, -4(%rbp)
	jmp	LBB26_34
LBB26_2:
	movq	-96(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE12__write_modeEv
	movq	-96(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
	movq	%rax, -32(%rbp)
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5epptrEv
	movq	%rax, -40(%rbp)
	movl	-20(%rbp), %edi
	movl	%edi, -100(%rbp)        ## 4-byte Spill
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	-100(%rbp), %edi        ## 4-byte Reload
	movl	%eax, %esi
	callq	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	testb	$1, %al
	jne	LBB26_6
## %bb.3:
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrEv
	cmpq	$0, %rax
	jne	LBB26_5
## %bb.4:
	movq	-96(%rbp), %rax         ## 8-byte Reload
	leaq	-21(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_
LBB26_5:
	movl	-20(%rbp), %edi
	callq	__ZNSt3__111char_traitsIcE12to_char_typeEi
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, %rdi
	movb	%al, -101(%rbp)         ## 1-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrEv
	movb	-101(%rbp), %dl         ## 1-byte Reload
	movb	%dl, (%rax)
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	movl	$1, %esi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbumpEi
LBB26_6:
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrEv
	movq	-96(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
	movq	-112(%rbp), %rdi        ## 8-byte Reload
	cmpq	%rax, %rdi
	je	LBB26_33
## %bb.7:
	movq	-96(%rbp), %rax         ## 8-byte Reload
	testb	$1, 402(%rax)
	je	LBB26_11
## %bb.8:
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrEv
	movq	-96(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	subq	%rax, %rdi
	movq	%rdi, -48(%rbp)
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
	movl	$1, %ecx
	movl	%ecx, %esi
	movq	-48(%rbp), %rdx
	movq	-96(%rbp), %rdi         ## 8-byte Reload
	movq	120(%rdi), %rcx
	movq	%rax, %rdi
	callq	_fwrite
	cmpq	-48(%rbp), %rax
	je	LBB26_10
## %bb.9:
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	%eax, -4(%rbp)
	jmp	LBB26_34
LBB26_10:
	jmp	LBB26_32
LBB26_11:
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	64(%rax), %rcx
	movq	%rcx, -56(%rbp)
LBB26_12:                               ## =>This Inner Loop Header: Depth=1
	movq	-96(%rbp), %rax         ## 8-byte Reload
	cmpq	$0, 128(%rax)
	jne	LBB26_14
## %bb.13:
	callq	__ZNSt3__1L16__throw_bad_castEv
LBB26_14:                               ##   in Loop: Header=BB26_12 Depth=1
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	128(%rax), %rdi
	addq	$136, %rax
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rdi, -128(%rbp)        ## 8-byte Spill
	movq	%rcx, %rdi
	movq	%rax, -136(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrEv
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	64(%rcx), %r9
	movq	64(%rcx), %rdi
	addq	96(%rcx), %rdi
	movq	-128(%rbp), %rdx        ## 8-byte Reload
	movq	%rdi, -152(%rbp)        ## 8-byte Spill
	movq	%rdx, %rdi
	movq	-136(%rbp), %rsi        ## 8-byte Reload
	movq	-144(%rbp), %rdx        ## 8-byte Reload
	movq	%rax, %rcx
	leaq	-72(%rbp), %r8
	movq	-152(%rbp), %rax        ## 8-byte Reload
	movq	%rax, (%rsp)
	leaq	-56(%rbp), %rax
	movq	%rax, 8(%rsp)
	callq	__ZNKSt3__17codecvtIcc11__mbstate_tE3outERS1_PKcS5_RS5_PcS7_RS7_
	movl	%eax, -60(%rbp)
	movq	-72(%rbp), %rcx
	movq	-96(%rbp), %rdx         ## 8-byte Reload
	movq	%rdx, %rdi
	movq	%rcx, -160(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
	movq	-160(%rbp), %rcx        ## 8-byte Reload
	cmpq	%rax, %rcx
	jne	LBB26_16
## %bb.15:
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	%eax, -4(%rbp)
	jmp	LBB26_34
LBB26_16:                               ##   in Loop: Header=BB26_12 Depth=1
	cmpl	$3, -60(%rbp)
	jne	LBB26_20
## %bb.17:                              ##   in Loop: Header=BB26_12 Depth=1
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrEv
	movq	-96(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -168(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
	movq	-168(%rbp), %rdi        ## 8-byte Reload
	subq	%rax, %rdi
	movq	%rdi, -80(%rbp)
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rdi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
	movl	$1, %ecx
	movl	%ecx, %esi
	movq	-80(%rbp), %rdx
	movq	-96(%rbp), %rdi         ## 8-byte Reload
	movq	120(%rdi), %rcx
	movq	%rax, %rdi
	callq	_fwrite
	cmpq	-80(%rbp), %rax
	je	LBB26_19
## %bb.18:
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	%eax, -4(%rbp)
	jmp	LBB26_34
LBB26_19:                               ##   in Loop: Header=BB26_12 Depth=1
	jmp	LBB26_29
LBB26_20:                               ##   in Loop: Header=BB26_12 Depth=1
	cmpl	$0, -60(%rbp)
	je	LBB26_22
## %bb.21:                              ##   in Loop: Header=BB26_12 Depth=1
	cmpl	$1, -60(%rbp)
	jne	LBB26_27
LBB26_22:                               ##   in Loop: Header=BB26_12 Depth=1
	movl	$1, %eax
	movl	%eax, %esi
	movq	-56(%rbp), %rcx
	movq	-96(%rbp), %rdx         ## 8-byte Reload
	movq	64(%rdx), %rdi
	subq	%rdi, %rcx
	movq	%rcx, -88(%rbp)
	movq	64(%rdx), %rdi
	movq	-88(%rbp), %rdx
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	120(%rcx), %rcx
	callq	_fwrite
	cmpq	-88(%rbp), %rax
	je	LBB26_24
## %bb.23:
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	%eax, -4(%rbp)
	jmp	LBB26_34
LBB26_24:                               ##   in Loop: Header=BB26_12 Depth=1
	cmpl	$1, -60(%rbp)
	jne	LBB26_26
## %bb.25:                              ##   in Loop: Header=BB26_12 Depth=1
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	-72(%rbp), %rsi
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -176(%rbp)        ## 8-byte Spill
	movq	%rsi, -184(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrEv
	movq	-176(%rbp), %rdi        ## 8-byte Reload
	movq	-184(%rbp), %rsi        ## 8-byte Reload
	movq	%rax, %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -192(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5epptrEv
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, %rdi
	movq	%rax, -200(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
	movq	-200(%rbp), %rcx        ## 8-byte Reload
	subq	%rax, %rcx
	movq	-192(%rbp), %rdi        ## 8-byte Reload
	movq	%rcx, %rsi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7__pbumpEl
LBB26_26:                               ##   in Loop: Header=BB26_12 Depth=1
	jmp	LBB26_28
LBB26_27:
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	%eax, -4(%rbp)
	jmp	LBB26_34
LBB26_28:                               ##   in Loop: Header=BB26_12 Depth=1
	jmp	LBB26_29
LBB26_29:                               ##   in Loop: Header=BB26_12 Depth=1
	jmp	LBB26_30
LBB26_30:                               ##   in Loop: Header=BB26_12 Depth=1
	cmpl	$1, -60(%rbp)
	je	LBB26_12
## %bb.31:
	jmp	LBB26_32
LBB26_32:
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	-32(%rbp), %rsi
	movq	-40(%rbp), %rdx
	movq	%rax, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_
LBB26_33:
	movl	-20(%rbp), %edi
	callq	__ZNSt3__111char_traitsIcE7not_eofEi
	movl	%eax, -4(%rbp)
LBB26_34:
	movl	-4(%rbp), %eax
	addq	$224, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__110unique_ptrI7__sFILEPFiPS1_EEC1ES2_S4_
__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EEC1ES2_S4_: ## @_ZNSt3__110unique_ptrI7__sFILEPFiPS1_EEC1ES2_S4_
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
	callq	__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EEC2ES2_S4_
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__110unique_ptrI7__sFILEPFiPS1_EE7releaseEv
__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EE7releaseEv: ## @_ZNSt3__110unique_ptrI7__sFILEPFiPS1_EE7releaseEv
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
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EE5firstEv
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EE5firstEv
	movq	$0, (%rax)
	movq	-16(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__110unique_ptrI7__sFILEPFiPS1_EED1Ev
__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EED1Ev: ## @_ZNSt3__110unique_ptrI7__sFILEPFiPS1_EED1Ev
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
	callq	__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EED2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__110unique_ptrI7__sFILEPFiPS1_EEC2ES2_S4_
__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EEC2ES2_S4_: ## @_ZNSt3__110unique_ptrI7__sFILEPFiPS1_EEC2ES2_S4_
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
	leaq	-16(%rbp), %rdx
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	movq	%rdx, %rdi
	callq	__ZNSt3__1L4moveIP7__sFILEEERT_S4_
	movq	(%rax), %rsi
	leaq	-24(%rbp), %rdi
	movq	%rsi, -40(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L4moveIPFiP7__sFILEEEERT_S6_
	movq	(%rax), %rdx
	movq	-32(%rbp), %rdi         ## 8-byte Reload
	movq	-40(%rbp), %rsi         ## 8-byte Reload
	callq	__ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EEC1ES2_S4_
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L4moveIP7__sFILEEERT_S4_
__ZNSt3__1L4moveIP7__sFILEEERT_S4_:     ## @_ZNSt3__1L4moveIP7__sFILEEERT_S4_
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L4moveIPFiP7__sFILEEEERT_S6_
__ZNSt3__1L4moveIPFiP7__sFILEEEERT_S6_: ## @_ZNSt3__1L4moveIPFiP7__sFILEEEERT_S6_
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EEC1ES2_S4_
__ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EEC1ES2_S4_: ## @_ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EEC1ES2_S4_
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
	callq	__ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EEC2ES2_S4_
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EEC2ES2_S4_
__ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EEC2ES2_S4_: ## @_ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EEC2ES2_S4_
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
	callq	__ZNSt3__1L7forwardIP7__sFILEEERT_RNS_16remove_referenceIS3_E4typeE
	movq	(%rax), %rsi
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__122__compressed_pair_elemIP7__sFILELi0ELb0EEC2ES2_
	movq	-32(%rbp), %rax         ## 8-byte Reload
	addq	$8, %rax
	leaq	-24(%rbp), %rdi
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L7forwardIPFiP7__sFILEEEERT_RNS_16remove_referenceIS5_E4typeE
	movq	(%rax), %rsi
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__122__compressed_pair_elemIPFiP7__sFILEELi1ELb0EEC2ES4_
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L7forwardIP7__sFILEEERT_RNS_16remove_referenceIS3_E4typeE
__ZNSt3__1L7forwardIP7__sFILEEERT_RNS_16remove_referenceIS3_E4typeE: ## @_ZNSt3__1L7forwardIP7__sFILEEERT_RNS_16remove_referenceIS3_E4typeE
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemIP7__sFILELi0ELb0EEC2ES2_
__ZNSt3__122__compressed_pair_elemIP7__sFILELi0ELb0EEC2ES2_: ## @_ZNSt3__122__compressed_pair_elemIP7__sFILELi0ELb0EEC2ES2_
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
	callq	__ZNSt3__1L7forwardIP7__sFILEEERT_RNS_16remove_referenceIS3_E4typeE
	movq	(%rax), %rax
	movq	-24(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, (%rsi)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L7forwardIPFiP7__sFILEEEERT_RNS_16remove_referenceIS5_E4typeE
__ZNSt3__1L7forwardIPFiP7__sFILEEEERT_RNS_16remove_referenceIS5_E4typeE: ## @_ZNSt3__1L7forwardIPFiP7__sFILEEEERT_RNS_16remove_referenceIS5_E4typeE
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemIPFiP7__sFILEELi1ELb0EEC2ES4_
__ZNSt3__122__compressed_pair_elemIPFiP7__sFILEELi1ELb0EEC2ES4_: ## @_ZNSt3__122__compressed_pair_elemIPFiP7__sFILEELi1ELb0EEC2ES4_
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
	callq	__ZNSt3__1L7forwardIPFiP7__sFILEEEERT_RNS_16remove_referenceIS5_E4typeE
	movq	(%rax), %rax
	movq	-24(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, (%rsi)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EE5firstEv
__ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EE5firstEv: ## @_ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EE5firstEv
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
	callq	__ZNSt3__122__compressed_pair_elemIP7__sFILELi0ELb0EE5__getEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemIP7__sFILELi0ELb0EE5__getEv
__ZNSt3__122__compressed_pair_elemIP7__sFILELi0ELb0EE5__getEv: ## @_ZNSt3__122__compressed_pair_elemIP7__sFILELi0ELb0EE5__getEv
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__110unique_ptrI7__sFILEPFiPS1_EED2Ev
__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EED2Ev: ## @_ZNSt3__110unique_ptrI7__sFILEPFiPS1_EED2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	xorl	%eax, %eax
	movl	%eax, %esi
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EE5resetES2_
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__110unique_ptrI7__sFILEPFiPS1_EE5resetES2_
__ZNSt3__110unique_ptrI7__sFILEPFiPS1_EE5resetES2_: ## @_ZNSt3__110unique_ptrI7__sFILEPFiPS1_EE5resetES2_
Lfunc_begin9:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception9
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
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EE5firstEv
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EE5firstEv
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	%rsi, (%rax)
	cmpq	$0, -24(%rbp)
	je	LBB42_5
## %bb.1:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EE6secondEv
	movq	(%rax), %rax
	movq	-24(%rbp), %rdi
Ltmp131:
	callq	*%rax
Ltmp132:
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	jmp	LBB42_2
LBB42_2:
	jmp	LBB42_5
LBB42_3:
Ltmp133:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
## %bb.4:
	movq	-32(%rbp), %rdi
	callq	___cxa_call_unexpected
LBB42_5:
	addq	$64, %rsp
	popq	%rbp
	retq
Lfunc_end9:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table42:
Lexception9:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase7-Lttbaseref7
Lttbaseref7:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end9-Lcst_begin9
Lcst_begin9:
	.uleb128 Ltmp131-Lfunc_begin9   ## >> Call Site 1 <<
	.uleb128 Ltmp132-Ltmp131        ##   Call between Ltmp131 and Ltmp132
	.uleb128 Ltmp133-Lfunc_begin9   ##     jumps to Ltmp133
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp132-Lfunc_begin9   ## >> Call Site 2 <<
	.uleb128 Lfunc_end9-Ltmp132     ##   Call between Ltmp132 and Lfunc_end9
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end9:
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EE6secondEv
__ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EE6secondEv: ## @_ZNSt3__117__compressed_pairIP7__sFILEPFiS2_EE6secondEv
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
	callq	__ZNSt3__122__compressed_pair_elemIPFiP7__sFILEELi1ELb0EE5__getEv
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__122__compressed_pair_elemIPFiP7__sFILEELi1ELb0EE5__getEv
__ZNSt3__122__compressed_pair_elemIPFiP7__sFILEELi1ELb0EE5__getEv: ## @_ZNSt3__122__compressed_pair_elemIPFiP7__sFILEELi1ELb0EE5__getEv
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L9use_facetINS_7codecvtIcc11__mbstate_tEEEERKT_RKNS_6localeE
__ZNSt3__1L9use_facetINS_7codecvtIcc11__mbstate_tEEEERKT_RKNS_6localeE: ## @_ZNSt3__1L9use_facetINS_7codecvtIcc11__mbstate_tEEEERKT_RKNS_6localeE
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	__ZNSt3__17codecvtIcc11__mbstate_tE2idE@GOTPCREL(%rip), %rsi
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__17codecvtIcc11__mbstate_tE13always_noconvEv
__ZNKSt3__17codecvtIcc11__mbstate_tE13always_noconvEv: ## @_ZNKSt3__17codecvtIcc11__mbstate_tE13always_noconvEv
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
	movq	(%rdi), %rax
	callq	*56(%rax)
	andb	$1, %al
	movzbl	%al, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_: ## @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
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
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rcx)
	movq	-24(%rbp), %rdx
	movq	%rdx, 24(%rcx)
	movq	-32(%rbp), %rdx
	movq	%rdx, 32(%rcx)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_
__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_: ## @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_
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
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	%rsi, 48(%rdx)
	movq	%rsi, 40(%rdx)
	movq	-24(%rbp), %rsi
	movq	%rsi, 56(%rdx)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L3maxIlEERKT_S3_S3_
__ZNSt3__1L3maxIlEERKT_S3_S3_:          ## @_ZNSt3__1L3maxIlEERKT_S3_S3_
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
	callq	__ZNSt3__1L3maxIlNS_6__lessIllEEEERKT_S5_S5_T0_
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L3maxIlNS_6__lessIllEEEERKT_S5_S5_T0_
__ZNSt3__1L3maxIlNS_6__lessIllEEEERKT_S5_S5_T0_: ## @_ZNSt3__1L3maxIlNS_6__lessIllEEEERKT_S5_S5_T0_
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
	callq	__ZNKSt3__16__lessIllEclERKlS3_
	testb	$1, %al
	jne	LBB50_1
	jmp	LBB50_2
LBB50_1:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	jmp	LBB50_3
LBB50_2:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)         ## 8-byte Spill
LBB50_3:
	movq	-32(%rbp), %rax         ## 8-byte Reload
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__16__lessIllEclERKlS3_
__ZNKSt3__16__lessIllEclERKlS3_:        ## @_ZNKSt3__16__lessIllEclERKlS3_
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
	setl	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L16__throw_bad_castEv
__ZNSt3__1L16__throw_bad_castEv:        ## @_ZNSt3__1L16__throw_bad_castEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$8, %eax
	movl	%eax, %edi
	callq	___cxa_allocate_exception
	movq	%rax, %rdi
	movq	%rax, -8(%rbp)          ## 8-byte Spill
	callq	__ZNSt8bad_castC1Ev
	movq	__ZTISt8bad_cast@GOTPCREL(%rip), %rsi
	movq	__ZNSt8bad_castD1Ev@GOTPCREL(%rip), %rdx
	movq	-8(%rbp), %rdi          ## 8-byte Reload
	callq	___cxa_throw
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__17codecvtIcc11__mbstate_tE8encodingEv
__ZNKSt3__17codecvtIcc11__mbstate_tE8encodingEv: ## @_ZNKSt3__17codecvtIcc11__mbstate_tE8encodingEv
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
	movq	(%rdi), %rax
	callq	*48(%rax)
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__14fposI11__mbstate_tEC1Ex
__ZNSt3__14fposI11__mbstate_tEC1Ex:     ## @_ZNSt3__14fposI11__mbstate_tEC1Ex
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
	callq	__ZNSt3__14fposI11__mbstate_tEC2Ex
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__14fposI11__mbstate_tE5stateES1_
__ZNSt3__14fposI11__mbstate_tE5stateES1_: ## @_ZNSt3__14fposI11__mbstate_tE5stateES1_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	16(%rbp), %rax
	movl	$128, %ecx
	movl	%ecx, %edx
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rax, %rsi
	callq	_memcpy
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__14fposI11__mbstate_tEC2Ex
__ZNSt3__14fposI11__mbstate_tEC2Ex:     ## @_ZNSt3__14fposI11__mbstate_tEC2Ex
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	xorl	%eax, %eax
	movl	$128, %ecx
	movl	%ecx, %edx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, %rdi
	movq	%rsi, -24(%rbp)         ## 8-byte Spill
	movl	%eax, %esi
	callq	_memset
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	%rdx, 128(%rdi)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__14fposI11__mbstate_tEcvxEv
__ZNKSt3__14fposI11__mbstate_tEcvxEv:   ## @_ZNKSt3__14fposI11__mbstate_tEcvxEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	128(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__14fposI11__mbstate_tE5stateEv
__ZNKSt3__14fposI11__mbstate_tE5stateEv: ## @_ZNKSt3__14fposI11__mbstate_tE5stateEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, %rax
	movl	$128, %ecx
	movl	%ecx, %edx
	movq	%rsi, -8(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rax, -16(%rbp)         ## 8-byte Spill
	callq	_memcpy
	movq	-16(%rbp), %rax         ## 8-byte Reload
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrEv
__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrEv: ## @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	48(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv: ## @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseEv
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
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__17codecvtIcc11__mbstate_tE7unshiftERS1_PcS4_RS4_
__ZNKSt3__17codecvtIcc11__mbstate_tE7unshiftERS1_PcS4_RS4_: ## @_ZNKSt3__17codecvtIcc11__mbstate_tE7unshiftERS1_PcS4_RS4_
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
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %r8
	movq	(%rcx), %rax
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	callq	*40(%rax)
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrEv
__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrEv: ## @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	32(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv: ## @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrEv
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
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__17codecvtIcc11__mbstate_tE6lengthERS1_PKcS5_m
__ZNKSt3__17codecvtIcc11__mbstate_tE6lengthERS1_PKcS5_m: ## @_ZNKSt3__17codecvtIcc11__mbstate_tE6lengthERS1_PKcS5_m
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
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %r8
	movq	(%rcx), %rax
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	callq	*64(%rax)
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv: ## @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	16(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE11__read_modeEv ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE11__read_modeEv
	.weak_definition	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE11__read_modeEv
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE11__read_modeEv: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE11__read_modeEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movl	396(%rdi), %eax
	andl	$8, %eax
	cmpl	$0, %eax
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	jne	LBB67_5
## %bb.1:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-24(%rbp), %rdx         ## 8-byte Reload
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%rcx, %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_
	movq	-24(%rbp), %rcx         ## 8-byte Reload
	testb	$1, 402(%rcx)
	je	LBB67_3
## %bb.2:
	movq	-24(%rbp), %rax         ## 8-byte Reload
	movq	-24(%rbp), %rcx         ## 8-byte Reload
	movq	64(%rcx), %rsi
	movq	64(%rcx), %rdx
	addq	96(%rcx), %rdx
	movq	64(%rcx), %rdi
	addq	96(%rcx), %rdi
	movq	%rdi, -32(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
	jmp	LBB67_4
LBB67_3:
	movq	-24(%rbp), %rax         ## 8-byte Reload
	movq	-24(%rbp), %rcx         ## 8-byte Reload
	movq	104(%rcx), %rsi
	movq	104(%rcx), %rdx
	addq	112(%rcx), %rdx
	movq	104(%rcx), %rdi
	addq	112(%rcx), %rdi
	movq	%rdi, -40(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
LBB67_4:
	movq	-24(%rbp), %rax         ## 8-byte Reload
	movl	$8, 396(%rax)
	movb	$1, -1(%rbp)
	jmp	LBB67_6
LBB67_5:
	movb	$0, -1(%rbp)
LBB67_6:
	movb	-1(%rbp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$48, %rsp
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
	.globl	__ZNSt3__111char_traitsIcE11to_int_typeEc ## -- Begin function _ZNSt3__111char_traitsIcE11to_int_typeEc
	.weak_definition	__ZNSt3__111char_traitsIcE11to_int_typeEc
	.p2align	4, 0x90
__ZNSt3__111char_traitsIcE11to_int_typeEc: ## @_ZNSt3__111char_traitsIcE11to_int_typeEc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%dil, %al
	movb	%al, -1(%rbp)
	movzbl	-1(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__17codecvtIcc11__mbstate_tE2inERS1_PKcS5_RS5_PcS7_RS7_
__ZNKSt3__17codecvtIcc11__mbstate_tE2inERS1_PKcS5_RS5_PcS7_RS7_: ## @_ZNKSt3__17codecvtIcc11__mbstate_tE2inERS1_PKcS5_RS5_PcS7_RS7_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$96, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	24(%rbp), %rax
	movq	16(%rbp), %r10
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -64(%rbp)
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rsi
	movq	-40(%rbp), %rdx
	movq	-48(%rbp), %rdi
	movq	-56(%rbp), %r8
	movq	-64(%rbp), %r9
	movq	16(%rbp), %r11
	movq	24(%rbp), %rbx
	movq	(%rcx), %r14
	movq	%rdi, -72(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movq	%r11, (%rsp)
	movq	%rbx, 8(%rsp)
	movq	%r10, -80(%rbp)         ## 8-byte Spill
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	callq	*32(%r14)
	addq	$96, %rsp
	popq	%rbx
	popq	%r14
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
	jne	LBB71_1
	jmp	LBB71_2
LBB71_1:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	jmp	LBB71_3
LBB71_2:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)         ## 8-byte Spill
LBB71_3:
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5gbumpEi
__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5gbumpEi: ## @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5gbumpEi
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
	movl	-12(%rbp), %esi
	movq	24(%rdi), %rax
	movslq	%esi, %rcx
	addq	%rcx, %rax
	movq	%rax, 24(%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__111char_traitsIcE7not_eofEi ## -- Begin function _ZNSt3__111char_traitsIcE7not_eofEi
	.weak_definition	__ZNSt3__111char_traitsIcE7not_eofEi
	.p2align	4, 0x90
__ZNSt3__111char_traitsIcE7not_eofEi:   ## @_ZNSt3__111char_traitsIcE7not_eofEi
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %edi
	movl	%edi, -8(%rbp)          ## 4-byte Spill
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movl	-8(%rbp), %edi          ## 4-byte Reload
	movl	%eax, %esi
	callq	__ZNSt3__111char_traitsIcE11eq_int_typeEii
	testb	$1, %al
	jne	LBB75_1
	jmp	LBB75_2
LBB75_1:
	callq	__ZNSt3__111char_traitsIcE3eofEv
	xorl	$-1, %eax
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	jmp	LBB75_3
LBB75_2:
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)         ## 4-byte Spill
LBB75_3:
	movl	-12(%rbp), %eax         ## 4-byte Reload
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__111char_traitsIcE2eqEcc ## -- Begin function _ZNSt3__111char_traitsIcE2eqEcc
	.weak_definition	__ZNSt3__111char_traitsIcE2eqEcc
	.p2align	4, 0x90
__ZNSt3__111char_traitsIcE2eqEcc:       ## @_ZNSt3__111char_traitsIcE2eqEcc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%sil, %al
	movb	%dil, %cl
	movb	%cl, -1(%rbp)
	movb	%al, -2(%rbp)
	movsbl	-1(%rbp), %esi
	movsbl	-2(%rbp), %edi
	cmpl	%edi, %esi
	sete	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__111char_traitsIcE12to_char_typeEi ## -- Begin function _ZNSt3__111char_traitsIcE12to_char_typeEi
	.weak_definition	__ZNSt3__111char_traitsIcE12to_char_typeEi
	.p2align	4, 0x90
__ZNSt3__111char_traitsIcE12to_char_typeEi: ## @_ZNSt3__111char_traitsIcE12to_char_typeEi
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %edi
	movb	%dil, %al
	movsbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE12__write_modeEv ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE12__write_modeEv
	.weak_definition	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE12__write_modeEv
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE12__write_modeEv: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE12__write_modeEv
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
	movl	396(%rdi), %eax
	andl	$16, %eax
	cmpl	$0, %eax
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	jne	LBB78_8
## %bb.1:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-16(%rbp), %rdx         ## 8-byte Reload
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%rcx, %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgEPcS4_S4_
	movq	-16(%rbp), %rcx         ## 8-byte Reload
	cmpq	$8, 96(%rcx)
	jbe	LBB78_6
## %bb.2:
	movq	-16(%rbp), %rax         ## 8-byte Reload
	testb	$1, 402(%rax)
	je	LBB78_4
## %bb.3:
	movq	-16(%rbp), %rax         ## 8-byte Reload
	movq	-16(%rbp), %rcx         ## 8-byte Reload
	movq	64(%rcx), %rsi
	movq	64(%rcx), %rdx
	movq	96(%rcx), %rdi
	subq	$1, %rdi
	addq	%rdi, %rdx
	movq	%rax, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_
	jmp	LBB78_5
LBB78_4:
	movq	-16(%rbp), %rax         ## 8-byte Reload
	movq	-16(%rbp), %rcx         ## 8-byte Reload
	movq	104(%rcx), %rsi
	movq	104(%rcx), %rdx
	movq	112(%rcx), %rdi
	subq	$1, %rdi
	addq	%rdi, %rdx
	movq	%rax, %rdi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_
LBB78_5:
	jmp	LBB78_7
LBB78_6:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-16(%rbp), %rdx         ## 8-byte Reload
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%rcx, %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpEPcS4_
LBB78_7:
	movq	-16(%rbp), %rax         ## 8-byte Reload
	movl	$16, 396(%rax)
LBB78_8:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5epptrEv
__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5epptrEv: ## @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5epptrEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	56(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbumpEi
__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbumpEi: ## @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbumpEi
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
	movl	-12(%rbp), %esi
	movq	48(%rdi), %rax
	movslq	%esi, %rcx
	addq	%rcx, %rax
	movq	%rax, 48(%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__17codecvtIcc11__mbstate_tE3outERS1_PKcS5_RS5_PcS7_RS7_
__ZNKSt3__17codecvtIcc11__mbstate_tE3outERS1_PKcS5_RS5_PcS7_RS7_: ## @_ZNKSt3__17codecvtIcc11__mbstate_tE3outERS1_PKcS5_RS5_PcS7_RS7_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$96, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	24(%rbp), %rax
	movq	16(%rbp), %r10
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -64(%rbp)
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rsi
	movq	-40(%rbp), %rdx
	movq	-48(%rbp), %rdi
	movq	-56(%rbp), %r8
	movq	-64(%rbp), %r9
	movq	16(%rbp), %r11
	movq	24(%rbp), %rbx
	movq	(%rcx), %r14
	movq	%rdi, -72(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movq	%r11, (%rsp)
	movq	%rbx, 8(%rsp)
	movq	%r10, -80(%rbp)         ## 8-byte Spill
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	callq	*24(%r14)
	addq	$96, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7__pbumpEl
__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7__pbumpEl: ## @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7__pbumpEl
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
	movq	-16(%rbp), %rdi
	addq	48(%rsi), %rdi
	movq	%rdi, 48(%rsi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ## -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_definition	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin10:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception10
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
Ltmp134:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp135:
	jmp	LBB83_1
LBB83_1:
Ltmp136:
	leaq	-40(%rbp), %rdi
	callq	__ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbEv
Ltmp137:
	movb	%al, -73(%rbp)          ## 1-byte Spill
	jmp	LBB83_2
LBB83_2:
	movb	-73(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB83_3
	jmp	LBB83_15
LBB83_3:
	movq	-8(%rbp), %rsi
	leaq	-72(%rbp), %rdi
	callq	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1ERNS_13basic_ostreamIcS2_EE
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	addq	%rax, %rdi
Ltmp138:
	movq	%rsi, -88(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__18ios_base5flagsEv
Ltmp139:
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	jmp	LBB83_4
LBB83_4:
	movl	-92(%rbp), %eax         ## 4-byte Reload
	andl	$176, %eax
	cmpl	$32, %eax
	jne	LBB83_6
## %bb.5:
	movq	-16(%rbp), %rax
	addq	-24(%rbp), %rax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	jmp	LBB83_7
LBB83_6:
	movq	-16(%rbp), %rax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
LBB83_7:
	movq	-104(%rbp), %rax        ## 8-byte Reload
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rdx
	addq	%rdx, %rcx
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	-24(%rsi), %rsi
	addq	%rsi, %rdx
Ltmp140:
	movq	%rdx, %rdi
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	movq	%rcx, -120(%rbp)        ## 8-byte Spill
	movq	%rdx, -128(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv
Ltmp141:
	movb	%al, -129(%rbp)         ## 1-byte Spill
	jmp	LBB83_8
LBB83_8:
	movq	-72(%rbp), %rdi
Ltmp142:
	movb	-129(%rbp), %al         ## 1-byte Reload
	movsbl	%al, %r9d
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	movq	-112(%rbp), %rdx        ## 8-byte Reload
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	-128(%rbp), %r8         ## 8-byte Reload
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp143:
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	jmp	LBB83_9
LBB83_9:
	movq	-144(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -64(%rbp)
	leaq	-64(%rbp), %rdi
	callq	__ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedEv
	testb	$1, %al
	jne	LBB83_10
	jmp	LBB83_14
LBB83_10:
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rax
Ltmp144:
	movl	$5, %esi
	movq	%rax, %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj
Ltmp145:
	jmp	LBB83_11
LBB83_11:
	jmp	LBB83_14
LBB83_12:
Ltmp151:
	movl	%edx, %ecx
	movq	%rax, -48(%rbp)
	movl	%ecx, -52(%rbp)
	jmp	LBB83_18
LBB83_13:
Ltmp146:
	movl	%edx, %ecx
	movq	%rax, -48(%rbp)
	movl	%ecx, -52(%rbp)
Ltmp147:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp148:
	jmp	LBB83_17
LBB83_14:
	jmp	LBB83_15
LBB83_15:
Ltmp149:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp150:
	jmp	LBB83_16
LBB83_16:
	jmp	LBB83_20
LBB83_17:
	jmp	LBB83_18
LBB83_18:
	movq	-48(%rbp), %rdi
	callq	___cxa_begin_catch
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rdi
Ltmp152:
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp153:
	jmp	LBB83_19
LBB83_19:
	callq	___cxa_end_catch
LBB83_20:
	movq	-8(%rbp), %rax
	addq	$160, %rsp
	popq	%rbp
	retq
LBB83_21:
Ltmp154:
	movl	%edx, %ecx
	movq	%rax, -48(%rbp)
	movl	%ecx, -52(%rbp)
Ltmp155:
	callq	___cxa_end_catch
Ltmp156:
	jmp	LBB83_22
LBB83_22:
	jmp	LBB83_23
LBB83_23:
	movq	-48(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB83_24:
Ltmp157:
	movq	%rax, %rdi
	movq	%rdx, -160(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end10:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table83:
Lexception10:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase8-Lttbaseref8
Lttbaseref8:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end10-Lcst_begin10
Lcst_begin10:
	.uleb128 Ltmp134-Lfunc_begin10  ## >> Call Site 1 <<
	.uleb128 Ltmp135-Ltmp134        ##   Call between Ltmp134 and Ltmp135
	.uleb128 Ltmp151-Lfunc_begin10  ##     jumps to Ltmp151
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp136-Lfunc_begin10  ## >> Call Site 2 <<
	.uleb128 Ltmp145-Ltmp136        ##   Call between Ltmp136 and Ltmp145
	.uleb128 Ltmp146-Lfunc_begin10  ##     jumps to Ltmp146
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp147-Lfunc_begin10  ## >> Call Site 3 <<
	.uleb128 Ltmp148-Ltmp147        ##   Call between Ltmp147 and Ltmp148
	.uleb128 Ltmp157-Lfunc_begin10  ##     jumps to Ltmp157
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp149-Lfunc_begin10  ## >> Call Site 4 <<
	.uleb128 Ltmp150-Ltmp149        ##   Call between Ltmp149 and Ltmp150
	.uleb128 Ltmp151-Lfunc_begin10  ##     jumps to Ltmp151
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp150-Lfunc_begin10  ## >> Call Site 5 <<
	.uleb128 Ltmp152-Ltmp150        ##   Call between Ltmp150 and Ltmp152
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp152-Lfunc_begin10  ## >> Call Site 6 <<
	.uleb128 Ltmp153-Ltmp152        ##   Call between Ltmp152 and Ltmp153
	.uleb128 Ltmp154-Lfunc_begin10  ##     jumps to Ltmp154
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp153-Lfunc_begin10  ## >> Call Site 7 <<
	.uleb128 Ltmp155-Ltmp153        ##   Call between Ltmp153 and Ltmp155
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp155-Lfunc_begin10  ## >> Call Site 8 <<
	.uleb128 Ltmp156-Ltmp155        ##   Call between Ltmp155 and Ltmp156
	.uleb128 Ltmp157-Lfunc_begin10  ##     jumps to Ltmp157
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp156-Lfunc_begin10  ## >> Call Site 9 <<
	.uleb128 Lfunc_end10-Ltmp156    ##   Call between Ltmp156 and Lfunc_end10
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end10:
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
	.globl	__ZNSt3__111char_traitsIcE6lengthEPKc ## -- Begin function _ZNSt3__111char_traitsIcE6lengthEPKc
	.weak_definition	__ZNSt3__111char_traitsIcE6lengthEPKc
	.p2align	4, 0x90
__ZNSt3__111char_traitsIcE6lengthEPKc:  ## @_ZNSt3__111char_traitsIcE6lengthEPKc
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
	callq	_strlen
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
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
Lfunc_begin11:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception11
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
	jne	LBB86_2
## %bb.1:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB86_25
LBB86_2:
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -72(%rbp)
	movq	-48(%rbp), %rdi
	callq	__ZNKSt3__18ios_base5widthEv
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	cmpq	-72(%rbp), %rax
	jle	LBB86_4
## %bb.3:
	movq	-72(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	%rax, %rcx
	movq	%rcx, -80(%rbp)
	jmp	LBB86_5
LBB86_4:
	movq	$0, -80(%rbp)
LBB86_5:
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jle	LBB86_9
## %bb.6:
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movq	-88(%rbp), %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl
	cmpq	-88(%rbp), %rax
	je	LBB86_8
## %bb.7:
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -96(%rbp)
	leaq	-96(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB86_25
LBB86_8:
	jmp	LBB86_9
LBB86_9:
	cmpq	$0, -80(%rbp)
	jle	LBB86_20
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
Ltmp158:
	movq	-184(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl
Ltmp159:
	movq	%rax, -192(%rbp)        ## 8-byte Spill
	jmp	LBB86_11
LBB86_11:
	movq	-192(%rbp), %rax        ## 8-byte Reload
	cmpq	-80(%rbp), %rax
	je	LBB86_16
## %bb.12:
Ltmp160:
	callq	__ZNSt3__1L15__get_nullptr_tEv
Ltmp161:
	movq	%rax, -200(%rbp)        ## 8-byte Spill
	jmp	LBB86_13
LBB86_13:
	movq	-200(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -144(%rbp)
Ltmp162:
	leaq	-144(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
Ltmp163:
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	jmp	LBB86_14
LBB86_14:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movl	$1, -148(%rbp)
	jmp	LBB86_17
LBB86_15:
Ltmp164:
	movl	%edx, %ecx
	movq	%rax, -128(%rbp)
	movl	%ecx, -132(%rbp)
Ltmp165:
	leaq	-120(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp166:
	jmp	LBB86_19
LBB86_16:
	movl	$0, -148(%rbp)
LBB86_17:
	leaq	-120(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	movl	-148(%rbp), %eax
	testl	%eax, %eax
	movl	%eax, -212(%rbp)        ## 4-byte Spill
	je	LBB86_18
	jmp	LBB86_29
LBB86_29:
	movl	-212(%rbp), %eax        ## 4-byte Reload
	subl	$1, %eax
	movl	%eax, -216(%rbp)        ## 4-byte Spill
	je	LBB86_25
	jmp	LBB86_28
LBB86_18:
	jmp	LBB86_20
LBB86_19:
	jmp	LBB86_26
LBB86_20:
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jle	LBB86_24
## %bb.21:
	movq	-16(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movq	-88(%rbp), %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl
	cmpq	-88(%rbp), %rax
	je	LBB86_23
## %bb.22:
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -160(%rbp)
	leaq	-160(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB86_25
LBB86_23:
	jmp	LBB86_24
LBB86_24:
	xorl	%eax, %eax
	movl	%eax, %esi
	movq	-48(%rbp), %rdi
	callq	__ZNSt3__18ios_base5widthEl
	movq	-16(%rbp), %rsi
	movq	%rsi, -8(%rbp)
	movq	%rax, -224(%rbp)        ## 8-byte Spill
LBB86_25:
	movq	-8(%rbp), %rax
	addq	$240, %rsp
	popq	%rbp
	retq
LBB86_26:
	movq	-128(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB86_27:
Ltmp167:
	movq	%rax, %rdi
	movq	%rdx, -232(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
LBB86_28:
	ud2
Lfunc_end11:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table86:
Lexception11:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase9-Lttbaseref9
Lttbaseref9:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end11-Lcst_begin11
Lcst_begin11:
	.uleb128 Lfunc_begin11-Lfunc_begin11 ## >> Call Site 1 <<
	.uleb128 Ltmp158-Lfunc_begin11  ##   Call between Lfunc_begin11 and Ltmp158
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp158-Lfunc_begin11  ## >> Call Site 2 <<
	.uleb128 Ltmp163-Ltmp158        ##   Call between Ltmp158 and Ltmp163
	.uleb128 Ltmp164-Lfunc_begin11  ##     jumps to Ltmp164
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp165-Lfunc_begin11  ## >> Call Site 3 <<
	.uleb128 Ltmp166-Ltmp165        ##   Call between Ltmp165 and Ltmp166
	.uleb128 Ltmp167-Lfunc_begin11  ##     jumps to Ltmp167
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp166-Lfunc_begin11  ## >> Call Site 4 <<
	.uleb128 Lfunc_end11-Ltmp166    ##   Call between Ltmp166 and Lfunc_end11
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end11:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase9:
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
	jne	LBB89_1
	jmp	LBB89_2
LBB89_1:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movl	$32, %esi
	callq	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc
	movsbl	%al, %esi
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movl	%esi, 144(%rdi)
LBB89_2:
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
	jne	LBB108_1
	jmp	LBB108_2
LBB108_1:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	jmp	LBB108_3
LBB108_2:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv
	movq	%rax, -24(%rbp)         ## 8-byte Spill
LBB108_3:
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
Lfunc_begin12:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception12
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
Ltmp168:
	movq	%rsi, -40(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv
Ltmp169:
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	jmp	LBB116_1
LBB116_1:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%rax)
	addq	$48, %rsp
	popq	%rbp
	retq
LBB116_2:
Ltmp170:
	movl	%edx, %ecx
	movq	%rax, -24(%rbp)
	movl	%ecx, -28(%rbp)
## %bb.3:
	movq	-24(%rbp), %rdi
	callq	___cxa_call_unexpected
Lfunc_end12:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table116:
Lexception12:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase10-Lttbaseref10
Lttbaseref10:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end12-Lcst_begin12
Lcst_begin12:
	.uleb128 Ltmp168-Lfunc_begin12  ## >> Call Site 1 <<
	.uleb128 Ltmp169-Ltmp168        ##   Call between Ltmp168 and Ltmp169
	.uleb128 Ltmp170-Lfunc_begin12  ##     jumps to Ltmp170
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp169-Lfunc_begin12  ## >> Call Site 2 <<
	.uleb128 Lfunc_end12-Ltmp169    ##   Call between Ltmp169 and Lfunc_end12
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end12:
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
	.p2align	2
Lttbase10:
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
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc
__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc: ## @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc
Lfunc_begin13:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception13
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
Ltmp171:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE
Ltmp172:
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	jmp	LBB119_1
LBB119_1:
	movsbl	-9(%rbp), %esi
Ltmp173:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__15ctypeIcE5widenEc
Ltmp174:
	movb	%al, -57(%rbp)          ## 1-byte Spill
	jmp	LBB119_2
LBB119_2:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movb	-57(%rbp), %al          ## 1-byte Reload
	movsbl	%al, %eax
	addq	$80, %rsp
	popq	%rbp
	retq
LBB119_3:
Ltmp175:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
Ltmp176:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp177:
	jmp	LBB119_4
LBB119_4:
	jmp	LBB119_5
LBB119_5:
	movq	-32(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB119_6:
Ltmp178:
	movq	%rax, %rdi
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end13:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table119:
Lexception13:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase11-Lttbaseref11
Lttbaseref11:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end13-Lcst_begin13
Lcst_begin13:
	.uleb128 Lfunc_begin13-Lfunc_begin13 ## >> Call Site 1 <<
	.uleb128 Ltmp171-Lfunc_begin13  ##   Call between Lfunc_begin13 and Ltmp171
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp171-Lfunc_begin13  ## >> Call Site 2 <<
	.uleb128 Ltmp174-Ltmp171        ##   Call between Ltmp171 and Ltmp174
	.uleb128 Ltmp175-Lfunc_begin13  ##     jumps to Ltmp175
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp174-Lfunc_begin13  ## >> Call Site 3 <<
	.uleb128 Ltmp176-Ltmp174        ##   Call between Ltmp174 and Ltmp176
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp176-Lfunc_begin13  ## >> Call Site 4 <<
	.uleb128 Ltmp177-Ltmp176        ##   Call between Ltmp176 and Ltmp177
	.uleb128 Ltmp178-Lfunc_begin13  ##     jumps to Ltmp178
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp177-Lfunc_begin13  ## >> Call Site 5 <<
	.uleb128 Lfunc_end13-Ltmp177    ##   Call between Ltmp177 and Lfunc_end13
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end13:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase11:
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__19basic_iosIcNS_11char_traitsIcEEEC2Ev
__ZNSt3__19basic_iosIcNS_11char_traitsIcEEEC2Ev: ## @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEEC2Ev
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
	callq	__ZNSt3__18ios_baseC2Ev
	movq	__ZTVNSt3__19basic_iosIcNS_11char_traitsIcEEEE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, (%rdi)
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEEC2EPNS_15basic_streambufIcS2_EE
__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEEC2EPNS_15basic_streambufIcS2_EE: ## @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEEC2EPNS_15basic_streambufIcS2_EE
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
	movq	(%rsi), %rdi
	movq	%rdi, (%rdx)
	movq	8(%rsi), %rsi
	movq	(%rdx), %rdi
	movq	-24(%rdi), %rdi
	movq	%rsi, (%rdx,%rdi)
	movq	(%rdx), %rsi
	movq	-24(%rsi), %rsi
	addq	%rsi, %rdx
	movq	-24(%rbp), %rsi
	movq	%rdx, %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE4initEPNS_15basic_streambufIcS2_EE
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC1Ev ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC1Ev
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC1Ev
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC1Ev: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC1Ev
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
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openEPKcj ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openEPKcj
	.weak_definition	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openEPKcj
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openEPKcj: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openEPKcj
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
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rsi
	movq	$0, -32(%rbp)
	cmpq	$0, 120(%rsi)
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	jne	LBB126_11
## %bb.1:
	movl	-20(%rbp), %edi
	callq	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE15__make_mdstringEj
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	LBB126_10
## %bb.2:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rdi
	movq	-40(%rbp), %rsi
	callq	_fopen
	movq	-48(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, 120(%rsi)
	cmpq	$0, 120(%rsi)
	je	LBB126_8
## %bb.3:
	movl	-20(%rbp), %eax
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	%eax, 392(%rcx)
	movl	-20(%rbp), %eax
	andl	$2, %eax
	cmpl	$0, %eax
	je	LBB126_7
## %bb.4:
	xorl	%eax, %eax
	movl	%eax, %esi
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	120(%rcx), %rdi
	movl	$2, %edx
	callq	_fseek
	cmpl	$0, %eax
	je	LBB126_6
## %bb.5:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	120(%rax), %rdi
	callq	_fclose
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	$0, 120(%rdi)
	movq	$0, -32(%rbp)
	movl	%eax, -52(%rbp)         ## 4-byte Spill
LBB126_6:
	jmp	LBB126_7
LBB126_7:
	jmp	LBB126_9
LBB126_8:
	movq	$0, -32(%rbp)
LBB126_9:
	jmp	LBB126_10
LBB126_10:
	jmp	LBB126_11
LBB126_11:
	movq	-32(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__18ios_baseC2Ev
__ZNSt3__18ios_baseC2Ev:                ## @_ZNSt3__18ios_baseC2Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	__ZTVNSt3__18ios_baseE@GOTPCREL(%rip), %rax
	addq	$16, %rax
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rax, (%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__19basic_iosIcNS_11char_traitsIcEEE4initEPNS_15basic_streambufIcS2_EE
__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE4initEPNS_15basic_streambufIcS2_EE: ## @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE4initEPNS_15basic_streambufIcS2_EE
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
	callq	__ZNSt3__18ios_base4initEPv
	movq	-24(%rbp), %rax         ## 8-byte Reload
	movq	$0, 136(%rax)
	callq	__ZNSt3__111char_traitsIcE3eofEv
	movq	-24(%rbp), %rsi         ## 8-byte Reload
	movl	%eax, 144(%rsi)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev
	.p2align	4, 0x90
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev
Lfunc_begin14:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception14
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -56(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev
	movq	__ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE@GOTPCREL(%rip), %rdi
	addq	$16, %rdi
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	%rdi, (%rax)
	movq	$0, 64(%rax)
	movq	$0, 72(%rax)
	movq	$0, 80(%rax)
	movq	$0, 96(%rax)
	movq	$0, 104(%rax)
	movq	$0, 112(%rax)
	movq	$0, 120(%rax)
	subq	$-128, %rax
Ltmp179:
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L15__get_nullptr_tEv
Ltmp180:
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	jmp	LBB129_1
LBB129_1:
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -16(%rbp)
Ltmp181:
	leaq	-16(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_IKNS_7codecvtIcc11__mbstate_tEEEEv
Ltmp182:
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	jmp	LBB129_2
LBB129_2:
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%rax)
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	movq	$0, 256(%rdx)
	movq	$0, 248(%rdx)
	movq	$0, 240(%rdx)
	movq	$0, 232(%rdx)
	movq	$0, 224(%rdx)
	movq	$0, 216(%rdx)
	movq	$0, 208(%rdx)
	movq	$0, 200(%rdx)
	movq	$0, 192(%rdx)
	movq	$0, 184(%rdx)
	movq	$0, 176(%rdx)
	movq	$0, 168(%rdx)
	movq	$0, 160(%rdx)
	movq	$0, 152(%rdx)
	movq	$0, 144(%rdx)
	movq	$0, 136(%rdx)
	movq	$0, 384(%rdx)
	movq	$0, 376(%rdx)
	movq	$0, 368(%rdx)
	movq	$0, 360(%rdx)
	movq	$0, 352(%rdx)
	movq	$0, 344(%rdx)
	movq	$0, 336(%rdx)
	movq	$0, 328(%rdx)
	movq	$0, 320(%rdx)
	movq	$0, 312(%rdx)
	movq	$0, 304(%rdx)
	movq	$0, 296(%rdx)
	movq	$0, 288(%rdx)
	movq	$0, 280(%rdx)
	movq	$0, 272(%rdx)
	movq	$0, 264(%rdx)
	movl	$0, 392(%rdx)
	movl	$0, 396(%rdx)
	movb	$0, 400(%rdx)
	movb	$0, 401(%rdx)
	movb	$0, 402(%rdx)
Ltmp183:
	leaq	-40(%rbp), %rdi
	movq	%rdx, %rsi
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE6getlocEv
Ltmp184:
	jmp	LBB129_3
LBB129_3:
	leaq	-40(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__1L9has_facetINS_7codecvtIcc11__mbstate_tEEEEbRKNS_6localeE
Ltmp185:
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	movb	%al, -89(%rbp)          ## 1-byte Spill
	callq	__ZNSt3__16localeD1Ev
Ltmp186:
	jmp	LBB129_4
LBB129_4:
	movb	-89(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB129_5
	jmp	LBB129_12
LBB129_5:
Ltmp187:
	leaq	-48(%rbp), %rdi
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	callq	__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE6getlocEv
Ltmp188:
	jmp	LBB129_6
LBB129_6:
Ltmp189:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__1L9use_facetINS_7codecvtIcc11__mbstate_tEEEERKT_RKNS_6localeE
Ltmp190:
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	jmp	LBB129_7
LBB129_7:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	-104(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, 128(%rax)
Ltmp194:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp195:
	jmp	LBB129_8
LBB129_8:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	128(%rax), %rdi
	callq	__ZNKSt3__17codecvtIcc11__mbstate_tE13always_noconvEv
	andb	$1, %al
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	movb	%al, 402(%rdi)
	jmp	LBB129_12
LBB129_9:
Ltmp198:
	movl	%edx, %ecx
	movq	%rax, -24(%rbp)
	movl	%ecx, -28(%rbp)
	jmp	LBB129_14
LBB129_10:
Ltmp191:
	movl	%edx, %ecx
	movq	%rax, -24(%rbp)
	movl	%ecx, -28(%rbp)
Ltmp192:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp193:
	jmp	LBB129_11
LBB129_11:
	jmp	LBB129_14
LBB129_12:
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rcx
	movq	24(%rcx), %rcx
Ltmp196:
	xorl	%edx, %edx
	movl	%edx, %esi
	movl	$4096, %edx             ## imm = 0x1000
                                        ## kill: def $rdx killed $edx
	movq	%rax, %rdi
	callq	*%rcx
Ltmp197:
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	jmp	LBB129_13
LBB129_13:
	addq	$128, %rsp
	popq	%rbp
	retq
LBB129_14:
Ltmp199:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
Ltmp200:
	jmp	LBB129_15
LBB129_15:
	jmp	LBB129_16
LBB129_16:
	movq	-24(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB129_17:
Ltmp201:
	movq	%rax, %rdi
	movq	%rdx, -120(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end14:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table129:
Lexception14:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase12-Lttbaseref12
Lttbaseref12:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end14-Lcst_begin14
Lcst_begin14:
	.uleb128 Lfunc_begin14-Lfunc_begin14 ## >> Call Site 1 <<
	.uleb128 Ltmp179-Lfunc_begin14  ##   Call between Lfunc_begin14 and Ltmp179
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp179-Lfunc_begin14  ## >> Call Site 2 <<
	.uleb128 Ltmp188-Ltmp179        ##   Call between Ltmp179 and Ltmp188
	.uleb128 Ltmp198-Lfunc_begin14  ##     jumps to Ltmp198
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp189-Lfunc_begin14  ## >> Call Site 3 <<
	.uleb128 Ltmp190-Ltmp189        ##   Call between Ltmp189 and Ltmp190
	.uleb128 Ltmp191-Lfunc_begin14  ##     jumps to Ltmp191
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp194-Lfunc_begin14  ## >> Call Site 4 <<
	.uleb128 Ltmp195-Ltmp194        ##   Call between Ltmp194 and Ltmp195
	.uleb128 Ltmp198-Lfunc_begin14  ##     jumps to Ltmp198
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp192-Lfunc_begin14  ## >> Call Site 5 <<
	.uleb128 Ltmp193-Ltmp192        ##   Call between Ltmp192 and Ltmp193
	.uleb128 Ltmp201-Lfunc_begin14  ##     jumps to Ltmp201
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp196-Lfunc_begin14  ## >> Call Site 6 <<
	.uleb128 Ltmp197-Ltmp196        ##   Call between Ltmp196 and Ltmp197
	.uleb128 Ltmp198-Lfunc_begin14  ##     jumps to Ltmp198
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp199-Lfunc_begin14  ## >> Call Site 7 <<
	.uleb128 Ltmp200-Ltmp199        ##   Call between Ltmp199 and Ltmp200
	.uleb128 Ltmp201-Lfunc_begin14  ##     jumps to Ltmp201
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp200-Lfunc_begin14  ## >> Call Site 8 <<
	.uleb128 Lfunc_end14-Ltmp200    ##   Call between Ltmp200 and Lfunc_end14
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end14:
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
	.p2align	2
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
Lttbase12:
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__19nullptr_tcvPT_IKNS_7codecvtIcc11__mbstate_tEEEEv
__ZNKSt3__19nullptr_tcvPT_IKNS_7codecvtIcc11__mbstate_tEEEEv: ## @_ZNKSt3__19nullptr_tcvPT_IKNS_7codecvtIcc11__mbstate_tEEEEv
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1L9has_facetINS_7codecvtIcc11__mbstate_tEEEEbRKNS_6localeE
__ZNSt3__1L9has_facetINS_7codecvtIcc11__mbstate_tEEEEbRKNS_6localeE: ## @_ZNSt3__1L9has_facetINS_7codecvtIcc11__mbstate_tEEEEbRKNS_6localeE
Lfunc_begin15:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception15
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
Ltmp202:
	movq	__ZNSt3__17codecvtIcc11__mbstate_tE2idE@GOTPCREL(%rip), %rsi
	callq	__ZNKSt3__16locale9has_facetERNS0_2idE
Ltmp203:
	movb	%al, -21(%rbp)          ## 1-byte Spill
	jmp	LBB131_1
LBB131_1:
	movb	-21(%rbp), %al          ## 1-byte Reload
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
LBB131_2:
Ltmp204:
	movl	%edx, %ecx
	movq	%rax, -16(%rbp)
	movl	%ecx, -20(%rbp)
## %bb.3:
	movq	-16(%rbp), %rdi
	callq	___cxa_call_unexpected
Lfunc_end15:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table131:
Lexception15:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase13-Lttbaseref13
Lttbaseref13:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end15-Lcst_begin15
Lcst_begin15:
	.uleb128 Ltmp202-Lfunc_begin15  ## >> Call Site 1 <<
	.uleb128 Ltmp203-Ltmp202        ##   Call between Ltmp202 and Ltmp203
	.uleb128 Ltmp204-Lfunc_begin15  ##     jumps to Ltmp204
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp203-Lfunc_begin15  ## >> Call Site 2 <<
	.uleb128 Lfunc_end15-Ltmp203    ##   Call between Ltmp203 and Lfunc_end15
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end15:
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
	.p2align	2
Lttbase13:
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE6getlocEv
__ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE6getlocEv: ## @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE6getlocEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, %rax
	movq	%rsi, -8(%rbp)
	movq	-8(%rbp), %rsi
	addq	$8, %rsi
	movq	%rax, -16(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__16localeC1ERKS0_
	movq	-16(%rbp), %rax         ## 8-byte Reload
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE15__make_mdstringEj
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE15__make_mdstringEj: ## @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE15__make_mdstringEj
Lfunc_begin16:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception16
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movl	%edi, -12(%rbp)
	movl	-12(%rbp), %edi
	andl	$-3, %edi
	decl	%edi
	movl	%edi, %eax
	subl	$59, %edi
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movl	%edi, -52(%rbp)         ## 4-byte Spill
	ja	LBB133_13
## %bb.19:
	leaq	LJTI133_0(%rip), %rax
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB133_1:
	leaq	L_.str.6(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_2:
	leaq	L_.str.7(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_3:
	leaq	L_.str.8(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_4:
	leaq	L_.str.9(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_5:
	leaq	L_.str.10(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_6:
	leaq	L_.str.11(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_7:
	leaq	L_.str.12(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_8:
	leaq	L_.str.13(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_9:
	leaq	L_.str.14(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_10:
	leaq	L_.str.15(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_11:
	leaq	L_.str.16(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_12:
	leaq	L_.str.17(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_13:
Ltmp205:
	callq	__ZNSt3__1L15__get_nullptr_tEv
Ltmp206:
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	jmp	LBB133_14
LBB133_14:
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -24(%rbp)
Ltmp207:
	leaq	-24(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_IKcEEv
Ltmp208:
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	jmp	LBB133_15
LBB133_15:
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	%rax, -8(%rbp)
	jmp	LBB133_18
LBB133_16:
Ltmp209:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
## %bb.17:
	movq	-32(%rbp), %rdi
	callq	___cxa_call_unexpected
LBB133_18:
	movq	-8(%rbp), %rax
	addq	$80, %rsp
	popq	%rbp
	retq
Lfunc_end16:
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L133_0_set_2, LBB133_2-LJTI133_0
.set L133_0_set_13, LBB133_13-LJTI133_0
.set L133_0_set_8, LBB133_8-LJTI133_0
.set L133_0_set_3, LBB133_3-LJTI133_0
.set L133_0_set_6, LBB133_6-LJTI133_0
.set L133_0_set_9, LBB133_9-LJTI133_0
.set L133_0_set_12, LBB133_12-LJTI133_0
.set L133_0_set_1, LBB133_1-LJTI133_0
.set L133_0_set_7, LBB133_7-LJTI133_0
.set L133_0_set_4, LBB133_4-LJTI133_0
.set L133_0_set_10, LBB133_10-LJTI133_0
.set L133_0_set_5, LBB133_5-LJTI133_0
.set L133_0_set_11, LBB133_11-LJTI133_0
LJTI133_0:
	.long	L133_0_set_2
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_8
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_3
	.long	L133_0_set_6
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_9
	.long	L133_0_set_12
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_1
	.long	L133_0_set_2
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_7
	.long	L133_0_set_8
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_4
	.long	L133_0_set_6
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_10
	.long	L133_0_set_12
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_1
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_7
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_5
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_13
	.long	L133_0_set_11
	.end_data_region
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table133:
Lexception16:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase14-Lttbaseref14
Lttbaseref14:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end16-Lcst_begin16
Lcst_begin16:
	.uleb128 Ltmp205-Lfunc_begin16  ## >> Call Site 1 <<
	.uleb128 Ltmp208-Ltmp205        ##   Call between Ltmp205 and Ltmp208
	.uleb128 Ltmp209-Lfunc_begin16  ##     jumps to Ltmp209
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp208-Lfunc_begin16  ## >> Call Site 2 <<
	.uleb128 Lfunc_end16-Ltmp208    ##   Call between Ltmp208 and Lfunc_end16
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end16:
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
	.p2align	2
Lttbase14:
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__19nullptr_tcvPT_IKcEEv
__ZNKSt3__19nullptr_tcvPT_IKcEEv:       ## @_ZNKSt3__19nullptr_tcvPT_IKcEEv
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
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__113basic_filebufIcNS_11char_traitsIcEEE7is_openEv
__ZNKSt3__113basic_filebufIcNS_11char_traitsIcEEE7is_openEv: ## @_ZNKSt3__113basic_filebufIcNS_11char_traitsIcEEE7is_openEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	cmpq	$0, 120(%rdi)
	setne	%al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Size"

L_.str.1:                               ## @.str.1
	.asciz	";"

L_.str.2:                               ## @.str.2
	.asciz	";NonParallel"

L_.str.3:                               ## @.str.3
	.asciz	"docs/TEvenTime.csv"

L_.str.4:                               ## @.str.4
	.asciz	"File open error!"

L_.str.5:                               ## @.str.5
	.asciz	"docs/TOddTime.csv"

	.section	__DATA,__const
	.globl	__ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE ## @_ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE
	.weak_def_can_be_hidden	__ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE
	.p2align	3
__ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE:
	.quad	416
	.quad	0
	.quad	__ZTINSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE
	.quad	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
	.quad	__ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev
	.quad	-416
	.quad	-416
	.quad	__ZTINSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE
	.quad	__ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev
	.quad	__ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev

	.globl	__ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE ## @_ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE
	.weak_def_can_be_hidden	__ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE
	.p2align	4
__ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE:
	.quad	__ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE+24
	.quad	__ZTCNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE0_NS_13basic_ostreamIcS2_EE+24
	.quad	__ZTCNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE0_NS_13basic_ostreamIcS2_EE+64
	.quad	__ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE+64

	.globl	__ZTCNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE0_NS_13basic_ostreamIcS2_EE ## @_ZTCNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE0_NS_13basic_ostreamIcS2_EE
	.weak_def_can_be_hidden	__ZTCNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE0_NS_13basic_ostreamIcS2_EE
	.p2align	4
__ZTCNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE0_NS_13basic_ostreamIcS2_EE:
	.quad	416
	.quad	0
	.quad	__ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE
	.quad	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev
	.quad	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev
	.quad	-416
	.quad	-416
	.quad	__ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE
	.quad	__ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev
	.quad	__ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev

	.section	__TEXT,__const
	.globl	__ZTSNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE ## @_ZTSNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE
	.weak_definition	__ZTSNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE
	.p2align	4
__ZTSNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE:
	.asciz	"NSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE"

	.section	__DATA,__const
	.globl	__ZTINSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE ## @_ZTINSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE
	.weak_definition	__ZTINSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE
	.p2align	4
__ZTINSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE
	.quad	__ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE

	.globl	__ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE ## @_ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.weak_def_can_be_hidden	__ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.p2align	3
__ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE:
	.quad	0
	.quad	__ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9showmanycEv
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsgetnEPcl
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5uflowEv
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsputnEPKcl
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi

	.section	__TEXT,__const
	.globl	__ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE ## @_ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.weak_definition	__ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.p2align	4
__ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE:
	.asciz	"NSt3__113basic_filebufIcNS_11char_traitsIcEEEE"

	.section	__DATA,__const
	.globl	__ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE ## @_ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.weak_definition	__ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.p2align	4
__ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.quad	__ZTINSt3__115basic_streambufIcNS_11char_traitsIcEEEE

	.section	__TEXT,__cstring,cstring_literals
L_.str.6:                               ## @.str.6
	.asciz	"w"

L_.str.7:                               ## @.str.7
	.asciz	"a"

L_.str.8:                               ## @.str.8
	.asciz	"r"

L_.str.9:                               ## @.str.9
	.asciz	"r+"

L_.str.10:                              ## @.str.10
	.asciz	"w+"

L_.str.11:                              ## @.str.11
	.asciz	"a+"

L_.str.12:                              ## @.str.12
	.asciz	"wb"

L_.str.13:                              ## @.str.13
	.asciz	"ab"

L_.str.14:                              ## @.str.14
	.asciz	"rb"

L_.str.15:                              ## @.str.15
	.asciz	"r+b"

L_.str.16:                              ## @.str.16
	.asciz	"w+b"

L_.str.17:                              ## @.str.17
	.asciz	"a+b"


.subsections_via_symbols
