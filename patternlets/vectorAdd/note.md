# Chapel Vector addition

Chapel allows for implicit parallel vector addition, multiplication by scalar. 

Compare to how it must be implemented (trivially) in C. 
Must concern yourself with mallocs, filling the
arrays, a `pragma` line, and a less robust 
argument reader. 

Make `./CvectorAdd` with the same-named `make` shortcut and `./vectorAdd` for the Chapel version. 

They take a runtime argument and offer timing in milliseconds.

Example:

    ./CvectorAdd 200000

    ./vectorAdd --n 200000

`vectorAdd.chpl` also has the explicit CPU parallel `forall` call for doing this same operation, also timed. The `forall` loop creates a number of tasks equivalent to the number of cores, typically. 
By comparison, the `coforall` loop creates a task for each item being iterated across. On a large array, the cost is prohibitive due to the overhead of task / thread creation, scheduling, and destruction.

When the user uses a `forall` loop, they are indicating that the loop is serializable, meaning it would properly work if also written in sequential, single-core programming. There must also be no sensitivity in the order that each task executes. 

> To that end, by using a forall-loop, the user is asserting that it is safe to run the iterations serially or in parallel, and in any order.
>
> https://chapel-lang.org/docs//1.19/users-guide/datapar/forall.html 
>
> Chapel does not prevent nondeterministic forall loops from being written, it merely implements the parallelism that the programmer specifies.

Run the binary with argument `--skip` to skip the forall.  

On current optimization levels and installation settings, it seems that Chapel is one order of magnitude slower than the C version, on larger arrays.

Chapel version is faster on smaller arrays--I expect this is due to a decreased overhead. 