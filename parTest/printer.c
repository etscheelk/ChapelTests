#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main(int argc, char *argv[]) 
{
    char input[10];
    
    fgets(input, 10, stdin);
    
    size_t numToMake = atoi(input);
    size_t numDays = numToMake;
    size_t numPrinters = 1;
    
    for (int i = 0; i < numToMake; ++i) 
    {
        size_t a = ceil((float) numToMake / (float) numPrinters) + i;
        printf("numToMake: %ld\nnumPrinters: %ld\ni: %d\nnumDays: %ld\na: %ld\n\n\n", numToMake, numPrinters, i, numDays, a);
        
        if (a < numDays)
        {
            numDays = a;
        }
        
        numPrinters *= 2;
    }
    
    printf("%ld\n", numDays);
}