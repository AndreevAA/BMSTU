#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

int main()
{
	pid_t child_1, child_2;
    int status, val, fd[2];

	if (pipe(fd) == -1)
	{
		perror("Pipe failed");
		exit(1);
	}

	if ((child_1 = fork()) == -1)
	{
		perror("Fork failed");
		exit(2);
	}
	else if (child_1 == 0)
	{
        printf("\nПотомок child_1:\
               \nСобственный идентификатор (pid) = %d\
               \nИдентификатор предка (ppid) = %d\
               \nИдентификатор группы = %d\n",
               getpid(), getppid(), getpgrp());
        char message[] = "(Сообщение от child_1)";
		close(fd[0]);
		write(fd[1], message, sizeof message - 1);
		printf("\nПотомок child_1 написал: %s\n", message);
		exit(0);
	}

	if ((child_2 = fork()) == -1)
	{
		perror("Fork failed");
		exit(3);
	}
	else if (child_2 == 0)
	{
        printf("\nПотомок child_2:\
               \nСобственный идентификатор (pid) = %d\
               \nИдентификатор предка (ppid) = %d\
               \nИдентификатор группы = %d\n",
               getpid(), getppid(), getpgrp());
        char message[] = "(Сообщение от child_2)";
		close(fd[0]);
		write(fd[1], message, sizeof message - 1);
        printf("\nПотомок child_2 написал: %s\n", message);
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
    
    close(fd[1]);
    char message[100];
    read(fd[0], message, sizeof message);
    printf("\nПредок прочитал: %s\n", message);

	return 0;
}
