.global sigsetjmp
.global __sigsetjmp
.type sigsetjmp, %function
.type __sigsetjmp, %function
sigsetjmp:
__sigsetjmp:
	bnez a1, 1f
	tail setjmp
1:
#if __riscv_xlen == 64
	sd ra, 208(a0)
	sd s0, 224(a0)
#elif __riscv_xlen == 32
	sw ra, 160(a0)
	sw s0, 164(a0)
#else /* __riscv_xlen */
#error "__riscv_xlen must be 32 or 64"
#endif
	mv s0, a0

	call setjmp

	mv a1, a0
	mv a0, s0
#if __riscv_xlen == 64
	ld s0, 224(a0)
	ld ra, 208(a0)
#elif __riscv_xlen == 32
	lw s0, 164(a0)
	lw ra, 160(a0)
#else /* __riscv_xlen */
#error "__riscv_xlen must be 32 or 64"
#endif

.hidden __sigsetjmp_tail
	tail __sigsetjmp_tail
