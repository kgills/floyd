CC=pgcc
C_FLAGS=-O4 -Mmpi=sgimpi -acc -ta=tesla,8.0 -Munroll -mcmodel=medium
OUTPUT=floyd_acc_mpi.out

all: floyd.c
	$(CC) $(C_FLAGS) $^ -o $(OUTPUT)

clean:
	@rm -f $(OUTPUT)
	@rm -f slurm*
