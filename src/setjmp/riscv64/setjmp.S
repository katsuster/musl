.global __setjmp
.global _setjmp
.global setjmp
.type __setjmp, %function
.type _setjmp,  %function
.type setjmp,   %function
__setjmp:
_setjmp:
setjmp:
#if __riscv_xlen == 64
#define FROFF    112
	sd s0,    0(a0)
	sd s1,    8(a0)
	sd s2,    16(a0)
	sd s3,    24(a0)
	sd s4,    32(a0)
	sd s5,    40(a0)
	sd s6,    48(a0)
	sd s7,    56(a0)
	sd s8,    64(a0)
	sd s9,    72(a0)
	sd s10,   80(a0)
	sd s11,   88(a0)
	sd sp,    96(a0)
	sd ra,    104(a0)
#elif __riscv_xlen == 32
#define FROFF    56
	sw s0,    0(a0)
	sw s1,    4(a0)
	sw s2,    8(a0)
	sw s3,    12(a0)
	sw s4,    16(a0)
	sw s5,    20(a0)
	sw s6,    24(a0)
	sw s7,    28(a0)
	sw s8,    32(a0)
	sw s9,    36(a0)
	sw s10,   40(a0)
	sw s11,   44(a0)
	sw sp,    48(a0)
	sw ra,    52(a0)
#else /* __riscv_xlen */
#error "__riscv_xlen must be 32 or 64"
#endif /* __riscv_xlen */

#ifndef __riscv_float_abi_soft
#ifdef __riscv_float_abi_double
	fsd fs0,  FROFF+0(a0)
	fsd fs1,  FROFF+8(a0)
	fsd fs2,  FROFF+16(a0)
	fsd fs3,  FROFF+24(a0)
	fsd fs4,  FROFF+32(a0)
	fsd fs5,  FROFF+40(a0)
	fsd fs6,  FROFF+48(a0)
	fsd fs7,  FROFF+56(a0)
	fsd fs8,  FROFF+64(a0)
	fsd fs9,  FROFF+72(a0)
	fsd fs10, FROFF+80(a0)
	fsd fs11, FROFF+88(a0)
#elif defined(__riscv_float_abi_single)
	fsw fs0,  FROFF+0(a0)
	fsw fs1,  FROFF+4(a0)
	fsw fs2,  FROFF+8(a0)
	fsw fs3,  FROFF+12(a0)
	fsw fs4,  FROFF+16(a0)
	fsw fs5,  FROFF+20(a0)
	fsw fs6,  FROFF+24(a0)
	fsw fs7,  FROFF+28(a0)
	fsw fs8,  FROFF+32(a0)
	fsw fs9,  FROFF+36(a0)
	fsw fs10, FROFF+40(a0)
	fsw fs11, FROFF+44(a0)
#endif
#endif

	li a0, 0
	ret
