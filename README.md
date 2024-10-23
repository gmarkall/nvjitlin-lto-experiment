# nvJitLink LTO experiment

What does nvjitlink do for LTO when not all inputs are LTO-IR?
 - It performs LTO on the parts that it can.


Running:

```
make
python repro.py
nvdisasm linked.cubin
```

You should see the LTOIR object inlined, with a call to the SASS object still
required:

```
        /*00a0*/                   CALL.ABS.NOINC `(_Z3addii) ;
.L_x_0:
        /*00b0*/                   IADD3 R3, R4, 0x1, RZ ;
```
