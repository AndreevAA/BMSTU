#include <stdio.h>
#include <dirent.h>	//opendir()/readdir()/closedir()
#include <sys/stat.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

//путь	//глубина рекурсии
static int dopath(const char *filename, int depth) {
	struct stat statbuf;
	struct dirent *dirp;
	DIR *dp;
	
	//'.' - указатель на сам каталог
	//'..' - указатель на родительский каталог
	if (strcmp(filename, ".") == 0 || strcmp(filename, "..") == 0)
		return 0;

	//Вызов lstat() идентичен stat(), но в случае, если filename является символьной ссылкой, то возвращается информация о самой ссылке, а не о файле, на который она указывает; возвращает информацию об указанном файле
	if (lstat(filename, &statbuf) < 0) {
		switch(errno)
		{
			case EBADF:
				printf("Неверный описатель файлового дескриптора.");
				break;
			case ENOENT:
				printf("Компонент полного имени файла filename не существует или полное имя является пустой строкой.");
				break;
			case ENOTDIR:
				printf("Компонент пути не является каталогом. ");
				break;	
			case ELOOP:
				printf("При поиске файла встретилась символьная ссылка.");
				break;	
			case EFAULT:
				printf("Некорректный адрес. ");
				break;	
			case EACCES:
				printf("Запрещен доступ. ");
				break;		
			case ENOMEM:
				printf("Недостаточно памяти в системе.");
				break;		
			case ENAMETOOLONG:
				printf("Слишком длинное название файла. ");
				break;	
			case EOVERFLOW:
				printf("Некоторые значения были слишком большими, чтобы быть представленными в возвращаемой структуре.s");
				break;	
		}		
		printf("Ошибка вызова функции stat");
		return -1;

	}
	
	//печать отступов
	for (int i = 0; i < depth; ++i)
		printf("       |");
	

	/* печатаем имя файла */
	// s_isdir проверяет, является ли данный файл каталогом
	if (S_ISDIR(statbuf.st_mode) == 0) {
		printf("%s\n", filename);
		return 0;
	}

	/* каталог */
	printf("%s\n", filename);
	if ((dp = opendir(filename)) == NULL) {
		printf("couldn't open directory '%s'\n", filename);
		return 1;
	}

	// chdir() изменяет текущий рабочий каталог вызывающего процесса на каталог, указанный в path; PATH — переменная окружения, представляющая собой набор каталогов, в которых расположены исполняемые файлы; нужен для коротких имен
	
	chdir(filename);
	
	// для каждого элемента каталога
	// Функция readdir() возвращает указатель на следующую запись каталога в структуре dirent, прочитанную из потока каталога. Каталог указан в dir. Функция возвращает NULL по достижении последней записи или если была обнаружена ошибка.
	while ((dirp = readdir(dp)) != NULL) 
		dopath(dirp -> d_name, depth+1);
	chdir("..");

	//закрывает поток каталога и освобождает ресурсы, выделенные ему. 
	//Она возвращает 0 в случае успеха и -1 при наличии ошибки.
	closedir(dp);

	return 0;
} 

int main(int argc, char *argv[]) {
	int ret; ///код возврата

	if (argc != 2) // нет параметра
		ret = dopath("./",0); // начиная с текущей папки
	else
		ret = dopath(argv[1],0);	// начиная с папки в параметре

	return ret;
}
