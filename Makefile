all: build

main.o: main.asm
	nasm -f elf64 main.asm

build: main.o
	ld main.o -o strikethrough

clean:
	rm main.o strikethrough
