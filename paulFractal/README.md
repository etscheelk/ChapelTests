# Paul Fractals: Making Fractals because you saw your professor do it and you wanted to do it too

These fractals are based on repeated (random) transformations from polar to rectangular coordinates and vice versa. 

The config options are all documented in the file, run like `--dim 2048` for example.

Rotation (`rot`) and Theta offset (`thetaOffset`) are the main parameters that affect the image, alongside version, choice between a, b, and c. 

## 

Based on code from Professor Paul Cantrell at Macalester College, https://github.com/pcantrell/density-fractals recreated in Chapel. 

The main file is `cpuFractal.chpl`. Compile with `chpl cpuFractal.chpl` or `make cpuFractal` or `make`. 

`gpuFractal.chpl`: Written but not tested. I cannot compile Chapel with GPU enabled because my CUDA version is incompatible with my LLVM version. 

`test.chpl`: `foreach` is intended for GPU parallel and I used a task private variable, used to submit github issue