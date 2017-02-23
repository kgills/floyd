/** 
 * @file    floyd.c
 * @author  Kevin Gillespie
 * @brief   floyd's algorithm to calculate the shortest path between all pairs
 *          of a give graph. We're assuming symmetric matricies. 
 *
 */

/* Includes */
#include <stdio.h>
#include <stdlib.h>

/* Defines */
#define ARRAY_DIM   8
#define MAX_VAL     ARRAY_DIM

#define MIN(a,b) (((a)<(b))?(a):(b))

/* Globals */
 

/**
 * @name     print_array
 * @brief    print the given 2d array
 * @param 
 *       @name   array
 *       @dir    I
 *       @type   float
 *       @brief  2d array to print
 *
 ******************************************************************************/
void print_array(float* array[])
{
    unsigned i, j;

    // Print the j labels
    printf(" j:");
    for(j = 0; j < ARRAY_DIM; j++) {
        printf("%d  ", j);
    }
    printf("\ni ");
    for(j = 0; j < ARRAY_DIM; j++) {
        printf("---");
    }

    // Print the array and i labels
    for(i = 0; i < ARRAY_DIM; i++) {
        printf("\n%d| ", i);
        for(j = 0; j < ARRAY_DIM; j++) {
            printf("%02d ", (unsigned)array[i][j]);
        }
    }
    printf("\n\n");
}

/**
 * @name     main
 * @brief    main function for floyd.c
 * @param 
 *       @name   argc
 *       @dir    I
 *       @type   int 
 *       @brief  Number of arguments in argv.
 * @param 
 *       @name   argv
 *       @dir    I
 *       @type   char*[]
 *       @brief  Command line arguments.
 *
 * @returns 0 for success, error status otherwise
 *
 ******************************************************************************/
int main(int argc, char *argv[])
{
    unsigned i,j,k;

    printf("\n *** Floyd's alrogithm ***\n");

    // Initialize the array
    float *array[ARRAY_DIM];
    k = 0;
    for(i = 0; i < ARRAY_DIM; i++) {
        array[i] = (float*)malloc(ARRAY_DIM * sizeof(float));
        for(j = 0; j < ARRAY_DIM; j++) {
            
            if(i == j) {
                array[i][j] = 0;
            } else if((i-j) == 1) {
                array[i][j] = 1;
            } else if((j-i) == 1) {
                array[i][j] = 1;
            } else {
                array[i][j] = MAX_VAL;
            }
        }
    }

    printf("Initial array\n");
    print_array(array);

    // Execute the algorithm
    for(k = 0; k < ARRAY_DIM; k++) {
        for(i = 0; i < ARRAY_DIM; i++) {
            for(j = 0; j < ARRAY_DIM; j++) {
                array[i][j] = MIN(array[i][j], (array[i][k] + array[k][j]));
            }
        }
    }

    printf("Final array\n");
    print_array(array);
    
    return 0;
}
