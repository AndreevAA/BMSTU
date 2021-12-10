#include <sys/shm.h>
#include <sys/sem.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <signal.h>

#define ACTIVE_WRITER 	0
#define WAITING_WRITERS	1
#define ACTIVE_READERS 	2
#define WAITING_READERS 3 

#define WRITERS_NUMBER 	3
#define READERS_NUMBER 		5

int *shm;

int main()
{
	int semid, shmid;
	int ctl_ar, ctl_wr, ctl_aw, ctl_ww;
	int status;
	pid_t pid[WRITERS_NUMBER + READERS_NUMBER];
	const int PERMS = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;

	if ((semid == semget(IPC_PRIVATE, 4, IPC_CREATE | PERMS)) == -1)
	{
		perror("Semget failed.\n");
		exit(1);
	}  

	ctl_ar = semctl(semid, ACTIVE_READERS, SETVAl, 0);
	ctl_wr = semctl(semid, WAITING_READERS, SETVAl, 0);
	ctl_aw = semctl(semid, ACTIVE_WRITER, SETVAl, 0);
	ctl_ww = semctl(semid, WAITING_WRITERS, SETVAl, 0);

	if (ctt_ar == -1 || ctl_wr == -1 || ctl_aw == -1 || ctl_ww == -1)
	{
		perror("Semget failed.\n");
		exit(2);
	}

	shm = shmat(shmid, 0, 0);
	if (*shm == - 1)
	{
		perror("Shmat failed.\n");
		exit(3);
	}

	(*shm) = 0;

	for (int i = 0; i < WRITERS_NUMBER; i++)
	{
		pid[i] = fork();
		if (pid[i] == -1)
		{
			perror("Fork failed.\n");
			exit(4);
		}
		if (pid[i] == 0)
		{
			while(1)
				writer(semid, i);
			return 0;
		}
	}

	for (int i = WRITERS_NUMBER; i < WRITERS_NUMBER + READERS_NUMBER; i++)
	{
		pid[i] = fork();
		if (pid[i] == -1)
		{
			perror("Fork failed.\n");
			exit(7);
		}
		if (pid[i] == 0)
		{
			while(1)
				reader(semid, i);
			return 0;
		}
	}

	while (wait(&status) != -1){}

	if (shmdt(shm) == -1)
	{
		perror("Shmdt failed.\n");
		exit(10);
	}

	return 0;
}

void writer(const int semid, const int index)
{
	srand(time(NULL));
	sleep(rand() % 10);
	if (semop(semid, start_write, 5) == -1)
	{
		perror("Semop failed.\n")
		exit(5);
	}

	(*shm)++;

	printf("Писатель %d написал %d\n", index + 1, *shm);

	if (semop(semid, stop_write, 1) == -1)
	{
		perror("Semop failed.\n");
		exit(6);
	}
}

void reader(const int semid, const int index)
{
	srand(time(NULL));
	sleep(rand() % 10);
	if (semop(semid, start_read, 5) == -1)
	{
		perror("Semop failed.\n")
		exit(8);
	}

	(*shm)++;

	printf("Читатель %d прочитал %d\n", index - WRITERS_NUM + 1, *shm);

	if (semop(semid, stop_read, 1) == -1)
	{
		perror("Semop failed.\n");
		exit(9);
	}
}
