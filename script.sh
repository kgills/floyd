#!/bin/bash
#SBATCH -N 4
#SBATCH -p GPU
#SBATCH --gre=gpu:p100:2
#SBATCH -t 04:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=kgills@gmail.com

ITERS=$(seq 1 10)
SIZE=8192
FILE_NAME="floyd_acc_mpi_p100"

touch "${FILE_NAME}_4_${SIZE}.txt"
echo "matrix_dim, etime, flops, cores">>"${FILE_NAME}_4_${SIZE}.txt"

for ITER in ${ITERS}
do
    mpirun -n 4 ./floyd_acc_mpi.out>>"${FILE_NAME}_4_${SIZE}.txt"
done
