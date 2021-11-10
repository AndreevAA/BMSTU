#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
	pid_t child_1, child_2;

	if ((child_1 = fork()) == -1)
	{
		perror("Can't fork");
		exit(1);
	}
	else if (child_1 == 0)
	{
		printf("\nПотомок child_1:\
               \nСобственный идентификатор (pid) = %d\
               \nИдентификатор предка (ppid) = %d\
               \nИдентификатор группы = %d\n",
               getpid(), getppid(), getpgrp());
        sleep(2);
        printf("\nПотомок child_1:\
               \nСобственный идентификатор (pid) = %d\
               \nИдентификатор предка (ppid) = %d\
               \nИдентификатор группы = %d\n",
               getpid(), getppid(), getpgrp());
        exit(0);
	}

	if ((child_2 = fork()) == -1)
	{
		perror("Can't fork");
		exit(1);
	}
	else if (child_2 == 0)
	{
        printf("\nПотомок child_2:\
               \nСобственный идентификатор (pid) = %d\
               \nИдентификатор предка (ppid) = %d\
               \nИдентификатор группы = %d\n",
               getpid(), getppid(), getpgrp());
		sleep(2);
        printf("\nПотомок child_2:\
               \nСобственный идентификатор (pid) = %d\
               \nИдентификатор предка (ppid) = %d\
               \nИдентификатор группы = %d\n",
               getpid(), getppid(), getpgrp());
        exit(0);
	}
	printf("\nПредок:\
           \nСобственный идентификатор (pid) = %d\
           \nИдентификатор группы = %d\
           \nИдентификатор потомка child_1 (pid) = %d\
           \nИдентификатор потомка child_2 (pid) = %d\n",
           getpid(), getpgrp(), child_1, child_2);
	return 0;
}
