NVCCFLAGS_LTO := -gencode arch=compute_89,code=lto_89 -rdc true -dc
NVCCFLAGS_FATBIN_LTO := -gencode arch=compute_89,code=lto_89 -rdc true -dc -fatbin
NVCCFLAGS_SASS := -gencode arch=compute_89,code=sm_89 -rdc true -dc -cubin

all:
	nvcc $(NVCCFLAGS_LTO) ext1.cu
	nvcc $(NVCCFLAGS_LTO) ext2.cu
	nvcc $(NVCCFLAGS_LTO) kernel.cu
	nvcc $(NVCCFLAGS_SASS) ext1.cu
	nvcc $(NVCCFLAGS_SASS) ext2.cu
	nvcc $(NVCCFLAGS_FATBIN_LTO) kernel.cu
	nvcc $(NVCCFLAGS_FATBIN_LTO) ext1.cu
	nvcc $(NVCCFLAGS_FATBIN_LTO) ext2.cu

clean:
	rm -f *.cubin *.fatbin *.o
