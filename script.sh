#!/bin/bash
#SBATCH -N 2
#SBATCH -p GPU
#SBATCH --gre=gpu:p100:2
#SBATCH --ntasks-per-node 28
#SBATCH -t 04:00:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=kgills@gmail.com

ITERS=$(seq 1 10)
CORES=$(seq 28 28)
SIZE=2048
FILE_NAME="floyd_acc_mpi"

touch "${FILE_NAME}_2_${SIZE}.txt"
echo "matrix_dim, etime, flops, cores">>"${FILE_NAME}_2_${SIZE}.txt"

for ITER in ${ITERS}
do
    mpirun -n 2 ./floyd_acc_mpi.out>>"${FILE_NAME}_2_${SIZE}.txt"
done
