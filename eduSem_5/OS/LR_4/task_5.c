#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

int child_1_write_flag = 0;
int child_2_write_flag = 0;

void quit_signal_handler(int signum)
{
    child_1_write_flag = 1;
    child_2_write_flag = 1;
}

int main()
{
	int val, status, fd[2];
    pid_t child_1, child_2;

	if (pipe(fd) == -1)
	{
        perror("Pipe failed");
		exit(1);
	}
    signal(SIGQUIT, quit_signal_handler);
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
        signal(SIGQUIT, quit_signal_handler);
        sleep(6);
        if (child_1_write_flag == 1)
        {
            char message[] = "(Сообщение от child_1)";
            close(fd[0]);
            write(fd[1], message, sizeof message - 1);
            printf("\nСигнал (Ctrl-\\) пришёл.");
            printf("\nПотомок child_1 написал: %s\n", message);
        }
        else
        {
            printf("\nСигнал (Ctrl-\\) не пришёл.\n");
        }
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
        signal(SIGQUIT, quit_signal_handler);
        sleep(6);
        if (child_2_write_flag == 1)
        {
            char message[] = "(Сообщение от child_2)";
            close(fd[0]);
            write(fd[1], message, sizeof message - 1);
            printf("\nСигнал (Ctrl-\\) пришёл.");
            printf("\nПотомок child_2 написал: %s\n", message);
        }
        else
        {
            printf("\nСигнал (Ctrl-\\) не пришёл.\n");
        }
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
