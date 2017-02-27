#!/bin/bash
#SBATCH -N 1
#SBATCH -p RM
#SBATCH --ntasks-per-node 28
#SBATCH -t 04:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=kgills@gmail.com

ITERS=$(seq 1 10)
CORES=$(seq 28 28)
SIZE=16384
FILE_NAME="floyd_omp_for"

for CORE in ${CORES}
do

    export OMP_NUM_THREADS=${CORE}
    touch "${FILE_NAME}_${CORE}_${SIZE}.txt"
    echo "matrix_dim, etime, flops, cores">>"${FILE_NAME}_${CORE}_${SIZE}.txt"

    for ITER in ${ITERS}
    do
        ./floyd_omp_for.out>>"${FILE_NAME}_${CORE}_${SIZE}.txt"
    done
done
