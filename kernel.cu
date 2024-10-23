__device__ int add_plus_one(int x, int y);

__global__ void use_device(int *x, int *y, int n)
{
  *x = add_plus_one(*x, *y);
}
