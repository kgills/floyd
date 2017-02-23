CC=gcc
C_FLAGS=-O4
OUTPUT=floyd.out

all: floyd.c
	$(CC) $(C_FLAGS) $^ -o $(OUTPUT)

clean:
	@rm -f $(OUTPUT)
	@rm -f slurm*
