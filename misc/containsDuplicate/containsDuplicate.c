typedef char bool;
#define false 0
#define true 1

#include <stdlib.h>

bool containsDuplicate(int *nums, int numsSize)
{
	/*  Trivial solution: For a given number x[i] at index i
		iterate through the rest of the list

		O(n^2 / 2) Algorithm. Not good.
	*/
	// int *numsCheck = (int*) malloc(numsSize * sizeof(int));
	// for (int i = 0; i < numsSize; ++i)
	// {
	//     for (int j = i+1; j < numsSize; ++j)
	//     {
	//         if (nums[i] == nums[j])
	//         {
	//             return true;
	//         }
	//     }
	// }

	// free(numsCheck);
	// return false;

	/*  Advanced solution: Hash Map.
		The nearest prime number to 10^5=100,000 is 100,003

		May have to implement a linked list struct since there
		may be duplicates.
	*/
	typedef struct linkedList
	{
		int val;
		struct linkedList *next;
	};

	const int primeNumber = 100003; // Do map access modulo this number. 100_000 is maximum number of elements of nums
	struct linkedList *map = (int *)malloc(primeNumber * sizeof(struct linkedList)); // ~ 400,000 Bytes, 400kB :|

	for (int i = 0; i < numsSize; ++i) 
	{
		int val = *(nums+i);
		struct linkedList l = map[i];
		// If the map doesn't have it, add it
		
		bool hasVal = false;
		if (l.val == val) return true;
		while (l.next != NULL) 
		{
			if (l.val == val) 
			{
				return true;
			}

			// Could be a null-pointer dereference if not for the condition on loop
			l = *l.next;
		}


	}

	return false;
}