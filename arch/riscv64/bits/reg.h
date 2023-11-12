#undef __WORDSIZE

#if __riscv_xlen == 64
#define __WORDSIZE 64
#elif __riscv_xlen == 32
#define __WORDSIZE 32
#else /* __riscv_xlen */
#error "__riscv_xlen must be 32 or 64"
#endif /* __riscv_xlen */
