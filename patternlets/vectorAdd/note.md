# Chapel Vector addition

Chapel allows for implicit parallel vector addition, multiplication by scalar. 

Compare to how it must be implemented (trivially) in C. 
Must concern yourself with mallocs, filling the
arrays, a `pragma` line, and a less robust 
argument reader. 

Make `./CvectorAdd` with the same-named `make` shortcut and `./vectorAdd` for the Chapel version. 

They take a runtime argument and offer timing in milliseconds.

Example:

    `./CvectorAdd 200000`

    `./vectorAdd --n 200000`

`vectorAdd.chpl` also has the explicit CPU parallel `coforall` call for doing this same operation, also timed. It is must slower. Run the binary with argument `--skip` to skip the coforall.  

On current optimization levels and installation settings, it seems that Chapel is one order of magnitude slower than the C version, on larger arrays.

Chapel version is faster on smaller arrays--I expect this is due to a decreased overhead. 