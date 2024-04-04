
# Recommended for ease of Linear Algrebra package?
sets = --set blasImpl=off --set lapackImpl=off

# Compiler Error Messages
errs = --print-all-candidates

deps = main.chpl

out = main

$(out): $(deps)
	chpl $(sets) $(errs) $(deps) -o $(out)


clean:
	rm -f $(out)