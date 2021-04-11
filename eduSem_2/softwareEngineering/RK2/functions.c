/*!
\file
\brief Файл с вычислительными функциями
\author    "Андреев Александр"
\version   1
\date      29 мая 2020
 
Данный файл содержит в себе  функции,
используемые в демонстрационной программе
*/
#include <stdio.h>
#include <string.h>
#include "functions.h"
#define MAXSIZE 1000

int getnumberofwords(char tempstring[MAXSIZE], int *numberofwords)
{
  int tempnumberofwords = 0;

  if (strlen(tempstring) > 1)
  {
    if (' ' != tempstring[0])
      tempnumberofwords++;

    for (int i = 1; i < strlen(tempstring) - 1; i++)
    {
      if (tempstring[i] != ' ' && tempstring[i - 1] == ' ')
        tempnumberofwords++;
    }
  }

  *numberofwords += tempnumberofwords;

  return tempnumberofwords;
}

int getnextstring(FILE *file_in, int listofnumbersofwords[MAXSIZE], int *numberofwords)
{
  char tempstring[MAXSIZE] = "";
  int tempnumberofstrings = 0;
  while (fgets(tempstring, MAXSIZE, file_in) != NULL && feof(file_in) == 0)
  {
    listofnumbersofwords[tempnumberofstrings] = getnumberofwords(tempstring, numberofwords);
    tempnumberofstrings++;
  }

  return tempnumberofstrings;
}

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