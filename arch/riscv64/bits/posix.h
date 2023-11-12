#if __riscv_xlen == 64
#define _POSIX_V6_LP64_OFF64 1
#define _POSIX_V7_LP64_OFF64 1
#elif __riscv_xlen == 32
#define _POSIX_V6_ILP32_OFFBIG 1
#define _POSIX_V7_ILP32_OFFBIG 1
#else /* __riscv_xlen */
#error "__riscv_xlen must be 32 or 64"
#endif /* __riscv_xlen */
