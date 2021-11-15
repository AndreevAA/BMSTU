#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define NUMBER_OF_CHILDREN 2

int main()
{
	char *p_exec[NUMBER_OF_CHILDREN] = {
		"meta/average/out/first_thread.o",
		"meta/factorial/out/second_thread.o"
	};

	printf("\nРодитель parent:\
               \nСобственный идентификатор (pid) = %d\
               \nИдентификатор группы = %d\n",
               getpid(), getpgrp());

	for (size_t i = 0; i < NUMBER_OF_CHILDREN; i++) { 
		pid_t child;

		if ((child = fork()) == -1)
		{
			perror("Can't fork");
			exit(1);
		}
		
		else if (child == 0)
		{
	        printf("\nПотомок child_%ld: \
	               \nСобственный идентификатор (pid) = %d\
	               \nИдентификатор предка (ppid) = %d\
	               \nИдентификатор группы = %d\n",
	               i, getpid(), getppid(), getpgrp());
	        
			if (execl(p_exec[i], NULL) == -1)
			{
				perror("exec");
				exit(2);
			}
			
		}
	}

	for (size_t i = 0; i < NUMBER_OF_CHILDREN; i++) { 
		int status = 0;
		int val = 0;

		pid_t childpid = wait(&status);

		printf("\nРодитель parent: child %ld\
               \nСобственный идентификатор (pid) = %d\
               \nСтатус = %d\n",
               i + 1, childpid, status);

		if (WIFSIGNALED(val)) 
		{
			printf("\nРодитель parent: child %ld\
			 \nКод окончания: %d\n", i + 1, WTERMSIG(val));
		} 
		else if (WIFEXITED(val)) 
		{
			printf("\nРодитель parent: child %ld\
			 \nКод окончания: %d\n", i + 1, WEXITSTATUS(val));
		} 
		else if (WIFSTOPPED(val)) 
		{
			printf("\nРодитель parent: child %ld\
			 \nКод окончания: %d\n", i + 1, WSTOPSIG(val));
		} 
	}

	return 0;
}
