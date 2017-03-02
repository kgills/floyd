#!/bin/bash
#SBATCH -N 1
#SBATCH -p GPU
#SBATCH --gre=gpu:k80:4
#SBATCH -t 00:10:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=kgills@gmail.com
#SBATCH --ntasks-per-node=1

NODES=1
ITERS=$(seq 1 1)
SIZE=2048
FILE_NAME="floyd_acc_mpi_k804"

touch "${FILE_NAME}_${NODES}_${SIZE}.txt"
echo "matrix_dim, etime, flops, cores">>"${FILE_NAME}_${NODES}_${SIZE}.txt"

for ITER in ${ITERS}
do
    mpirun -n ${NODES} ./floyd.out>>"${FILE_NAME}_${NODES}_${SIZE}.txt"
done
