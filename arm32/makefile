# Define el archivo fuente en ensamblador
SRC = dado.s

# Define el nombre del archivo de salida
OUT = dado

# Define el ensamblador y las banderas
AS = as
ASFLAGS = -g

# Define el enlazador y las banderas
LD = ld
LDFLAGS =

# Define el GCC o G++ segun corresponda
GCC = gcc
GCCFLAGS =  -g

# Corrida de make
all: $(OUT)

$(OUT): $(SRC)
	$(AS) $(ASFLAGS) $(SRC) -o $(OUT).o
	$(GCC) $(LDFLAGS) $(OUT).o -o $(OUT)
# Borra temporales y ejecutable
clean:
	rm -f $(OUT) $(OUT).o
# Corrida
run: $(OUT)
	./$(OUT)
# Entrar al Debugger
gef: $(OUT)
	gdb  $(OUT)

