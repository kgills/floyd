#include <stdio.h>

#define ARRAY_DIM 	8

int main(void)
{
	unsigned i,j,k;

	printf("\n *** Floyd's alrogithm ***\n");

	// Initialize the array
	float **array=(float**)malloc(ARRAY_DIM * sizeof(float));
	k = 0;
	for(i = 0; i < ARRAY_DIM; i++) {
		array[i] = (float*)malloc(ARRAY_DIM * sizeof(float));
		for(j = 0; j < ARRAY_DIM; j++) {
			array[i][j] = k++;	
		}
	}
	




	// Print the array
	for(i = 0; i < ARRAY_DIM; i++) {
		printf("\n");
		for(j = 0; j < ARRAY_DIM; j++) {
			printf("%d ", array[i][j]);
		}
	}
	printf("\n");
	
	return 0;
}
