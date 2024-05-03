
# Recommended for ease of Linear Algrebra package?
# sets = --set blasImpl=off --set lapackImpl=off

# Compiler Error Messages
errs = --print-all-candidates


cpuFractal: cpuFractal.chpl
	chpl cpuFractal.chpl $(errs) -o cpuFractal --fast


gpuFractal: gpuFractal.chpl
	chpl gpuFractal.chpl $(errs) -o gpuFractal --fast


clean:
	rm -f cpuFractal gpuFractal