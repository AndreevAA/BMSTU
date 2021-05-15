app.exe:
	gcc -S main.c -masm=intel
	C:\msys64\home\alena\nasm.exe -f elf64 -o asm_strncpy.o asm_strncpy.asm
	gcc -c -masm=intel -o main.o main.c
	gcc main.o asm_strncpy.o

run:
	./a.exe

clean:
	rm -f *.o *.exe
