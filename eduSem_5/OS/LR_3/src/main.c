#include <stdio.h>
#include <unistd.h>

// unistd
// прик омпиляции для того, чтобы не путаться с названиями программы, название для исполняемого файла не указываем, оно по умолчанию оно будет устанволено a.out
// Для того, чтобы это было выполнено нужно набраться gcc навзания исходника 

int main()
{
    // Создаю поток
    int childpid;

    if ((childpid = fork()) == -1)
    {
        perror("Can’t fork.\n");
        return 1;
    }
    else if (childpid == 0)
    {
        while (1) 
        {
            printf("%d ", getpid());
        }
    }
    // 
    else
    {
        while(1)
        {
            printf("%d ", getpid());
        }
    }

    return 0;
} 
