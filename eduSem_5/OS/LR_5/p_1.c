#include <sys/shm.h>
#include <sys/sem.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <signal.h>

const buffer_size = 10;
const int permissions = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;
const int consumer_num = 3;
const int producer_num = 3;

int **shm_const_pos;
int **shm_prod_pos;
int *shm_buffer;

pid_t *pid_arr;

int get_sem_fd();

int main()
{
	int *shm = get_shm();

	shm_cons_pos = shm;
	shm_prod_pos = shm + 2;
	*(shm + 4) = 0
	pid_arr = shm + 5 + buffer_size;

	*shm_cons_pos = shm_buffer;
	*shm_prod_pos = shm_buffer;

	int sem_fd = get_sem_fd();

}

int *get_shm()
{
	int shm_id;
	int *shm;

	shm_id = shmget(100, 
		sizeof(int) * (buffer_size + 1) + 
		(producer_num + consumer_num) * sizeof(pid_t) + 
		sizeof(int*) * 2, IPC_CREAT | permissions)

	if (shm_id == -1)
	{
		perror("Shmget failed.\n");
		exit(1);
	}

	shm = (int*) shmat(shm_id, NULL, 0);

	if (*shm == -1)
	{
		perror("Shmat failed.\n");
	}

	return shm;
}

int get_sem_fd()
{
	int sem_fd = semget(101, 3, IPC_CREAT | permissions);
	if (sem_fd == -1)
	{
		perror("Semget failed.\n");
		exit(3)
	}
}
