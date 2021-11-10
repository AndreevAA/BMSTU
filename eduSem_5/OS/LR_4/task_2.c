#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main()
{
	pid_t child_1, child_2;
	int status, val;

	if ((child_1 = fork()) == -1)
	{
		perror("Fork failed");
		exit(1);
	}
	else if (child_1 == 0)
	{
        printf("\nПотомок child_1:\
               \nСобственный идентификатор (pid) = %d\
               \nИдентификатор предка (ppid) = %d\
               \nИдентификатор группы = %d\n",
               getpid(), getppid(), getpgrp());
		exit(0);
	}

	if ((child_2 = fork()) == -1)
	{
		perror("Fork failed");
		exit(1);
	}
	else if (child_2 == 0)
	{
        printf("\nПотомок child_2:\
               \nСобственный идентификатор (pid) = %d\
               \nИдентификатор предка (ppid) = %d\
               \nИдентификатор группы = %d\n",
               getpid(), getppid(), getpgrp());
		exit(0);
	}

    while ((val = wait(&status)) != -1) {
        if (WIFEXITED(status))
            printf("\nДочерний процесс (%d) завершён нормально c кодом (%d).\n",
                   val, WEXITSTATUS(status));
        else if (WIFSIGNALED(status))
            printf("\nДочерний процесс (%d) завершён неперехватываемым сигналом №(%d)\n", val, WTERMSIG(status));
        else if (WIFSTOPPED(status))
            printf("\nДочерний процесс (%d) остановился, номер сигнала: (%d)\n", val, WSTOPSIG(status));
    }
    
    printf("\nПредок:\
           \nСобственный идентификатор (pid) = %d\
           \nИдентификатор группы = %d\
           \nИдентификатор потомка child_1 (pid) = %d\
           \nИдентификатор потомка child_2 (pid) = %d\n",
           getpid(), getpgrp(), child_1, child_2);
	return 0;
}
