__device__ int add(int x, int y);

__device__ int add_plus_one(int x, int y) {
  return add(x, y) + 1;
}
