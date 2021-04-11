/*!
\file
\brief Заголовочный файл с описанием функций
\author    "Андреев Александр"
\version   1
\date      30 мая 2020
 
Данный файл содержит в себе определения функций, используемых в демонстрационной программе
*/

#define MAXSIZE 1000

/*!
Получает следующую строку текстового файла
\param[in] file_in Текстовая переменная
\param[in] listofnumbersofwords Массив количества слов в каждой строке
\param[in] numberofwords Количество слов в файле
\param[out] numberofwords Измененное количество слов в файле
*/
int getnextstring(FILE *file_in, int listofnumbersofwords[MAXSIZE], int *numberofwords);

/*!
Находит и записывает количество слов в текущей строке в массив с количеством слов по строкам
\param[in] tempstring Текущая строка файла
\param[in] numberofwords Количество слов в файле
\param[out] numberofwords Измененное количество слов в файле
*/
int getnumberofwords(char tempstring[MAXSIZE], int *numberofwords);

/*!
Выводит в файл процентное соотношение количества слов в строке к общему количеству слов в файле
\param[in] file_out Текстовая переменная
\param[in] numberofwords Количество слов
\param[in] listofnumbersofwords Массив количества слов в каждой сроке
\param[in] numberofstrings Количество строк в файле
 
Код функции выглядит следующим образом:
\code
void formanswerfile(FILE *file_out, int listofnumbersofwords[MAXSIZE], int numberofwords, int numberofstrings)
{
  if (numberofwords > 0)
  {
    for (int i = 0; i < numberofstrings; i++)
    {
      double tempanswerpecent = listofnumbersofwords[i] * 100 / numberofwords ;
      fprintf(file_out, "%lf\n", tempanswerpecent);
    }
  }
  else{
    fprintf(file_out, "В файле нет слов");
  }
}
\endcode
*/
void formanswerfile(FILE *file_out, int listofnumbersofwords[MAXSIZE], int numberofwords, int numberofstrings);
