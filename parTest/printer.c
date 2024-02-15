#include <stdio.h>
#include <math.h>
#include <stdlib.h>


int main(int argc, char *argv[]) 
{
    char input[10];
    
    fgets(input, 10, stdin);
    
    size_t numToMake = atoi(input);
    size_t numDays = 0;
    size_t numPrinters = 1;
    size_t made = 0;
    
    while(made < numToMake)
    {
        if ((numToMake-made) > numPrinters)
        {
            numDays += 1;
            numPrinters += numPrinters;
        }
        else
        {
            numDays += 1;
            made += numPrinters;
        }
    }

    
    printf("%ld\n", numDays);    
}