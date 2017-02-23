
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

/* Globals */
 
/**
 * @name     main
 * @author   Kevin Gillespie
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
            array[i][j] = k++;  
        }
    }

    // Print the array
    for(i = 0; i < ARRAY_DIM; i++) {
        printf("\n");
        for(j = 0; j < ARRAY_DIM; j++) {
            printf("%f ", array[i][j]);
        }
    }
    printf("\n");
    
    return 0;}

>>>>>>> Stashed changes
