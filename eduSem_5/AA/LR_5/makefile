all: app.exe rm_out_files.exe

rm out_files: rm_out_files.exe
	
# APP
app.exe : main.o conveyor.o matrix.o 
	g++ out/main.o out/conveyor.o out/matrix.o -o app.exe 

conveyor.o :
	mkdir -p out
	g++ -E src/conveyor.cpp -o out/conveyor.ii
	g++ -S out/conveyor.ii -o out/conveyor.s
	as out/conveyor.s -o out/conveyor.o

matrix.o :
	mkdir -p out
	g++ -E src/matrix.cpp -o out/matrix.ii
	g++ -S out/matrix.ii -o out/matrix.s
	as out/matrix.s -o out/matrix.o

main.o :
	mkdir -p out
	g++ -E src/main.cpp -o out/main.ii
	g++ -S out/main.ii -o out/main.s
	as out/main.s -o out/main.o

# RM OUT FILES
rm_out_files.exe : 
	rm out/*.s
	rm out/*.ii
	rm out/*.o
