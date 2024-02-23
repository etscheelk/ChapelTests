#include <omp.h>
#include <stdlib.h>
#include <stdio.h>

#include <immintrin.h>

int main(int argc, char *argv[])
{
    unsigned int n = 100000;

    if (argc > 1)
    {
        n = atoi(argv[1]);
    }

    double *A = (double *)malloc(n * sizeof(double));
    double *B = (double *)malloc(n * sizeof(double));
    double *C = (double *)malloc(n * sizeof(double));

    if (A == NULL || B == NULL | C == NULL) {
        free(A);
        free(B);
        free(C);
        exit(EXIT_FAILURE);
    }

    // fill arrays
    for (int i = 0; i < n; ++i) {
        A[i] = 2.0;
        B[i] = 5.0;
        C[i] = 0.0;
    }

    double start = omp_get_wtime();
    #pragma omp parallel for num_threads(4)
    for (int i = 0; i < n; ++i) 
    {
        C[i] = A[i] + B[i];
    }
    double end = omp_get_wtime();
    printf("Simple parallel C vector add: %lf ms\n", (end - start) * 1000.);

    
    

    free(A);
    free(B);
    free(C);
    return EXIT_SUCCESS;
}
