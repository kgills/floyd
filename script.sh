#!/bin/bash
#SBATCH -N 32
#SBATCH -p RM
#SBATCH --ntasks-per-node 28
#SBATCH -t 04:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=kgills@gmail.com

ITERS=$(seq 1 10)
SIZE=16384
FILE_NAME="floyd_omp_mpi"

export OMP_NUM_THREADS=28
touch "${FILE_NAME}_32_${SIZE}.txt"
echo "matrix_dim, etime, flops, cores">>"${FILE_NAME}_32_${SIZE}.txt"
echo "32"
for ITER in ${ITERS}
do
    mpirun -n 32 ./floyd.out>>"${FILE_NAME}_32_${SIZE}.txt"
done
