CC=mpicc
C_FLAGS=-fopenmp -O4 -mcmodel=medium
OUTPUT=floyd.out

all: floyd.c
	$(CC) $(C_FLAGS) $^ -o $(OUTPUT)

clean:
	@rm -f $(OUTPUT)
	@rm -f slurm*
