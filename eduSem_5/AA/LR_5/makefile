all: app.exe time.exe rm_out_files.exe

rm out_files: rm_out_files.exe
	
# APP
app.exe : main.o mamult.o matrix.o 
	g++ out/main.o out/mamult.o out/matrix.o -o app.exe 

mamult.o :
	mkdir -p out
	g++ -E src/mamult.cpp -o out/mamult.ii
	g++ -S out/mamult.ii -o out/mamult.s
	as out/mamult.s -o out/mamult.o

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

# TIME
time.exe : time.o
	g++ out/mamult.o out/matrix.o out/time.o -o time.exe 

time.o :
	mkdir -p out
	g++ -E src/time.cpp -o out/time.ii
	g++ -S out/time.ii -o out/time.s
	as out/time.s -o out/time.o

# RM OUT FILES
rm_out_files.exe : 
	rm out/*.s
	rm out/*.ii
	rm out/*.o
