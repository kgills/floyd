CC=pgcc
C_FLAGS=-O4 -acc -ta=tesla,8.0 -Munroll -mcmodel=medium
OUTPUT=floyd.out

all: floyd.c
	$(CC) $(C_FLAGS) $^ -o $(OUTPUT)

clean:
	@rm -f $(OUTPUT)
	@rm -f slurm*
