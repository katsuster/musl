.global __longjmp
.global _longjmp
.global longjmp
.type __longjmp, %function
.type _longjmp,  %function
.type longjmp,   %function
__longjmp:
_longjmp:
longjmp:
#if __riscv_xlen == 64
#define FROFF    112
	ld s0,    0(a0)
	ld s1,    8(a0)
	ld s2,    16(a0)
	ld s3,    24(a0)
	ld s4,    32(a0)
	ld s5,    40(a0)
	ld s6,    48(a0)
	ld s7,    56(a0)
	ld s8,    64(a0)
	ld s9,    72(a0)
	ld s10,   80(a0)
	ld s11,   88(a0)
	ld sp,    96(a0)
	ld ra,    104(a0)
#elif __riscv_xlen == 32
#define FROFF    56
	lw s0,    0(a0)
	lw s1,    4(a0)
	lw s2,    8(a0)
	lw s3,    12(a0)
	lw s4,    16(a0)
	lw s5,    20(a0)
	lw s6,    24(a0)
	lw s7,    28(a0)
	lw s8,    32(a0)
	lw s9,    36(a0)
	lw s10,   40(a0)
	lw s11,   44(a0)
	lw sp,    48(a0)
	lw ra,    52(a0)
#else /* __riscv_xlen */
#error "__riscv_xlen must be 32 or 64"
#endif /* __riscv_xlen */

#ifndef __riscv_float_abi_soft
#ifdef __riscv_float_abi_double
	fld fs0,  FROFF+0(a0)
	fld fs1,  FROFF+8(a0)
	fld fs2,  FROFF+16(a0)
	fld fs3,  FROFF+24(a0)
	fld fs4,  FROFF+32(a0)
	fld fs5,  FROFF+40(a0)
	fld fs6,  FROFF+48(a0)
	fld fs7,  FROFF+56(a0)
	fld fs8,  FROFF+64(a0)
	fld fs9,  FROFF+72(a0)
	fld fs10, FROFF+80(a0)
	fld fs11, FROFF+88(a0)
#elif defined(__riscv_float_abi_single)
	flw fs0,  FROFF+0(a0)
	flw fs1,  FROFF+4(a0)
	flw fs2,  FROFF+8(a0)
	flw fs3,  FROFF+12(a0)
	flw fs4,  FROFF+16(a0)
	flw fs5,  FROFF+20(a0)
	flw fs6,  FROFF+24(a0)
	flw fs7,  FROFF+28(a0)
	flw fs8,  FROFF+32(a0)
	flw fs9,  FROFF+36(a0)
	flw fs10, FROFF+40(a0)
	flw fs11, FROFF+44(a0)
#endif
#endif

	seqz a0, a1
	add a0, a0, a1
	ret
