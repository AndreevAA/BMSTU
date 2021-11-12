	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
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
	subq	$336, %rsp              ## imm = 0x150
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, -8(%rbp)
	movl	$0, -24(%rbp)
	movl	%edi, -28(%rbp)
	movq	%rsi, -40(%rbp)
	movq	%rcx, %rdi
	callq	_time
	movl	%eax, %r8d
	movl	%r8d, %edi
	callq	_srand
	xorl	%edi, %edi
	movb	%dil, %r9b
	movl	-28(%rbp), %edi
	movb	$0, -65(%rbp)
	cmpl	$2, %edi
	movb	%r9b, -233(%rbp)        ## 1-byte Spill
	jne	LBB0_2
## %bb.1:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rsi
	leaq	-64(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1INS_9nullptr_tEEEPKc
	movb	$1, -65(%rbp)
	leaq	-64(%rbp), %rdi
	leaq	L_.str(%rip), %rsi
	callq	__ZNSt3__1eqIcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_
	movb	%al, -233(%rbp)         ## 1-byte Spill
LBB0_2:
	movb	-233(%rbp), %al         ## 1-byte Reload
	testb	$1, -65(%rbp)
	movb	%al, -234(%rbp)         ## 1-byte Spill
	jne	LBB0_3
	jmp	LBB0_4
LBB0_3:
	leaq	-64(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
LBB0_4:
	movb	-234(%rbp), %al         ## 1-byte Reload
	testb	$1, %al
	jne	LBB0_5
	jmp	LBB0_17
LBB0_5:
	movl	$10, -72(%rbp)
	movl	$20, -76(%rbp)
	movl	$30, -80(%rbp)
	movl	-72(%rbp), %esi
	movl	-76(%rbp), %edx
	leaq	-96(%rbp), %rdi
	callq	__ZN6MatrixC1Ejj
	movl	-76(%rbp), %esi
	movl	-80(%rbp), %edx
Ltmp46:
	leaq	-112(%rbp), %rdi
	callq	__ZN6MatrixC1Ejj
Ltmp47:
	jmp	LBB0_6
LBB0_6:
Ltmp48:
	leaq	-96(%rbp), %rdi
	movl	$-10, %esi
	movl	$10, %edx
	callq	__ZN6Matrix9randomizeEii
Ltmp49:
	jmp	LBB0_7
LBB0_7:
Ltmp50:
	leaq	-112(%rbp), %rdi
	movl	$-10, %esi
	movl	$10, %edx
	callq	__ZN6Matrix9randomizeEii
Ltmp51:
	jmp	LBB0_8
LBB0_8:
Ltmp52:
	leaq	-144(%rbp), %rdi
	leaq	-96(%rbp), %rsi
	leaq	-112(%rbp), %rdx
	movl	$10, %ecx
	callq	__Z24multiply_vinograd_threadR6MatrixS0_j
Ltmp53:
	jmp	LBB0_9
LBB0_9:
	movl	$0, -24(%rbp)
Ltmp54:
	leaq	-144(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp55:
	jmp	LBB0_12
LBB0_10:
Ltmp61:
	movl	%edx, %ecx
	movq	%rax, -120(%rbp)
	movl	%ecx, -124(%rbp)
	jmp	LBB0_15
LBB0_11:
Ltmp56:
	movl	%edx, %ecx
	movq	%rax, -120(%rbp)
	movl	%ecx, -124(%rbp)
Ltmp57:
	leaq	-112(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp58:
	jmp	LBB0_14
LBB0_12:
Ltmp59:
	leaq	-112(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp60:
	jmp	LBB0_13
LBB0_13:
	leaq	-96(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
	jmp	LBB0_49
LBB0_14:
	jmp	LBB0_15
LBB0_15:
Ltmp62:
	leaq	-96(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp63:
	jmp	LBB0_16
LBB0_16:
	jmp	LBB0_51
LBB0_17:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movl	$0, -164(%rbp)
	movq	%rax, -248(%rbp)        ## 8-byte Spill
LBB0_18:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$3, -164(%rbp)
	jge	LBB0_20
## %bb.19:                              ##   in Loop: Header=BB0_18 Depth=1
	movq	__ZNSt3__13cinE@GOTPCREL(%rip), %rdi
	movslq	-164(%rbp), %rax
	shlq	$2, %rax
	leaq	-20(%rbp), %rcx
	addq	%rax, %rcx
	movq	%rcx, %rsi
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERi
	movl	-164(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -164(%rbp)
	movq	%rax, -256(%rbp)        ## 8-byte Spill
	jmp	LBB0_18
LBB0_20:
	movl	-20(%rbp), %eax
	movl	%eax, -148(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -152(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -156(%rbp)
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movq	__ZNSt3__13cinE@GOTPCREL(%rip), %rdi
	leaq	-160(%rbp), %rsi
	movq	%rax, -264(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEErsERj
	movl	-148(%rbp), %esi
	movl	-152(%rbp), %edx
	leaq	-184(%rbp), %rdi
	movq	%rax, -272(%rbp)        ## 8-byte Spill
	callq	__ZN6MatrixC1Ejj
	movl	-152(%rbp), %esi
	movl	-156(%rbp), %edx
Ltmp0:
	leaq	-200(%rbp), %rdi
	callq	__ZN6MatrixC1Ejj
Ltmp1:
	jmp	LBB0_21
LBB0_21:
Ltmp2:
	leaq	-184(%rbp), %rdi
	movl	$-10, %esi
	movl	$10, %edx
	callq	__ZN6Matrix9randomizeEii
Ltmp3:
	jmp	LBB0_22
LBB0_22:
Ltmp4:
	leaq	-200(%rbp), %rdi
	movl	$-10, %esi
	movl	$10, %edx
	callq	__ZN6Matrix9randomizeEii
Ltmp5:
	jmp	LBB0_23
LBB0_23:
Ltmp6:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	__ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
Ltmp7:
	movq	%rax, -280(%rbp)        ## 8-byte Spill
	jmp	LBB0_24
LBB0_24:
Ltmp8:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rsi
	leaq	-184(%rbp), %rdi
	callq	__ZN6Matrix5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE
Ltmp9:
	jmp	LBB0_25
LBB0_25:
Ltmp10:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	__ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
Ltmp11:
	movq	%rax, -288(%rbp)        ## 8-byte Spill
	jmp	LBB0_26
LBB0_26:
Ltmp12:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rsi
	leaq	-200(%rbp), %rdi
	callq	__ZN6Matrix5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE
Ltmp13:
	jmp	LBB0_27
LBB0_27:
Ltmp14:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	__ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
Ltmp15:
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	jmp	LBB0_28
LBB0_28:
	movl	-160(%rbp), %ecx
Ltmp16:
	leaq	-216(%rbp), %rdi
	leaq	-184(%rbp), %rsi
	leaq	-200(%rbp), %rdx
	callq	__Z24multiply_vinograd_threadR6MatrixS0_j
Ltmp17:
	jmp	LBB0_29
LBB0_29:
Ltmp18:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rsi
	leaq	-216(%rbp), %rdi
	callq	__ZN6Matrix5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE
Ltmp19:
	jmp	LBB0_30
LBB0_30:
Ltmp20:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	__ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
Ltmp21:
	movq	%rax, -304(%rbp)        ## 8-byte Spill
	jmp	LBB0_31
LBB0_31:
Ltmp22:
	leaq	-232(%rbp), %rdi
	leaq	-184(%rbp), %rsi
	leaq	-200(%rbp), %rdx
	callq	__Z26multiply_vinograd_nothreadR6MatrixS0_
Ltmp23:
	jmp	LBB0_32
LBB0_32:
Ltmp24:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rsi
	leaq	-232(%rbp), %rdi
	callq	__ZN6Matrix5writeERNSt3__113basic_ostreamIcNS0_11char_traitsIcEEEE
Ltmp25:
	jmp	LBB0_33
LBB0_33:
Ltmp26:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	__ZNSt3__1L4endlIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(%rip), %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEPFRS3_S4_E
Ltmp27:
	movq	%rax, -312(%rbp)        ## 8-byte Spill
	jmp	LBB0_34
LBB0_34:
	movl	$0, -24(%rbp)
Ltmp31:
	leaq	-232(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp32:
	jmp	LBB0_39
LBB0_35:
Ltmp43:
	movl	%edx, %ecx
	movq	%rax, -120(%rbp)
	movl	%ecx, -124(%rbp)
	jmp	LBB0_47
LBB0_36:
Ltmp38:
	movl	%edx, %ecx
	movq	%rax, -120(%rbp)
	movl	%ecx, -124(%rbp)
	jmp	LBB0_45
LBB0_37:
Ltmp33:
	movl	%edx, %ecx
	movq	%rax, -120(%rbp)
	movl	%ecx, -124(%rbp)
	jmp	LBB0_42
LBB0_38:
Ltmp28:
	movl	%edx, %ecx
	movq	%rax, -120(%rbp)
	movl	%ecx, -124(%rbp)
Ltmp29:
	leaq	-232(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp30:
	jmp	LBB0_40
LBB0_39:
Ltmp36:
	leaq	-216(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp37:
	jmp	LBB0_41
LBB0_40:
	jmp	LBB0_42
LBB0_41:
Ltmp41:
	leaq	-200(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp42:
	jmp	LBB0_44
LBB0_42:
Ltmp34:
	leaq	-216(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp35:
	jmp	LBB0_43
LBB0_43:
	jmp	LBB0_45
LBB0_44:
	leaq	-184(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
	jmp	LBB0_49
LBB0_45:
Ltmp39:
	leaq	-200(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp40:
	jmp	LBB0_46
LBB0_46:
	jmp	LBB0_47
LBB0_47:
Ltmp44:
	leaq	-184(%rbp), %rdi
	callq	__ZN6MatrixD1Ev
Ltmp45:
	jmp	LBB0_48
LBB0_48:
	jmp	LBB0_51
LBB0_49:
	movl	-24(%rbp), %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movl	%eax, -316(%rbp)        ## 4-byte Spill
	jne	LBB0_53
## %bb.50:
	movl	-316(%rbp), %eax        ## 4-byte Reload
	addq	$336, %rsp              ## imm = 0x150
	popq	%rbp
	retq
LBB0_51:
	movq	-120(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB0_52:
Ltmp64:
	movq	%rax, %rdi
	movq	%rdx, -328(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
LBB0_53:
	callq	___stack_chk_fail
	ud2
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table0:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0 ## >> Call Site 1 <<
	.uleb128 Ltmp46-Lfunc_begin0    ##   Call between Lfunc_begin0 and Ltmp46
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp46-Lfunc_begin0    ## >> Call Site 2 <<
	.uleb128 Ltmp47-Ltmp46          ##   Call between Ltmp46 and Ltmp47
	.uleb128 Ltmp61-Lfunc_begin0    ##     jumps to Ltmp61
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp48-Lfunc_begin0    ## >> Call Site 3 <<
	.uleb128 Ltmp55-Ltmp48          ##   Call between Ltmp48 and Ltmp55
	.uleb128 Ltmp56-Lfunc_begin0    ##     jumps to Ltmp56
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp57-Lfunc_begin0    ## >> Call Site 4 <<
	.uleb128 Ltmp58-Ltmp57          ##   Call between Ltmp57 and Ltmp58
	.uleb128 Ltmp64-Lfunc_begin0    ##     jumps to Ltmp64
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp59-Lfunc_begin0    ## >> Call Site 5 <<
	.uleb128 Ltmp60-Ltmp59          ##   Call between Ltmp59 and Ltmp60
	.uleb128 Ltmp61-Lfunc_begin0    ##     jumps to Ltmp61
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp60-Lfunc_begin0    ## >> Call Site 6 <<
	.uleb128 Ltmp62-Ltmp60          ##   Call between Ltmp60 and Ltmp62
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp62-Lfunc_begin0    ## >> Call Site 7 <<
	.uleb128 Ltmp63-Ltmp62          ##   Call between Ltmp62 and Ltmp63
	.uleb128 Ltmp64-Lfunc_begin0    ##     jumps to Ltmp64
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp63-Lfunc_begin0    ## >> Call Site 8 <<
	.uleb128 Ltmp0-Ltmp63           ##   Call between Ltmp63 and Ltmp0
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0     ## >> Call Site 9 <<
	.uleb128 Ltmp1-Ltmp0            ##   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp43-Lfunc_begin0    ##     jumps to Ltmp43
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp2-Lfunc_begin0     ## >> Call Site 10 <<
	.uleb128 Ltmp17-Ltmp2           ##   Call between Ltmp2 and Ltmp17
	.uleb128 Ltmp38-Lfunc_begin0    ##     jumps to Ltmp38
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp18-Lfunc_begin0    ## >> Call Site 11 <<
	.uleb128 Ltmp23-Ltmp18          ##   Call between Ltmp18 and Ltmp23
	.uleb128 Ltmp33-Lfunc_begin0    ##     jumps to Ltmp33
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp24-Lfunc_begin0    ## >> Call Site 12 <<
	.uleb128 Ltmp27-Ltmp24          ##   Call between Ltmp24 and Ltmp27
	.uleb128 Ltmp28-Lfunc_begin0    ##     jumps to Ltmp28
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp31-Lfunc_begin0    ## >> Call Site 13 <<
	.uleb128 Ltmp32-Ltmp31          ##   Call between Ltmp31 and Ltmp32
	.uleb128 Ltmp33-Lfunc_begin0    ##     jumps to Ltmp33
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp29-Lfunc_begin0    ## >> Call Site 14 <<
	.uleb128 Ltmp30-Ltmp29          ##   Call between Ltmp29 and Ltmp30
	.uleb128 Ltmp64-Lfunc_begin0    ##     jumps to Ltmp64
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp36-Lfunc_begin0    ## >> Call Site 15 <<
	.uleb128 Ltmp37-Ltmp36          ##   Call between Ltmp36 and Ltmp37
	.uleb128 Ltmp38-Lfunc_begin0    ##     jumps to Ltmp38
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp41-Lfunc_begin0    ## >> Call Site 16 <<
	.uleb128 Ltmp42-Ltmp41          ##   Call between Ltmp41 and Ltmp42
	.uleb128 Ltmp43-Lfunc_begin0    ##     jumps to Ltmp43
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp34-Lfunc_begin0    ## >> Call Site 17 <<
	.uleb128 Ltmp35-Ltmp34          ##   Call between Ltmp34 and Ltmp35
	.uleb128 Ltmp64-Lfunc_begin0    ##     jumps to Ltmp64
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp35-Lfunc_begin0    ## >> Call Site 18 <<
	.uleb128 Ltmp39-Ltmp35          ##   Call between Ltmp35 and Ltmp39
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp39-Lfunc_begin0    ## >> Call Site 19 <<
	.uleb128 Ltmp45-Ltmp39          ##   Call between Ltmp39 and Ltmp45
	.uleb128 Ltmp64-Lfunc_begin0    ##     jumps to Ltmp64
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp45-Lfunc_begin0    ## >> Call Site 20 <<
	.uleb128 Lfunc_end0-Ltmp45      ##   Call between Ltmp45 and Lfunc_end0
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__1eqIcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_
__ZNSt3__1eqIcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_: ## @_ZNSt3__1eqIcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_
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
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-24(%rbp), %rdi
	callq	__ZNSt3__111char_traitsIcE6lengthEPKc
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rdi
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeEv
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	cmpq	%rax, %rsi
	je	LBB1_2
## %bb.1:
	movb	$0, -1(%rbp)
	jmp	LBB1_6
LBB1_2:
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %r8
Ltmp65:
	xorl	%eax, %eax
	movl	%eax, %esi
	movq	$-1, %rdx
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKcm
Ltmp66:
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	jmp	LBB1_3
LBB1_3:
	movl	-60(%rbp), %eax         ## 4-byte Reload
	cmpl	$0, %eax
	sete	%cl
	andb	$1, %cl
	movb	%cl, -1(%rbp)
	jmp	LBB1_6
LBB1_4:
Ltmp67:
	movl	%edx, %ecx
	movq	%rax, -40(%rbp)
	movl	%ecx, -44(%rbp)
## %bb.5:
	movq	-40(%rbp), %rdi
	callq	___cxa_call_unexpected
LBB1_6:
	movb	-1(%rbp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$64, %rsp
	popq	%rbp
	retq
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table1:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Ltmp65-Lfunc_begin1    ## >> Call Site 1 <<
	.uleb128 Ltmp66-Ltmp65          ##   Call between Ltmp65 and Ltmp66
	.uleb128 Ltmp67-Lfunc_begin1    ##     jumps to Ltmp67
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp66-Lfunc_begin1    ## >> Call Site 2 <<
	.uleb128 Lfunc_end1-Ltmp66      ##   Call between Ltmp66 and Lfunc_end1
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end1:
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
	.p2align	2
Lttbase1:
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1INS_9nullptr_tEEEPKc
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1INS_9nullptr_tEEEPKc: ## @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1INS_9nullptr_tEEEPKc
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
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2INS_9nullptr_tEEEPKc
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
	.p2align	4, 0x90         ## -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2INS_9nullptr_tEEEPKc
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2INS_9nullptr_tEEEPKc: ## @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2INS_9nullptr_tEEEPKc
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
	callq	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1Ev
	movq	-16(%rbp), %rsi
	movq	-16(%rbp), %rdi
	movq	%rsi, -32(%rbp)         ## 8-byte Spill
	callq	__ZNSt3__111char_traitsIcE6lengthEPKc
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	-32(%rbp), %rsi         ## 8-byte Reload
	movq	%rax, %rdx
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm
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
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeEv
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeEv: ## @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeEv
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
	jne	LBB14_1
	jmp	LBB14_2
LBB14_1:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeEv
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	jmp	LBB14_3
LBB14_2:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeEv
	movq	%rax, -24(%rbp)         ## 8-byte Spill
LBB14_3:
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
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeEv
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeEv: ## @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeEv
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
	movq	8(%rax), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeEv
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeEv: ## @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeEv
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
	sarl	$1, %ecx
	movslq	%ecx, %rax
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
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ## -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_definition	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
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
	subq	$160, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rsi
Ltmp68:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp69:
	jmp	LBB20_1
LBB20_1:
Ltmp70:
	leaq	-40(%rbp), %rdi
	callq	__ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbEv
Ltmp71:
	movb	%al, -73(%rbp)          ## 1-byte Spill
	jmp	LBB20_2
LBB20_2:
	movb	-73(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB20_3
	jmp	LBB20_15
LBB20_3:
	movq	-8(%rbp), %rsi
	leaq	-72(%rbp), %rdi
	callq	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1ERNS_13basic_ostreamIcS2_EE
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	addq	%rax, %rdi
Ltmp72:
	movq	%rsi, -88(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__18ios_base5flagsEv
Ltmp73:
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	jmp	LBB20_4
LBB20_4:
	movl	-92(%rbp), %eax         ## 4-byte Reload
	andl	$176, %eax
	cmpl	$32, %eax
	jne	LBB20_6
## %bb.5:
	movq	-16(%rbp), %rax
	addq	-24(%rbp), %rax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	jmp	LBB20_7
LBB20_6:
	movq	-16(%rbp), %rax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
LBB20_7:
	movq	-104(%rbp), %rax        ## 8-byte Reload
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rdx
	addq	%rdx, %rcx
	movq	-8(%rbp), %rdx
	movq	(%rdx), %rsi
	movq	-24(%rsi), %rsi
	addq	%rsi, %rdx
Ltmp74:
	movq	%rdx, %rdi
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	movq	%rcx, -120(%rbp)        ## 8-byte Spill
	movq	%rdx, -128(%rbp)        ## 8-byte Spill
	callq	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillEv
Ltmp75:
	movb	%al, -129(%rbp)         ## 1-byte Spill
	jmp	LBB20_8
LBB20_8:
	movq	-72(%rbp), %rdi
Ltmp76:
	movb	-129(%rbp), %al         ## 1-byte Reload
	movsbl	%al, %r9d
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	movq	-112(%rbp), %rdx        ## 8-byte Reload
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movq	-128(%rbp), %r8         ## 8-byte Reload
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp77:
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	jmp	LBB20_9
LBB20_9:
	movq	-144(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -64(%rbp)
	leaq	-64(%rbp), %rdi
	callq	__ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedEv
	testb	$1, %al
	jne	LBB20_10
	jmp	LBB20_14
LBB20_10:
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rax
Ltmp78:
	movl	$5, %esi
	movq	%rax, %rdi
	callq	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateEj
Ltmp79:
	jmp	LBB20_11
LBB20_11:
	jmp	LBB20_14
LBB20_12:
Ltmp85:
	movl	%edx, %ecx
	movq	%rax, -48(%rbp)
	movl	%ecx, -52(%rbp)
	jmp	LBB20_18
LBB20_13:
Ltmp80:
	movl	%edx, %ecx
	movq	%rax, -48(%rbp)
	movl	%ecx, -52(%rbp)
Ltmp81:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp82:
	jmp	LBB20_17
LBB20_14:
	jmp	LBB20_15
LBB20_15:
Ltmp83:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp84:
	jmp	LBB20_16
LBB20_16:
	jmp	LBB20_20
LBB20_17:
	jmp	LBB20_18
LBB20_18:
	movq	-48(%rbp), %rdi
	callq	___cxa_begin_catch
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rcx
	movq	-24(%rcx), %rcx
	addq	%rcx, %rdi
Ltmp86:
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp87:
	jmp	LBB20_19
LBB20_19:
	callq	___cxa_end_catch
LBB20_20:
	movq	-8(%rbp), %rax
	addq	$160, %rsp
	popq	%rbp
	retq
LBB20_21:
Ltmp88:
	movl	%edx, %ecx
	movq	%rax, -48(%rbp)
	movl	%ecx, -52(%rbp)
Ltmp89:
	callq	___cxa_end_catch
Ltmp90:
	jmp	LBB20_22
LBB20_22:
	jmp	LBB20_23
LBB20_23:
	movq	-48(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB20_24:
Ltmp91:
	movq	%rax, %rdi
	movq	%rdx, -160(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table20:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase2-Lttbaseref2
Lttbaseref2:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Ltmp68-Lfunc_begin2    ## >> Call Site 1 <<
	.uleb128 Ltmp69-Ltmp68          ##   Call between Ltmp68 and Ltmp69
	.uleb128 Ltmp85-Lfunc_begin2    ##     jumps to Ltmp85
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp70-Lfunc_begin2    ## >> Call Site 2 <<
	.uleb128 Ltmp79-Ltmp70          ##   Call between Ltmp70 and Ltmp79
	.uleb128 Ltmp80-Lfunc_begin2    ##     jumps to Ltmp80
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp81-Lfunc_begin2    ## >> Call Site 3 <<
	.uleb128 Ltmp82-Ltmp81          ##   Call between Ltmp81 and Ltmp82
	.uleb128 Ltmp91-Lfunc_begin2    ##     jumps to Ltmp91
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp83-Lfunc_begin2    ## >> Call Site 4 <<
	.uleb128 Ltmp84-Ltmp83          ##   Call between Ltmp83 and Ltmp84
	.uleb128 Ltmp85-Lfunc_begin2    ##     jumps to Ltmp85
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp84-Lfunc_begin2    ## >> Call Site 5 <<
	.uleb128 Ltmp86-Ltmp84          ##   Call between Ltmp84 and Ltmp86
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp86-Lfunc_begin2    ## >> Call Site 6 <<
	.uleb128 Ltmp87-Ltmp86          ##   Call between Ltmp86 and Ltmp87
	.uleb128 Ltmp88-Lfunc_begin2    ##     jumps to Ltmp88
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp87-Lfunc_begin2    ## >> Call Site 7 <<
	.uleb128 Ltmp89-Ltmp87          ##   Call between Ltmp87 and Ltmp89
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp89-Lfunc_begin2    ## >> Call Site 8 <<
	.uleb128 Ltmp90-Ltmp89          ##   Call between Ltmp89 and Ltmp90
	.uleb128 Ltmp91-Lfunc_begin2    ##     jumps to Ltmp91
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp90-Lfunc_begin2    ## >> Call Site 9 <<
	.uleb128 Lfunc_end2-Ltmp90      ##   Call between Ltmp90 and Lfunc_end2
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
	jne	LBB22_2
## %bb.1:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB22_25
LBB22_2:
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -72(%rbp)
	movq	-48(%rbp), %rdi
	callq	__ZNKSt3__18ios_base5widthEv
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	cmpq	-72(%rbp), %rax
	jle	LBB22_4
## %bb.3:
	movq	-72(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	%rax, %rcx
	movq	%rcx, -80(%rbp)
	jmp	LBB22_5
LBB22_4:
	movq	$0, -80(%rbp)
LBB22_5:
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jle	LBB22_9
## %bb.6:
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movq	-88(%rbp), %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl
	cmpq	-88(%rbp), %rax
	je	LBB22_8
## %bb.7:
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -96(%rbp)
	leaq	-96(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB22_25
LBB22_8:
	jmp	LBB22_9
LBB22_9:
	cmpq	$0, -80(%rbp)
	jle	LBB22_20
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
Ltmp92:
	movq	-184(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, %rsi
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl
Ltmp93:
	movq	%rax, -192(%rbp)        ## 8-byte Spill
	jmp	LBB22_11
LBB22_11:
	movq	-192(%rbp), %rax        ## 8-byte Reload
	cmpq	-80(%rbp), %rax
	je	LBB22_16
## %bb.12:
Ltmp94:
	callq	__ZNSt3__1L15__get_nullptr_tEv
Ltmp95:
	movq	%rax, -200(%rbp)        ## 8-byte Spill
	jmp	LBB22_13
LBB22_13:
	movq	-200(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -144(%rbp)
Ltmp96:
	leaq	-144(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
Ltmp97:
	movq	%rax, -208(%rbp)        ## 8-byte Spill
	jmp	LBB22_14
LBB22_14:
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movl	$1, -148(%rbp)
	jmp	LBB22_17
LBB22_15:
Ltmp98:
	movl	%edx, %ecx
	movq	%rax, -128(%rbp)
	movl	%ecx, -132(%rbp)
Ltmp99:
	leaq	-120(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp100:
	jmp	LBB22_19
LBB22_16:
	movl	$0, -148(%rbp)
LBB22_17:
	leaq	-120(%rbp), %rdi
	callq	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	movl	-148(%rbp), %eax
	testl	%eax, %eax
	movl	%eax, -212(%rbp)        ## 4-byte Spill
	je	LBB22_18
	jmp	LBB22_29
LBB22_29:
	movl	-212(%rbp), %eax        ## 4-byte Reload
	subl	$1, %eax
	movl	%eax, -216(%rbp)        ## 4-byte Spill
	je	LBB22_25
	jmp	LBB22_28
LBB22_18:
	jmp	LBB22_20
LBB22_19:
	jmp	LBB22_26
LBB22_20:
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jle	LBB22_24
## %bb.21:
	movq	-16(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movq	-88(%rbp), %rdx
	callq	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnEPKcl
	cmpq	-88(%rbp), %rax
	je	LBB22_23
## %bb.22:
	callq	__ZNSt3__1L15__get_nullptr_tEv
	movq	%rax, -160(%rbp)
	leaq	-160(%rbp), %rdi
	callq	__ZNKSt3__19nullptr_tcvPT_INS_15basic_streambufIcNS_11char_traitsIcEEEEEEv
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB22_25
LBB22_23:
	jmp	LBB22_24
LBB22_24:
	xorl	%eax, %eax
	movl	%eax, %esi
	movq	-48(%rbp), %rdi
	callq	__ZNSt3__18ios_base5widthEl
	movq	-16(%rbp), %rsi
	movq	%rsi, -8(%rbp)
	movq	%rax, -224(%rbp)        ## 8-byte Spill
LBB22_25:
	movq	-8(%rbp), %rax
	addq	$240, %rsp
	popq	%rbp
	retq
LBB22_26:
	movq	-128(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB22_27:
Ltmp101:
	movq	%rax, %rdi
	movq	%rdx, -232(%rbp)        ## 8-byte Spill
	callq	___clang_call_terminate
LBB22_28:
	ud2
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table22:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase3-Lttbaseref3
Lttbaseref3:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Lfunc_begin3-Lfunc_begin3 ## >> Call Site 1 <<
	.uleb128 Ltmp92-Lfunc_begin3    ##   Call between Lfunc_begin3 and Ltmp92
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp92-Lfunc_begin3    ## >> Call Site 2 <<
	.uleb128 Ltmp97-Ltmp92          ##   Call between Ltmp92 and Ltmp97
	.uleb128 Ltmp98-Lfunc_begin3    ##     jumps to Ltmp98
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
	jne	LBB25_1
	jmp	LBB25_2
LBB25_1:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movl	$32, %esi
	callq	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenEc
	movsbl	%al, %esi
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movl	%esi, 144(%rdi)
LBB25_2:
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
	jne	LBB39_1
	jmp	LBB39_2
LBB39_1:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerEv
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	jmp	LBB39_3
LBB39_2:
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerEv
	movq	%rax, -24(%rbp)         ## 8-byte Spill
LBB39_3:
	movq	-24(%rbp), %rax         ## 8-byte Reload
	addq	$32, %rsp
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
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdi
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	addq	%rax, %rdi
Ltmp102:
	movq	%rsi, -40(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufEv
Ltmp103:
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	jmp	LBB44_1
LBB44_1:
	movq	-40(%rbp), %rax         ## 8-byte Reload
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, (%rax)
	addq	$48, %rsp
	popq	%rbp
	retq
LBB44_2:
Ltmp104:
	movl	%edx, %ecx
	movq	%rax, -24(%rbp)
	movl	%ecx, -28(%rbp)
## %bb.3:
	movq	-24(%rbp), %rdi
	callq	___cxa_call_unexpected
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table44:
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
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp103-Lfunc_begin4   ## >> Call Site 2 <<
	.uleb128 Lfunc_end4-Ltmp103     ##   Call between Ltmp103 and Lfunc_end4
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lcst_end4:
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
	.p2align	2
Lttbase4:
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
	subq	$80, %rsp
	movb	%sil, %al
	movq	%rdi, -8(%rbp)
	movb	%al, -9(%rbp)
	movq	-8(%rbp), %rsi
	leaq	-24(%rbp), %rdi
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp105:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNSt3__1L9use_facetINS_5ctypeIcEEEERKT_RKNS_6localeE
Ltmp106:
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	jmp	LBB49_1
LBB49_1:
	movsbl	-9(%rbp), %esi
Ltmp107:
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	callq	__ZNKSt3__15ctypeIcE5widenEc
Ltmp108:
	movb	%al, -57(%rbp)          ## 1-byte Spill
	jmp	LBB49_2
LBB49_2:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movb	-57(%rbp), %al          ## 1-byte Reload
	movsbl	%al, %eax
	addq	$80, %rsp
	popq	%rbp
	retq
LBB49_3:
Ltmp109:
	movl	%edx, %ecx
	movq	%rax, -32(%rbp)
	movl	%ecx, -36(%rbp)
Ltmp110:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp111:
	jmp	LBB49_4
LBB49_4:
	jmp	LBB49_5
LBB49_5:
	movq	-32(%rbp), %rdi
	callq	__Unwind_Resume
	ud2
LBB49_6:
Ltmp112:
	movq	%rax, %rdi
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	callq	___clang_call_terminate
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table49:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase5-Lttbaseref5
Lttbaseref5:
	.byte	1                       ## Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Lfunc_begin5-Lfunc_begin5 ## >> Call Site 1 <<
	.uleb128 Ltmp105-Lfunc_begin5   ##   Call between Lfunc_begin5 and Ltmp105
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp105-Lfunc_begin5   ## >> Call Site 2 <<
	.uleb128 Ltmp108-Ltmp105        ##   Call between Ltmp105 and Ltmp108
	.uleb128 Ltmp109-Lfunc_begin5   ##     jumps to Ltmp109
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp108-Lfunc_begin5   ## >> Call Site 3 <<
	.uleb128 Ltmp110-Ltmp108        ##   Call between Ltmp108 and Ltmp110
	.byte	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.uleb128 Ltmp110-Lfunc_begin5   ## >> Call Site 4 <<
	.uleb128 Ltmp111-Ltmp110        ##   Call between Ltmp110 and Ltmp111
	.uleb128 Ltmp112-Lfunc_begin5   ##     jumps to Ltmp112
	.byte	1                       ##   On action: 1
	.uleb128 Ltmp111-Lfunc_begin5   ## >> Call Site 5 <<
	.uleb128 Lfunc_end5-Ltmp111     ##   Call between Ltmp111 and Lfunc_end5
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
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"-memcheck"

L_.str.1:                               ## @.str.1
	.asciz	"Enter 3 size of matrices (M, N, Q): "

L_.str.2:                               ## @.str.2
	.asciz	"Enter amount of threads: "


.subsections_via_symbols
