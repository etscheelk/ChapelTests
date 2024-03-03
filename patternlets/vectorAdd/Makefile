

vectorAdd: vectorAdd.chpl
	chpl vectorAdd.chpl -o vectorAdd

CvectorAdd: CvectorAdd.c
	gcc CvectorAdd.c -o CvectorAdd -fopenmp -O3

clean:
	rm -f vectorAdd CvectorAdd
