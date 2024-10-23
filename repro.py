from pynvjitlink import NvJitLinker

filenames = ("ext1.cubin", "ext2.cubin", "kernel.cubin", "ext1.o",
             "ext2.o", "kernel.o")

files = {}

for fn in filenames:
    with open(fn, "rb") as f:
        files[fn] = f.read()

linker = NvJitLinker("-arch=sm_89", "-lto", "-ptx")

linker.add_object(files["ext1.o"])
linker.add_object(files["ext2.o"])
linker.add_object(files["kernel.o"])

ptx = linker.get_linked_ptx()

print(ptx.decode())


linker = NvJitLinker("-arch=sm_89", "-lto")

linker.add_cubin(files["ext1.cubin"])
linker.add_object(files["ext2.o"])
linker.add_object(files["kernel.o"])

cubin = linker.get_linked_cubin()

with open("linked.cubin", "wb") as f:
    f.write(cubin)
