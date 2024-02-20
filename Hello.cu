#include <cuda.h>
#include <stdio.h>

#define gpuErrchk(ans) \
  { gpuAssert((ans), __FILE__, __LINE__); }

inline void gpuAssert(cudaError_t code, const char *file, int line,
                      bool abort = true) {
  if (code != cudaSuccess) {
    fprintf(stderr, "GPUassert: %s %s %d\n", cudaGetErrorString(code), file,
            line);
    if (abort) exit(code);
  }
}

__global__ void k() {
  printf("hello %u!\n", threadIdx.x);
}

int main(void) {
  k<<<3, 32>>>();
  cudaDeviceSynchronize();
  gpuErrchk(cudaPeekAtLastError());
  return 0;
}
