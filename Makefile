CC=pgcc
C_FLAGS=-mp -O4 -Munroll -mcmodel=medium
OUTPUT=floyd.out

all: floyd.c
	$(CC) $(C_FLAGS) $^ -o $(OUTPUT)

clean:
	@rm -f $(OUTPUT)
	@rm -f slurm*
